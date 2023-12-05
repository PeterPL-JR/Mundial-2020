let playOffsPairs = [
    [
        ["pol", "est"],
        ["wal", "fin"]
    ],
    [
        ["isr", "ice"],
        ["bih", "ukr"]
    ],
    [
        ["geo", "lux"],
        ["gre", "kaz"]
    ]
];
let final = [];

let hosts = [1, 1, 0];

let playOffPathIndex = 0;
let currentMatch = 0;
let matchMode = "match";

let playOffsWinners = [];
let winnersGroups = ["D", "E", "F"];

const PLAY_OFF_SEMI_FINAL_1 = 0;
const PLAY_OFF_SEMI_FINAL_2 = 1;

const PLAY_OFF_FINAL = 2;

let playButton;

function preparePlayOffs() {
    createPathPage(0);
}

function createPathPage(index) {
    nameDiv.innerHTML = "Baraże - " + toChar(index);
    playButton = document.getElementById("play-button");
    final = [];

    createTitleDiv("Półfinały", "semi-final-title");
    createSemiFinalMatch(playOffsPairs[index][0][0], playOffsPairs[index][0][1], PLAY_OFF_SEMI_FINAL_1);
    createSemiFinalMatch(playOffsPairs[index][1][0], playOffsPairs[index][1][1], PLAY_OFF_SEMI_FINAL_2);
    
    createTitleDiv("Finał", "final-title");
    createFinalMatch();

    setKnockMatchActive(PLAY_OFF_SEMI_FINAL_1, true);
    playButton.onclick = scoreMatch;
}

function scoreMatch() {
    let matchDiv = document.querySelector(`#knock-match-${currentMatch}`);
    
    let score1 = parseInt(matchDiv.querySelectorAll("input")[0].value);
    let score2 = parseInt(matchDiv.querySelectorAll("input")[1].value);
    if(isNaN(score1) || isNaN(score2)) return;

    if(matchMode == "match") {
        if(score1 != score2) {
            endMatch(currentMatch, score1 > score2 ? 0 : 1);
        } else {
            createPenalty(currentMatch);
            matchMode = "penalty";
            return;
        }
    }
    if(matchMode == "penalty") {
        if(score1 != score2) {
            endMatch(currentMatch, score1 > score2 ? 0 : 1);
            matchMode = "match";
            playButton.innerHTML = "Rozegraj mecz";
        } else {
            return;
        }
    }
}

function createSemiFinalMatch(teamId1, teamId2, index) {
    let team1 = teams[findTeamIndex(teams, teamId1)];
    let team2 = teams[findTeamIndex(teams, teamId2)];
    
    let knockMatch = knockMatchDiv(index, team1.teamName, team2.teamName, FLAGS_PATH + team1.imgLink, FLAGS_PATH + team2.imgLink);
    contentDiv.insertBefore(knockMatch, playButton);

    knockMatch.classList.add("play-off-semi-final");
}

function createFinalMatch() {
    let knockMatch = knockMatchDiv(PLAY_OFF_FINAL, "?", "?", MAIN_DIR + "images/flag.png",  MAIN_DIR + "images/flag.png");
    contentDiv.insertBefore(knockMatch, playButton);

    knockMatch.classList.add("play-off-final");

    knockMatch.querySelector(".team-1").classList.add("match-inactive");
    knockMatch.querySelector(".team-2").classList.add("match-inactive");
}

function createTitleDiv(title, className) {
    let div = document.createElement("div");
    div.className = `phase play-offs-title ${className}`;
    div.innerHTML = `<img class='phase-img' src="../../images/ball.png"><div class='phase-div'>${title}</div><div style="clear: both"></div>`;
    contentDiv.insertBefore(div, playButton);
}

function endMatch(matchIndex, winner) {
    setKnockMatchActive(currentMatch, false);

    if(matchIndex == PLAY_OFF_FINAL) {
        endPlayOffsPath(final[winner]);
    } else {
        setFinalTeam(matchIndex, winner);
        currentMatch++;
        setKnockMatchActive(currentMatch, true);
    }
}

function setFinalTeam(semiFinalIndex, teamIndex) {
    let teamId = playOffsPairs[playOffPathIndex][semiFinalIndex][teamIndex];
    let t = teams[findTeamIndex(teams, teamId)];

    let placeIndex = hosts[playOffPathIndex] == semiFinalIndex ? 0 : 1;
    final[placeIndex] = teamId;

    let matchDiv = document.getElementById(`knock-match-2`);
    matchDiv.querySelectorAll("img")[placeIndex].src = FLAGS_PATH + t.imgLink;
    matchDiv.querySelectorAll(".team-name")[placeIndex].innerHTML = t.teamName;

    matchDiv.querySelector(`.team-${placeIndex + 1}`).classList.remove("match-inactive");
}

function endPlayOffsPath(winner) {
    playOffsWinners.push(winner);
    
    for(let match of getClass("knock-match")) {
        match.remove();
    }
    for(let title of getClass("play-offs-title")) {
        title.remove();
    }
    
    if(playOffPathIndex == 2) {
        endPlayOffs();
        return;
    }

    playOffPathIndex++;
    currentMatch = 0;
    createPathPage(playOffPathIndex);
}

function endPlayOffs() {
    for(let i = 0; i < playOffsWinners.length; i++) {
        teams[findTeamIndex(teams, playOffsWinners[i])].group_ch = winnersGroups[i];
    }
    teams = teams.filter((t) => t.group_ch);

    prepareGroupRound();
}