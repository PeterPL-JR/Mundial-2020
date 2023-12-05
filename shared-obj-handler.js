var groupsObjGlobal;
var knockObjGlobal;

function createObject(groupsObj, knockObj) {
    groupsObjGlobal = groupsObj;
    knockObjGlobal = knockObj;

    var groupsFinal = objectOfGroups();
    var knockFinal = objectOfKnock();

    var groupsString = JSON.stringify(groupsFinal);
    var knockString = JSON.stringify(knockFinal);

    const URL = MAIN_DIR + "share_session.php";
    serverGet(URL, {groups: groupsString, knock: knockString, logged: false, year: YEAR, type: TYPE}, function(text) {
        var button = document.createElement("button");
        button.id = "share-button";
        button.className = "button";
        button.innerHTML = `<a href="${text}">Udostępnij</a>`;
        contentDiv.appendChild(button);
    });
}

function objectOfGroups() {
    var groupsFinal = [];
    var keys = Object.keys(groupsObjGlobal);

    for(var group = 0; group < keys.length; group++) {
        var groupArray = [];
        var groupObj = groupsObjGlobal[keys[group]];

        groupArray[0] = [];
        for(var t = 0; t < 4; t++) {
            let team = groupObj.teams[t];
            var stats = [team.points(), team.goals(), team.goalsScored(), team.goalsLost(), team.wins(), team.draws(), team.losses()];

            groupArray[0].push([team.id, stats]);
        }

        groupArray[1] = transformMatches(concatArray(groupObj.matches));
        groupsFinal.push(groupArray);
    }
    return groupsFinal;
}

function objectOfKnock() {
    var knockFinal = [];

    for(var round = 0; round < knockObjGlobal.length; round++) {
        knockFinal.push(knockObjGlobal[round] ? transformMatches(knockObjGlobal[round]) : []);
    }
    return knockFinal;
}

function transformMatches(matches) {
    var newMatches = [];

    for(var match = 0; match < matches.length; match++) {

        var matchObj = matches[match];
        newMatches.push([
            matchObj.team1.id,
            matchObj.team2.id,

            matchObj.score1,
            matchObj.score2,

            matchObj.penalty1,
            matchObj.penalty2,
        ]);
    }
    return newMatches;
}