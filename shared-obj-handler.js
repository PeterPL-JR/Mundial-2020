var groupsObjGlobal;
var knockObjGlobal;

function createObject(groupsObj, knockObj) {

    groupsObjGlobal = groupsObj;
    knockObjGlobal = knockObj;

    var groupsFinal = objectOfGroups();
    var knockFinal = objectOfKnock();

    var groupsString = JSON.stringify(groupsFinal);
    var knockString = JSON.stringify(knockFinal);

    var button = getId("share-button");
    button.onclick = function() {
        serverPost("share_session.php", {groups: groupsString, knock: knockString}, function(session) {
            window.location.href = "share.php?user=" + session;
        });
    }
}

function objectOfGroups() {
    var groupsFinal = [];
    var keys = Object.keys(groupsObjGlobal);

    for(var group = 0; group < keys.length; group++) {
        var groupArray = [];
        var groupObj = groupsObjGlobal[keys[group]];

        groupArray[0] = [];
        for(var team = 0; team < 4; team++) {
            var stats = [];

            for(var key in groupObj.teams[team].stats) {
                stats.push(groupObj.teams[team].stats[key]);
            }

            groupArray[0].push([
                groupObj.teams[team].name, stats
            ]);
        }

        groupArray[1] = transformMatches(groupObj.matches);
        groupsFinal.push(groupArray);
    }
    return groupsFinal;
}

function objectOfKnock() {
    var knockFinal = [];

    for(var round = 0; round < knockObjGlobal.length; round++) {
        knockFinal.push(transformMatches(knockObjGlobal[round]));
    }
    return knockFinal;
}

function transformMatches(matches) {
    var newMatches = [];

    for(var match = 0; match < matches.length; match++) {

        var matchObj = matches[match];
        newMatches.push([
            matchObj.team1, 
            matchObj.team2,

            matchObj.score1, 
            matchObj.score2,

            matchObj.penalty1, 
            matchObj.penalty2,
        ]);
    }
    return newMatches;
}