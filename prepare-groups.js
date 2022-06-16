let contentDiv = getId("content");
let roundNameDiv = document.querySelector(".round-name .name-div");
let groupPlayButton;

let groups = {};
let knockQualified = {};
let inputs = [];
let groupDivs = [];

var currentGroupIndex = 0;
var currentMatchIndex = 0;

function prepareGroupRound() {
    //DELETE
    qualified = ['wal', 'per', 'cri'];
    //DELETE

    for(var team of qualified) {
        teams[team] = playOffTeams[team];
    }

    getId("play-button").remove();
    containerDiv.remove();

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

    groupDiv.id = "group-div";
    matchesDiv.id = "matches-div";

    contentDiv.appendChild(groupDiv);
    contentDiv.appendChild(matchesDiv);

    var button = document.createElement("button");
    button.className = "button";
    button.innerHTML = "Rozegraj Mecz";
    button.onclick = playGroupMatch;
    groupPlayButton = button;

    button.style.marginTop = "86px";
    button.style.marginTop = "86px";
    contentDiv.appendChild(button);

    createGroupPage('A');
}

function createGroupPage(groupChar) {
    roundNameDiv.innerHTML = "Grupa " + groupChar;
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
                <img src='flags/${groupTeams[i].link}'>
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
        // random1 = "";
        // random2 = "";
        //DELETE

        matchesTableText +=
        `<div class="group-match ${color}">
            <div class="matches-flag">
                <img src="flags/${teams[matches[i].team1].link}">
            </div>
            
            <div class="matches-center-div">
                <input type="number" disabled value="${random1}">
                <div class="hyphen">-</div>
                <input type="number" disabled value="${random2}">

                <div style="clear: both;"></div>
            </div>

            <div class="matches-flag">
                <img src="flags/${teams[matches[i].team2].link}">
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
    </div>`

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