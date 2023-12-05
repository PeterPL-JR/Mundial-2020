let contentDiv;
let phaseNameDiv;

let nameDiv;
let groupPlayButton;

let groups = {};
let knockQualified = {};
let inputs = [];
let groupDivs = [];

var currentGroupIndex = 0;
var currentMatchIndex = 0;

let extraTeams = [];

function prepareGroupRound() {
    GROUPS = (TYPE == TYPE_MUNDIAL) ? 8 : 6;
    LAST_GROUP = toChar(GROUPS - 1);

    for(let i = 0; i < GROUPS; i++) {
        let groupCh = String.fromCharCode(i + 65);
        groups[groupCh] = {
            teams: [],
            matches: []
        };
    }
    for(let team of teams) {
        let groupCh = team.group_ch;
        let groupPos = team.group_pos - 1;

        groups[groupCh].teams[groupPos] = team;
    }

    for(var key in groups) {
        var group = groups[key];
        var t = group.teams;

        group.matches = [
            [
                new Match(t[0], t[1]),
                new Match(t[2], t[3])
            ],
            [
                new Match(t[0], t[2]),
                new Match(t[3], t[1])
            ],
            [
                new Match(t[3], t[0]),
                new Match(t[1], t[2])
            ]
        ];
    }

    var groupDiv = document.createElement("div");
    var matchesDiv = document.createElement("div");

    phaseNameDiv.className = "phase";
    groupDiv.id = "group-div";
    matchesDiv.id = "matches-div";

    contentDiv.appendChild(groupDiv);
    contentDiv.appendChild(matchesDiv);
    createClearBoth(contentDiv);

    groupPlayButton.onclick = playGroupMatch;

    createGroupPage('A');
}

function createGroupPage(groupChar) {
    nameDiv.innerHTML = "Grupa " + groupChar;
    let group = groups[groupChar];

    let groupTeams = group.teams;
    let matches = concatArray(group.matches);

    var groupDiv = getId("group-div");
    var matchesDiv = getId("matches-div");

    var groupTableText = "";
    for(var i = 0; i < 4; i++) {
        var color = (i < 2) ? "dark" : "light";
        if(TYPE == TYPE_EURO && i == 2) color = "medium qualify-border";

        if(i == 1) color += " qualify-border";

        groupTableText += 
        `<tr class="${color}">
            <td class="flag-elem">
                <img src='${FLAGS_PATH}${groupTeams[i].imgLink}'>
            </td>
            <td class="name-elem">${groupTeams[i].teamName}</td>
            <td class="points-elem">${groupTeams[i].points()}</td>
            <td class="goals-elem">
                ${groupTeams[i].goalsScored()}-${groupTeams[i].goalsLost()}
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
                <img src="${FLAGS_PATH}${matches[i].team1.imgLink}">
            </div>
            
            <div class="matches-center-div">
                <input type="number" disabled value="${random1}">
                <div class="hyphen">-</div>
                <input type="number" disabled value="${random2}">

                <div style="clear: both;"></div>
            </div>

            <div class="matches-flag">
                <img src="${FLAGS_PATH}${matches[i].team2.imgLink}">
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