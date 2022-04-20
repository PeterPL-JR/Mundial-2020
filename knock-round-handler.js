let knockMatches = [];

let knockInput1;
let knockInput2;

let currentKnockRoundIndex = 0;
let currentKnockMatchIndex = 0;
let currentMatchesCount = 8;

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

// for(var i = 0; i < 8; i++) {
//     for(var j = 0; j < 6; j++) {
//         playGroupMatch();
//     }
//     loadNextGroup();
// }

function prepareKnockRound() {

    getElem("group-div").remove();
    getElem("matches-div").remove();

    groupPlayButton.innerHTML = "Rozegraj Mecz";

    // for(var key in knockQualified) {
    //     console.log("Grupa " + key);
    //     for(var team in knockQualified[key]) {
    //         console.log((team + 1) + " - " + knockQualified[key][team].fullName);
    //     }
    // }

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

    // for(var match of knockMatches) {
    //     console.log(match);
    // }

    groupPlayButton.onclick = playKnockMatch;

    createKnockMatch(knockMatches[0], 0);
    createKnockMatch(knockMatches[1], 1);
    setKnockMatchActive(currentKnockMatchIndex, true);
}

function createKnockMatch(knockMatchObj, pageIndex) {
    roundNameDiv.innerHTML = names[currentKnockRoundIndex];

    console.log(knockMatches);

    var team1 = teams[knockMatchObj.team1];
    var team2 = teams[knockMatchObj.team2];

    var teamName1 = team1.fullName;
    var teamName2 = team2.fullName;

    var link1 = "flags/" + team1.link;
    var link2 = "flags/" + team2.link;

    var knockMatch = document.createElement("div");
    knockMatch.className = "knock-match";
    knockMatch.id = "knock-match-" + pageIndex;
    knockMatch.style.width = "945px";

    knockMatch.style.marginLeft = "auto";
    knockMatch.style.marginRight = "auto";

    knockMatch.innerHTML = 
        `<div class="team-1 team-div">
            <img src="${link1}" class="flag">
            <div class="team-name">${teamName1}</div>
        </div>

        <div class="center-div">
            <div class="input-div" style="text-align: right;">
                <input type="number" disabled>
            </div>
            <div class="text-div">-</div>
            <div class="input-div" style="text-align: left;">
                <input type="number" disabled>
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
    var matchDiv = getElem("knock-match-" + pageMatchIndex);

    knockInput1 = matchDiv.querySelectorAll("input")[0];
    knockInput2 = matchDiv.querySelectorAll("input")[1];

    if(active) {
        knockInput1.onkeydown = function (event) {
            if (event.key != "Backspace" && (numbers.indexOf(event.key) == -1 || knockInput1.value.length > 0)) {
                event.preventDefault();
            }
        }
        knockInput2.onkeydown = function (event) {
            if (event.key != "Backspace" && (numbers.indexOf(event.key) == -1 || knockInput2.value.length > 0)) {
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

    if(score1 == score2) return;

    if(currentKnockRoundIndex == 2) {
        var knockOut = knockMatches[currentKnockMatchIndex];

        if(score1 > score2) {
            finalists.push(knockOut.team1);
            losers.push(knockOut.team2);
        } else if(score1 < score2) {
            finalists.push(knockOut.team2);
            losers.push(knockOut.team1);
        }
    } else {
        if(score1 > score2) {
            winners.push(knockMatches[currentKnockMatchIndex].team1);
        } else if(score1 < score2) {
            winners.push(knockMatches[currentKnockMatchIndex].team2);
        }
    }

    console.log(winners);

    setKnockMatchActive(currentKnockMatchIndex, false);

    currentKnockMatchIndex++;
    if(currentKnockMatchIndex >= currentMatchesCount) {
        
        knockMatches = [];

        if(currentKnockRoundIndex == 2) {
            knockMatches.push(new Match(teams[losers[0]], teams[losers[1]]));
            losers = [];
        } else if(currentKnockRoundIndex == 3) {
            knockMatches.push(new Match(teams[finalists[0]], teams[finalists[1]]));
        } else {
            for(var i = 0; i < winners.length / 2; i++) {
                
                var teamObj1 = teams[winners[i * 2]];
                var teamObj2 = teams[winners[i * 2 + 1]];
                knockMatches.push(new Match(teamObj1, teamObj2));
            }
            winners = [];
        }

        currentKnockMatchIndex = 0;
        currentKnockRoundIndex++;

        if(currentMatchesCount >= 2) {
            currentMatchesCount /= 2;
        }
    }

    if(currentKnockMatchIndex % 2 == 0) {
        var div1 = getElem("knock-match-0");
        var div2 = getElem("knock-match-1");

        div1.remove();
        if(currentKnockRoundIndex <= 3) {
            div2.remove();
        }

        if(currentKnockRoundIndex >= names.length) {
            endGame();
            return;
        }

        if(currentMatchesCount == 1) {
            createKnockMatch(knockMatches[currentKnockMatchIndex], 0);
            setKnockMatchActive(currentKnockMatchIndex, true);
            return;
        }

        createKnockMatch(knockMatches[currentKnockMatchIndex], 0);
        createKnockMatch(knockMatches[currentKnockMatchIndex + 1], 1);

    }
    setKnockMatchActive(currentKnockMatchIndex, true);
}

function endGame() {
    groupPlayButton.remove();
}