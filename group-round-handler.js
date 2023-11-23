function scoreMatchTeam(score1, score2, team1, team2) {

    team1.stats.goalsScored += score1;
    team1.stats.goalsLost += score2;
    
    team2.stats.goalsScored += score2;
    team2.stats.goalsLost += score1;

    team1.stats.goals = team1.stats.goalsScored - team1.stats.goalsLost;
    team2.stats.goals = team2.stats.goalsScored - team2.stats.goalsLost;

    if(score1 > score2) {

        team1.stats.points += 3;
        team1.stats.wins += 1;
        team2.stats.losses += 1;

    } else if(score1 < score2) {

        team2.stats.points += 3;
        team2.stats.wins += 1;
        team1.stats.losses += 1;
        
    } else if(score1 == score2) {
        
        team1.stats.points += 1;
        team2.stats.points += 1;

        team1.stats.draws += 1;
        team2.stats.draws += 1;
    }
}

function playGroupMatch() {
    var score1 = parseInt(inputs[currentMatchIndex][0].value);
    var score2 = parseInt(inputs[currentMatchIndex][1].value);

    if(isNaN(score1) || isNaN(score2)) return;

    var activeGroup = groups[toChar(currentGroupIndex)];
    activeGroup.matches[currentMatchIndex].playMatch(score1, score2);

    var activeMatch = activeGroup.matches[currentMatchIndex];
    var teamIndex1 = findTeamIndex(activeGroup.teams, activeMatch.team1);
    var teamIndex2 = findTeamIndex(activeGroup.teams, activeMatch.team2);

    var team1 = activeGroup.teams[teamIndex1];
    var team2 = activeGroup.teams[teamIndex2];
    
    scoreMatchTeam(score1, score2, team1, team2);
    sortGroup(activeGroup, currentGroupIndex);
    createTable(activeGroup);

    setGroupMatchActive(currentMatchIndex, false);
    currentMatchIndex++;
    
    if(currentMatchIndex >= 6) {

        groupPlayButton.innerHTML = "Zatwierdź";
        groupPlayButton.onclick = loadNextGroup;
        return;
    }
    setGroupMatchActive(currentMatchIndex, true);
}

function loadNextGroup() {

    var endedGroup = groups[toChar(currentGroupIndex)];
    knockQualified[toChar(currentGroupIndex)] = [
        endedGroup.teams[0],
        endedGroup.teams[1],
    ];

    if(toChar(currentGroupIndex) == "H") {
        prepareKnockRound();
        return;
    }

    currentMatchIndex = 0;
    currentGroupIndex++;

    groupPlayButton.innerHTML = "Rozegraj Mecz";
    groupPlayButton.onclick = playGroupMatch;
    createGroupPage(toChar(currentGroupIndex));
}

function setGroupMatchActive(matchIndex, active) {

    var input1 = inputs[matchIndex][0];
    var input2 = inputs[matchIndex][1];

    if(active) {
        input1.onkeydown = function (event) {
            if (event.key != "Backspace" && (!isNumber(event.key) || input1.value.length > 0)) {
                event.preventDefault();
            }
        }
        input2.onkeydown = function (event) {
            if (event.key != "Backspace" && (!isNumber(event.key) || input2.value.length > 0)) {
                event.preventDefault();
            }
        }

    }
    groupDivs[matchIndex].id = (active) ? "active" : "";

    input2.disabled = !active;
    input1.disabled = !active;
    input1.focus();
}

function consoleGroup(group) {
    console.log(" T  P  + -  V D L");
    for(var team of group.teams) {
        var consoleText = team.name + " ";
        for(var key in team.stats) {
            consoleText += team.stats[key] + " " + (key == "points" || key == "goalsLost" ? " " : "");
        }
        console.log(consoleText);
    }
    console.log("\n");
}

function findTeamIndex(teams, teamName) {
    for(var i = 0; i < teams.length; i++) {
        if(teams[i].name == teamName) return i;
    }
}

function sortGroup(group, groupIndex) {

    group.teams.sort(function(x, y) {
        return y.stats.points - x.stats.points;
    });

    var teams = group.teams;
    var pointGroups = [];

    for(var i = 0; i < 10; i++) {
        
        var theSame = [];
        for(var team of teams) {
            if(team.stats.points == i) {
                theSame.push(team);
            }
        }

        theSame.sort(function(x, y) {
            var xGoals = x.stats.goalsScored - x.stats.goalsLost;
            var yGoals = y.stats.goalsScored - y.stats.goalsLost;
        
            return yGoals - xGoals;
        });

        if(theSame.length >= 1) {
            theSame.sort(function(x, y) {
                return y.stats.goals - x.stats.goals;
            });
            pointGroups.push(checkGoalsScored(theSame));
        }
    }

    var newTeams = [];
    for(var i = pointGroups.length - 1; i >= 0; i--) {
        for(var team of pointGroups[i]) {
            newTeams.push(team);
        }
    }
    groups[toChar(groupIndex)].teams = newTeams;
}

function checkGoalsScored(teamsArray) {
   if(teamsArray.length == 1) return teamsArray;

    var goals = [];
    for(var team of teamsArray) {
        if(goals.indexOf(team.stats.goals) != -1) continue;
        goals.push(team.stats.goals);
    }

    var newTeams = [];
    for(var i = 0; i < goals.length; i++) {

        var theSame = [];
        for(var team of teamsArray) {
            if(team.stats.goals == goals[i]) {
                theSame.push(team);
            }
        }
        if(theSame.length == 1) {
            newTeams.push(theSame[0]);
        } else {
            theSame.sort(function(x, y) {
                return y.stats.goalsScored - x.stats.goalsScored;
            });
            for(var theSameTeam of theSame) {
                newTeams.push(theSameTeam);
            }
        }
    }
    return newTeams;
}

function createTable(group) {

    var table = getId("group-table");
    var records = table.querySelectorAll("tr");
    var teams = group.teams;

    for(var i = 0; i < 4; i++) {

        var image = records[i].querySelector("img");
        image.src = FLAGS_PATH + teams[i].link;

        var nameElem = records[i].querySelector(".name-elem");
        var pointsElem = records[i].querySelector(".points-elem");
        var goalsElem = records[i].querySelector(".goals-elem");

        nameElem.innerHTML = teams[i].fullName;
        pointsElem.innerHTML = teams[i].stats.points;
        goalsElem.innerHTML = teams[i].stats.goalsScored + "-" + teams[i].stats.goalsLost;
    }
}

function toChar(groupIndex) {
    return String.fromCharCode(groupIndex + 65);
}

function toInt(groupName) {
    return groupName.charCodeAt(0) - 65;
}