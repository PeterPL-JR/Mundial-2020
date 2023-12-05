const groupsArray = {};
let letters = [];

const _GROUPS = 8;
const _GROUP_TEAMS = 4;

function initGroups(potsTeams) {
    for(let i = 0; i < _GROUPS; i++) {
        const groupCh = String.fromCharCode(i + 65);
        groupsArray[groupCh] = [];
        
        for(let j = 0; j < _GROUP_TEAMS; j++) {
            groupsArray[groupCh][j] = null;
        }
    }
    letters = Object.keys(groupsArray);

    const newTeams = [];
    for(let team of concatArray(potsTeams)) {
        newTeams.push(team);
    }
    teams = newTeams;

    for(let confed of confeds) {
        confed.teams = countKey(teams, "confed", confed.name);
        confed.maxInGroup = Math.ceil(confed.teams / _GROUPS);
        confed.maxWithout = _GROUPS - Math.ceil(confed.teams / confed.maxInGroup);
    }
    
    confeds = confeds.filter(function(elem) {
        return elem.teams != 0;
    });
}

function drawGroups(potsTeams) {
    initGroups(potsTeams);
    const pots = copyArray(potsTeams);

    // Draw First Pot
    groupsArray["A"][0] = getTeam(pots, 0, 0);
    for(let i = 1; i < _GROUPS; i++) {
        groupsArray[letters[i]][0] = getRandomTeam(pots, 0);
    }

    // Draw All Pots
    for(let i = 1; i < _POTS; i++) {
        openPot(pots, i);
    }
    // Draw Positions
    for(let key in groupsArray) {
        groupsArray[key] = drawPositions(groupsArray[key]);
    }

    // Check if array is valid
    let teams = 0;
    for(let key in groupsArray) {
        teams += countTeamsInGroup(groupsArray[key]);
    }
    if(teams != _GROUPS * _GROUP_TEAMS) {
        return drawGroups(potsTeams);
    }
    return groupsArray;
}

function drawPositions(group) {
    const bufferGroup = copyArray(group);
    let lowerTeams = bufferGroup.splice(1, _GROUP_TEAMS - 1);
    
    lowerTeams = shuffleArray(lowerTeams);
    return bufferGroup.concat(lowerTeams);
}

function openPot(potsArray, pot) {
    const unsignedTeams = [];

    for(let i = 0; i < _GROUPS; i++) {
        const randTeam = getRandomTeam(potsArray, pot);
        
        for(let j = 0; j < _GROUPS; j++) {
            const group = groupsArray[letters[j]];
            const confed = getConfed(randTeam);

            if(checkConfeds(group, confed) || countTeamsInGroup(group) >= pot + 1) {
                if(j == _GROUPS - 1) {
                    unsignedTeams.push({team: randTeam, groupIndex: j, potIndex: pot});
                }
                continue;
            }
            group[pot] = randTeam;
            break;
        }
    }
    for(let team of unsignedTeams) {
        replaceTeams(team);
    }
}

function replaceTeams({team, groupIndex, potIndex}) {
    const bufferGroups = copyArray(Object.values(groupsArray));

    for(let i = groupIndex - 1; i >= 0; i--) {
        const thisGroup = copyArray(bufferGroups[groupIndex]);
        const anotherGroup = copyArray(bufferGroups[i]);
        
        const thisTeam = team;
        const anotherTeam = anotherGroup[potIndex];
        if(anotherTeam == null || anotherTeam == null) continue;

        thisGroup[potIndex] = anotherTeam;
        anotherGroup[potIndex] = thisTeam;

        if(checkConfeds(thisGroup, getConfed(anotherTeam)) && checkConfeds(anotherGroup, getConfed(thisTeam))) {
            groupsArray[letters[groupIndex]][potIndex] = anotherTeam;
            groupsArray[letters[i]][potIndex] = thisTeam;
            return;
        }
    }
}

function checkConfeds(group, confed) {
    return countConfed(group, confed.name) >= confed.maxInGroup;
}

function countConfed(array, confed) {
    let counter = 0;

    for(let team of array) {
        if(team != null && team.confed == confed) {
            counter++;
        }
    }
    return counter;
}

//UNUSED
function countWithout(groupsArray, confed) {
    let counter = 0;

    for(let key in groupsArray) {
        const group = groupsArray[key];
        if(countConfed(group, confed) == 0) {
            counter++;
        }
    }
    return counter;
}

function countTeamsInGroup(group) {
    let counter = 0;

    for(let team of group) {
        if(team != null) counter++;
    }
    return counter;
}

function getConfed(team) {
    return confeds.find(function(elem) {
        return elem.name == team.confed;
    });
}

function getRandomTeam(potsArray, pot) {
    const randomIndex = getRandom(0, potsArray[pot].length - 1);
    return getTeam(potsArray, pot, randomIndex);
}

function getTeam(potsArray, pot, team) {
    const elem = potsArray[pot][team];
    potsArray[pot].splice(team, 1);
    return elem;
}