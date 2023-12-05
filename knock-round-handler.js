let knockMatches = [];
let allKnockMatches = [];

const Winner1 = 0;
const Winner2 = 1;
const Draw = 2;

let WINNER = null;
let knockInput1;
let knockInput2;

let currentKnockRoundIndex = 0;
let currentKnockMatchIndex = 0;
let currentMatchesCount = 8;

let currentMode = "match";
let roundEnd = false;

let finalists = [];
let winners = [];
let losers = [];

let names = [
    "1/8 Finału",
    "Ćwierćfinały",
    "Półfinały",
    "Mecz o 3M",
    "Finał"
];

function prepareKnockRound() {
    groupPlayButton.innerHTML = "Rozegraj Mecz";

    if(TYPE == TYPE_MUNDIAL) {
        createKnockMundial();
    } else {
        createKnockEuro();
    }

    groupPlayButton.onclick = function () {
        playKnockMatch("match");
    }

    createKnockMatch(knockMatches[0], 0);
    createKnockMatch(knockMatches[1], 1);
    setKnockMatchActive(currentKnockMatchIndex, true);
}

function createKnockMundial() {
    getId("group-div").remove();
    getId("matches-div").remove();

    knockMatches = [
        new Match(knockQualified['A'][0], knockQualified['B'][1]),
        new Match(knockQualified['C'][0], knockQualified['D'][1]),

        new Match(knockQualified['E'][0], knockQualified['F'][1]),
        new Match(knockQualified['G'][0], knockQualified['H'][1]),

        new Match(knockQualified['B'][0], knockQualified['A'][1]),
        new Match(knockQualified['D'][0], knockQualified['C'][1]),

        new Match(knockQualified['F'][0], knockQualified['E'][1]),
        new Match(knockQualified['H'][0], knockQualified['G'][1])
    ];
}

function createKnockEuro() {
    getId("group-table").remove();
    let extraGroups = [];

    for(let i = 0; i < 4; i++) {
        let team = extraTeams[i];
        knockQualified[team.group_ch].push(team);
        extraGroups.push(team.group_ch);
    }
    extraGroups.sort();

    let option = thirdPlacesOptions.find(function(elem) {
        let array = Array.from(elem).sort();
        
        for(let i = 0; i < extraGroups.length; i++) {
            if(array[i] != extraGroups[i]) {
                return false;
            }
        }
        return true;
    });

    const PAIR_PLACE = 0;
    const PAIR_GROUP = 1;

    for(let i = 0; i < premiumFirstPlaces.length; i++) {
        let p1 = premiumFirstPlaces[i];
        let p3 = option[i];

        let match = knockPairs.find((m) => m[0][0] == "1" && m[0][1] == p1);
        match[1] += p3;
    }

    for(let i = 0; i < knockPairs.length; i++) {
        let t1 = knockPairs[i][0];
        let t2 = knockPairs[i][1];

        let team1 = knockQualified[t1[PAIR_GROUP]][t1[PAIR_PLACE] - 1];
        let team2 = knockQualified[t2[PAIR_GROUP]][t2[PAIR_PLACE] - 1];

        knockMatches.push(new Match(team1, team2));
    }
}

function prepareThirdPlaceTable() {
    getId("group-div").remove();
    getId("matches-div").remove();

    groupPlayButton.innerHTML = "Zatwierdź";
    nameDiv.innerHTML = "Drużyny z 3M";

    let table = document.createElement("table");
    table.id = "group-table";
    table.className = "extra-teams-table";
    
    var groupTableText = "";
    for(var i = 0; i < extraTeams.length; i++) {
        var color = (i < 4) ? "dark" : "light";
        if(i == 3) color += " qualify-border";

        groupTableText += 
        `<tr class="${color}">
            <td class="flag-elem">
                <img src='${FLAGS_PATH}${extraTeams[i].imgLink}'>
            </td>
            <td class="name-elem">${extraTeams[i].teamName}</td>
            <td class="points-elem">${extraTeams[i].points()}</td>
            <td class="goals-elem">
                ${extraTeams[i].goalsScored()}-${extraTeams[i].goalsLost()}
            </td>
            <td class='group-elem'>${extraTeams[i].group_ch}</td>
        </tr>`;
    }
    table.innerHTML = groupTableText;
    getId("phase").after(table);

    groupPlayButton.onclick = prepareKnockRound;
}

function createKnockMatch(knockMatchObj, pageIndex) {
    nameDiv.innerHTML = names[currentKnockRoundIndex];

    var team1 = knockMatchObj.team1;
    var team2 = knockMatchObj.team2;

    var teamName1 = team1.teamName;
    var teamName2 = team2.teamName;

    var link1 = FLAGS_PATH + team1.imgLink;
    var link2 = FLAGS_PATH + team2.imgLink;

    var knockMatch = document.createElement("div");
    knockMatch.className = "knock-match";
    knockMatch.id = "knock-match-" + pageIndex;
    knockMatch.style.width = "945px";

    knockMatch.style.marginLeft = "auto";
    knockMatch.style.marginRight = "auto";

    var random1 = getRandom(0, 3);
    var random2 = getRandom(0, 3);

    //DELETE
    random1 = "";
    random2 = "";
    //

    knockMatch.innerHTML =
        `<div class="team-1 team-div">
            <img src="${link1}" class="flag">
            <div class="team-name">${teamName1}</div>
        </div>

        <div class="center-div">
            <div class="input-div" style="text-align: right;">
                <input type="number" disabled value="${random1}">
            </div>
            <div class="text-div">-</div>
            <div class="input-div" style="text-align: left;">
                <input type="number" disabled value="${random2}">
            </div>
        </div>

        <div class="team-2 team-div">
            <img src="${link2}" class="flag">
            <div class="team-name">${teamName2}</div>
        </div>
        <div style="clear: both;">
    </div>`;
    contentDiv.insertBefore(knockMatch, groupPlayButton);
}

function setKnockMatchActive(matchIndex, active) {

    var pageMatchIndex = (matchIndex % 2);
    var matchDiv = getId("knock-match-" + pageMatchIndex);

    knockInput1 = matchDiv.querySelectorAll("input")[0];
    knockInput2 = matchDiv.querySelectorAll("input")[1];

    if (active) {
        knockInput1.onkeydown = function (event) {
            if (event.key != "Backspace" && (!isNumber(event.key) || knockInput1.value.length > 0)) {
                event.preventDefault();
            }
        }
        knockInput2.onkeydown = function (event) {
            if (event.key != "Backspace" && (!isNumber(event.key) || knockInput2.value.length > 0)) {
                event.preventDefault();
            }
        }

        matchDiv.style.setProperty("box-shadow", "15px 15px 25px black");
        matchDiv.style.setProperty("background", "linear-gradient(to right bottom, #c6c6c6, #737373)");

    } else {
        matchDiv.style.setProperty("box-shadow", "5px 5px 25px black");
        matchDiv.style.setProperty("background", "linear-gradient(to right bottom, #aeaeae, #595959)");
    }

    knockInput2.disabled = !active;
    knockInput1.disabled = !active;
    knockInput1.focus();
}

function playKnockMatch() {
    var score1 = parseInt(knockInput1.value);
    var score2 = parseInt(knockInput2.value);

    var bufferWinners = [];
    var scoreTotal = -1;

    if (isNaN(score1) || isNaN(score2)) return scoreTotal;

    if (score1 == score2) {
        scoreTotal = Draw;

        if (currentMode == "match") {
            knockMatches[currentKnockMatchIndex].playMatch(score1, score2);
            currentMode = "penalty";
            createPenalty();
        }
        return scoreTotal;
    }

    if (currentMode == "penalty") {
        groupPlayButton.innerHTML = "Rozegraj Mecz";
        knockMatches[currentKnockMatchIndex].playPenalty(score1, score2);
        currentMode = "match";

    } else if (currentMode == "match") {
        knockMatches[currentKnockMatchIndex].playMatch(score1, score2);
    }

    if (currentKnockRoundIndex == 2) {
        var knockOut = knockMatches[currentKnockMatchIndex];

        if (score1 > score2) {
            scoreTotal = Winner1;

            finalists.push(knockOut.team1);
            losers.push(knockOut.team2);
        } else if (score1 < score2) {
            scoreTotal = Winner2;

            finalists.push(knockOut.team2);
            losers.push(knockOut.team1);
        }
    } else {
        if (score1 > score2) {
            scoreTotal = Winner1;
            winners.push(knockMatches[currentKnockMatchIndex].team1);

        } else if (score1 < score2) {
            scoreTotal = Winner2;
            winners.push(knockMatches[currentKnockMatchIndex].team2);
        }
    }

    setKnockMatchActive(currentKnockMatchIndex, false);

    currentKnockMatchIndex++;
    if (currentKnockMatchIndex >= currentMatchesCount) {

        allKnockMatches[currentKnockRoundIndex] = knockMatches;
        knockMatches = [];

        const SEMI_FINALS = 2;
        const THIRD_PLACE_MATCH = 3;

        if(currentKnockRoundIndex == SEMI_FINALS) {
            if(TYPE == TYPE_MUNDIAL) {
                knockMatches.push(new Match(losers[0], losers[1]));
            } else {
                knockMatches.push(new Match(finalists[0], finalists[1]));
                currentKnockRoundIndex++;
            }
        } else if(currentKnockRoundIndex == THIRD_PLACE_MATCH) {
            knockMatches.push(new Match(finalists[0], finalists[1]))
        } else {
            for (var i = 0; i < winners.length / 2; i++) {

                var teamObj1 = winners[i * 2];
                var teamObj2 = winners[i * 2 + 1];
                knockMatches.push(new Match(teamObj1, teamObj2));
            }

            bufferWinners = winners;
            winners = [];
        }

        currentKnockMatchIndex = 0;
        currentKnockRoundIndex++;
        
        if (currentMatchesCount >= 2) {
            currentMatchesCount /= 2;
        }
    }

    if (currentKnockMatchIndex % 2 == 0) {
        var div1 = getId("knock-match-0");
        var div2 = getId("knock-match-1");

        if(div1) div1.remove();
        if(div2) div2.remove();

        if (currentKnockRoundIndex >= names.length) {
            WINNER = bufferWinners[bufferWinners.length - 1];
            endGame();
            return scoreTotal;
        }

        if (currentMatchesCount == 1) {
            createKnockMatch(knockMatches[currentKnockMatchIndex], 0);
            setKnockMatchActive(currentKnockMatchIndex, true);
            return scoreTotal;
        }

        createKnockMatch(knockMatches[currentKnockMatchIndex], 0);
        createKnockMatch(knockMatches[currentKnockMatchIndex + 1], 1);

    }
    setKnockMatchActive(currentKnockMatchIndex, true);
    return scoreTotal;
}

function createPenalty() {
    var matchDiv = document.querySelector("#knock-match-" + (currentKnockMatchIndex % 2) + " .center-div");
    matchDiv.classList.add("penalty-div");

    var random1 = getRandom(0, 5);
    var random2 = getRandom(0, 5);

    if (random1 == random2) {
        var randomYm = getRandom(0, 1);
        if (randomYm == 0) random1++;
        else if (randomYm == 1) random2++;
    }

    knockInput1.value = random1;
    knockInput2.value = random2;

    // DELETE
    knockInput1.value = "";
    knockInput2.value = "";

    knockInput1.focus();
    groupPlayButton.innerHTML = "Rozegraj Karne";
}

function endGame() {
    roundEnd = true;
    groupPlayButton.remove();

    getId("phase-div").innerHTML = "Zwycięzca";
    getId("content").style.height = "400px";

    var flagImage = document.createElement("img");
    flagImage.src = FLAGS_PATH + WINNER.imgLink;
    flagImage.id = "winner-flag";

    var nameDiv = document.createElement("div");
    nameDiv.id = "winner-name";
    nameDiv.innerHTML = WINNER.teamName;

    contentDiv.appendChild(flagImage);
    contentDiv.appendChild(nameDiv);
    createObject(groups, allKnockMatches);
}
