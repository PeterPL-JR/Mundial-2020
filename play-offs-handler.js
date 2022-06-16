const containerDiv = getId("play-off-matches-div");
const playButton = getId("play-button");

var previousScore1;
var previousScore2;

var firstTeam;
var secondTeam;
let qualified = [];

let numbers = [];
for (var i = 0; i < 10; i++) {
    numbers.push(i + "");
}

createMatchDiv('sco', 'ukr', 0, 0);
createMatchDiv('wal', 'NULL', 0, 1);

setMatchActive(0, 0, true);

//DELETE
playMatch(0, 0);
playMatch(1, 1);

playMatch(0, 1);
playMatch(1, 2);

playMatch(0, 3);
playMatch(1, 4);
//DELETE

function createMatchDiv(team1, team2, playOffIndex, matchIndex) {
    currentIndex = playOffIndex;

    var match = document.createElement("div");
    match.className = "play-off-match";
    match.id = "play-off-" + matchIndex;

    var teamName1 = (team1 == "NULL" ? ("Zwycięzca M" + (matchIndex)) : playOffTeams[team1].fullName);
    var teamName2 = (team2 == "NULL" ? ("Zwycięzca M" + (matchIndex)) : playOffTeams[team2].fullName);

    var link1 = (team1 == "NULL" ? "images/flag.png" : "flags/" + playOffTeams[team1].link);
    var link2 = (team2 == "NULL" ? "images/flag.png" : "flags/" + playOffTeams[team2].link);

    var random1 = getRandom(0, 3);
    var random2 = getRandom(0, 3);

    //DELETE
    // random1 = "";
    // random2 = "";
    //DETELE

    match.innerHTML =
        `<div class="team-1 team-div">
        <img src="${link1}" class="flag">
            <div class="team-name">${teamName1}</div>
        </div>

        <div class="center-div">
            <div class="input-div" style="text-align: right;">
                <input type="number" value='${random1}'>
            </div>
            <div class="text-div">-</div>
            <div class="input-div" style="text-align: left;">
                <input type="number" value='${random2}'>
            </div>
        </div>

        <div class="team-2 team-div">
            <img src="${link2}" class="flag">
            <div class="team-name">${teamName2}</div>
        </div>
        <div style="clear: both;">
    </div>`;
    containerDiv.appendChild(match);
    var input1 = document.querySelectorAll("#play-off-" + matchIndex + " input")[0];
    var input2 = document.querySelectorAll("#play-off-" + matchIndex + " input")[1];

    input1.disabled = true;
    input2.disabled = true;
}

function setMatchActive(matchIndex, playOffIndex, active) {
    var matchDiv = getId("play-off-" + matchIndex);
    var input1 = document.querySelectorAll("#play-off-" + matchIndex + " input")[0];
    var input2 = document.querySelectorAll("#play-off-" + matchIndex + " input")[1];

    if (active) {
        input1.onkeydown = function (event) {
            if (event.key != "Backspace" && (numbers.indexOf(event.key) == -1 || input1.value.length > 0)) {
                event.preventDefault();
            }
        }
        input2.onkeydown = function (event) {
            if (event.key != "Backspace" && (numbers.indexOf(event.key) == -1 || input2.value.length > 0)) {
                event.preventDefault();
            }
        }

        matchDiv.style.setProperty("box-shadow", "15px 15px 25px black");
        matchDiv.style.setProperty("background", "linear-gradient(to right bottom, #c6c6c6, #737373)");

    } else {
        matchDiv.style.setProperty("box-shadow", "5px 5px 25px black");
        matchDiv.style.setProperty("background", "linear-gradient(to right bottom, #aeaeae, #595959)");
    }

    input1.disabled = !active;
    input2.disabled = !active;

    playButton.setAttribute("onclick", `playMatch(${matchIndex}, ${playOffIndex});`);
    input1.focus();
}

function playMatch(matchIndex, playOffIndex) {
    var score1 = getScore(matchIndex, 0);
    var score2 = getScore(matchIndex, 1);

    if(isNaN(score1) || isNaN(score2)) return;

    if (playOffIndex == 0) {
        if (score1 != score2) {
            setMatchActive(matchIndex, false);
            if (matchIndex == 0) {
                setMatchActive(matchIndex + 1, 0, true);

                if (score1 > score2) firstTeam = "sco";
                else firstTeam = "ukr"

                var teamDiv2 = document.querySelectorAll("#play-off-1 .team-div")[1];
                teamDiv2.querySelector(".flag").src = "flags/" + playOffTeams[firstTeam].link;
                teamDiv2.querySelector(".team-name").innerHTML = playOffTeams[firstTeam].fullName;
            } else {
                qualified.push((score1 > score2) ? "wal" : firstTeam);
                containerDiv.innerHTML = "";

                createMatchDiv("zae", "aus", 1, 0);
                createMatchDiv("aus", "zae", 1, 1);
                setMatchActive(0, 1, true);
            }
        }
    } else {
        if (matchIndex == 0) {
            previousScore1 = score2;
            previousScore2 = score1;

            setMatchActive(0, playOffIndex, false);
            setMatchActive(1, playOffIndex, true);
        } else {
            var totalScore1 = previousScore1 + score1;
            var totalScore2 = previousScore2 + score2;

            if (totalScore1 != totalScore2) {
                containerDiv.innerHTML = "";
                scorePlayOff(totalScore1, totalScore2, playOffIndex);
            } else {

                var away1 = previousScore1;
                var away2 = score2;

                if (away1 != away2) {
                    containerDiv.innerHTML = "";
                    scorePlayOff(away1, away2, playOffIndex);
                }
            }
        }
    }
}

function scorePlayOff(score1, score2, playOffIndex) {
    if (playOffIndex == 1) {
        var nextTeam1 = "per";
        var nextTeam2 = (score1 > score2) ? "aus" : "zae";
        secondTeam = nextTeam2;

        createMatchDiv(nextTeam1, nextTeam2, 2, 0);
        createMatchDiv(nextTeam2, nextTeam1, 2, 1);
        setMatchActive(0, 2, true);

    } else if (playOffIndex == 2) {
        qualified.push((score1 > score2) ? secondTeam : "per");

        createMatchDiv("cri", "nzl", 3, 0);
        createMatchDiv("nzl", "cri", 3, 1);
        setMatchActive(0, 3, true);

    } else if (playOffIndex == 3) {
        qualified.push((score1 > score2) ? "nzl" : "cri");
        prepareGroupRound();
    }
}

function getScore(matchIndex, scoreIndex) {
    return parseInt(document.querySelectorAll("#play-off-" + matchIndex + " input")[scoreIndex].value);
}