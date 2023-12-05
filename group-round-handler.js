function playGroupMatch() {
    var score1 = parseInt(inputs[currentMatchIndex][0].value);
    var score2 = parseInt(inputs[currentMatchIndex][1].value);

    if(isNaN(score1) || isNaN(score2)) return;

    let sortKeys = (TYPE == TYPE_MUNDIAL) ? ["points", "goals", "goalsScored", "headToHead"] : ["points", "headToHead", "goals", "goalsScored", "wins"];

    let activeGroup = groups[toChar(currentGroupIndex)];
    concatArray(activeGroup.matches)[currentMatchIndex].playMatch(score1, score2);
    activeGroup.teams = sortTeams(activeGroup.teams, sortKeys, activeGroup.matches);
    
    createGroupTable(activeGroup);

    extraTeams = [];
    for(let key in groups) {
        extraTeams.push(groups[key].teams[2]);
    }
    extraTeams = sortTeams(extraTeams, ["points", "goals", "goalsScored"]);

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

    if(toChar(currentGroupIndex) == LAST_GROUP) {
        if(TYPE == TYPE_EURO) {
            prepareThirdPlaceTable();
        } else {
            prepareKnockRound();
        }
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

function findTeamIndex(teams, id) {
    for(var i = 0; i < teams.length; i++) {
        if(teams[i].id == id) return i;
    }
}

function createGroupTable(group) {

    var table = getId("group-table");
    var records = table.querySelectorAll("tr");
    var teams = group.teams;

    for(var i = 0; i < 4; i++) {

        var image = records[i].querySelector("img");
        image.src = FLAGS_PATH + teams[i].imgLink;

        var nameElem = records[i].querySelector(".name-elem");
        var pointsElem = records[i].querySelector(".points-elem");
        var goalsElem = records[i].querySelector(".goals-elem");

        nameElem.innerHTML = teams[i].teamName;
        pointsElem.innerHTML = teams[i].points();
        goalsElem.innerHTML = teams[i].goalsScored() + "-" + teams[i].goalsLost();
    }
}

function toChar(groupIndex) {
    return String.fromCharCode(groupIndex + 65);
}

function toInt(groupName) {
    return groupName.charCodeAt(0) - 65;
}