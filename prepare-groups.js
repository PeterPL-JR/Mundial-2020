let contentDiv;
let roundNameDiv;

let nameDiv;
let groupPlayButton;

let groups = {};
let knockQualified = {};
let inputs = [];
let groupDivs = [];

var currentGroupIndex = 0;
var currentMatchIndex = 0;

class Match {
    constructor(teamObj1, teamObj2) {
        var teamName1 = teamObj1.name;
        var teamName2 = teamObj2.name;

        this.team1 = teamName1;
        this.team2 = teamName2;
    
        this.score1 = -1;
        this.score2 = -1;

        this.penalty1 = -1;
        this.penalty2 = -1;
    }

    playMatch(score1, score2) {
        this.score1 = score1;
        this.score2 = score2;
    }

    playPenalty(penalty1, penalty2) {
        this.penalty1 = penalty1;
        this.penalty2 = penalty2;
    }
}

function prepareGroupRound() {
    for(var i = 0; i < 8; i++) {
        var groupCh = String.fromCharCode(i + 65);
        groups[groupCh] = {
            teams: [],
            matches: []
        };

        for(var key in teams) {
            var obj = teams[key];
            if(obj.group_ch == groupCh) {
                obj.stats = {
                    points: 0, goals: 0,
                    
                    goalsScored: 0, goalsLost: 0, 
                    wins: 0, draws: 0, losses: 0
                };
                groups[groupCh].teams.push(obj);
            }
        }
    }

    for(var key in groups) {
        groups[key].teams.sort(function(x, y) {
            return x.group_pos - y.group_pos;
        });
    }

    for(var key in groups) {
        var group = groups[key];
        var t = group.teams;

        group.matches = [
            new Match(t[0], t[1]),
            new Match(t[2], t[3]),

            new Match(t[0], t[2]),
            new Match(t[3], t[1]),

            new Match(t[3], t[0]),
            new Match(t[1], t[2]),
        ];
    }

    var groupDiv = document.createElement("div");
    var matchesDiv = document.createElement("div");

    roundNameDiv.className = "round-name";
    groupDiv.id = "group-div";
    matchesDiv.id = "matches-div";

    contentDiv.appendChild(groupDiv);
    contentDiv.appendChild(matchesDiv);
    createClearBoth(contentDiv);

    var button = document.createElement("button");
    button.id = "play-button";
    button.className = "button";
    button.innerHTML = "Rozegraj Mecz";
    button.onclick = playGroupMatch;

    groupPlayButton = button;
    contentDiv.appendChild(button);

    createGroupPage('A');
}

function createGroupPage(groupChar) {
    nameDiv.innerHTML = "Grupa " + groupChar;
    let group = groups[groupChar];

    let groupTeams = group.teams;
    let matches = group.matches;

    var groupDiv = getId("group-div");
    var matchesDiv = getId("matches-div");

    var groupTableText = "";
    for(var i = 0; i < 4; i++) {
        var color = (i < 2) ? "dark" : "light";

        groupTableText += 
        `<tr class="${color}">
            <td class="flag-elem">
                <img src='/create-mundial/flags/${groupTeams[i].link}'>
            </td>
            <td class="name-elem">${groupTeams[i].fullName}</td>
            <td class="points-elem">${groupTeams[i].stats.points}</td>
            <td class="goals-elem">
                ${groupTeams[i].stats.goalsScored}-${groupTeams[i].stats.goalsLost}
            </td>
        </tr>`;
    }

    var matchesTableText = "";
    for(var i = 0; i < 6; i++) {
        var color = (i % 2 == 0) ? "matchLight" : "light";

        var random1 = getRandom(0, 3);
        var random2 = getRandom(0, 3);

        //DELETE
        random1 = "";
        random2 = "";
        //

        matchesTableText +=
        `<div class="group-match ${color}">
            <div class="matches-flag">
                <img src="/create-mundial/flags/${teams[matches[i].team1].link}">
            </div>
            
            <div class="matches-center-div">
                <input type="number" disabled value="${random1}">
                <div class="hyphen">-</div>
                <input type="number" disabled value="${random2}">

                <div style="clear: both;"></div>
            </div>

            <div class="matches-flag">
                <img src="/create-mundial/flags/${teams[matches[i].team2].link}">
            </div>
        </div>`;
    }

    groupDiv.innerHTML = 
    `<table id="group-table">
        ${groupTableText}
    </table>`;

    matchesDiv.innerHTML = 
    `<div id="matches-table">
        ${matchesTableText}
    </div>`;

    var allMatchElems = document.getElementsByClassName("group-match");
    groupDivs = allMatchElems;

    for(var i = 0; i < 6; i++) {
        var localInputs = allMatchElems[i].querySelectorAll("input");
        inputs[i] = [];
        
        inputs[i][0] = localInputs[0];
        inputs[i][1] = localInputs[1];
    }
    setGroupMatchActive(0, true);
}