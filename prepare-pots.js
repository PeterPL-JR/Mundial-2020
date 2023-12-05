const potsDiv = getId("pots-div");
const titlesDiv = getId("pots-titles-div");
const startButton = getId("start-button");

const _POTS = 4;
const _POT_TEAMS = 8;
const FLAG_IMG_SRC = "images/flag.png";

const potsTeams = [];
const pots = [];

function preparePots() {
    for (let i = 0; i < _POTS; i++) {
        potsTeams[i] = [];

        titlesDiv.innerHTML +=
            `<div class='title-div'>
            <img src='images/ball.png'>
            <div>Koszyk ${i + 1}</div>
            <div style='clear: both;'></div>
        </div>`;

        const table = document.createElement("table");
        table.className = "pot-table";

        let tableText = "";
        for (let j = 0; j < _POT_TEAMS; j++) {
            potsTeams[i][j] = null;

            tableText +=
                `<tr>
                <td class='flag-elem'><img src='${FLAG_IMG_SRC}'></td>
                <td class='name-elem'><input type='text' placeholder='???'></td>
            </tr>`;
        }
        table.innerHTML = tableText;
        potsDiv.appendChild(table);

        const images = Array.from(document.querySelectorAll(`.pot-table:nth-child(${i + 1}) img`));
        const inputs = Array.from(document.querySelectorAll(`.pot-table:nth-child(${i + 1}) input`));

        pots[i] = [];
        for (let j = 0; j < _POT_TEAMS; j++) {
            pots[i][j] = {
                image: images[j],
                input: inputs[j]
            };
        }

        for (let j = 0; j < _POT_TEAMS; j++) {
            setInputEvents(i, j);
        }
    }
    startButton.onclick = function () {
        if(checkInputsTeams()) {
            startGame();
        }
    }
}

function setInputEvents(pot, team) {
    const input = pots[pot][team].input;
    const image = pots[pot][team].image;

    input.onkeyup = function () {
        serverGet(DB_URL, { input_text: input.value }, function (text) {
            if (text) {
                const counter = countElement(potsTeams, text);
                if (counter > 0) return;

                potsTeams[pot][team] = text;

                let t = teams[findTeamIndex(teams, text)];
                input.className = "bold";
                input.value = t.teamName;
                image.src = "flags/" + t.imgLink;
                return;
            }
            potsTeams[pot][team] = null;
            input.className = null;
            image.src = FLAG_IMG_SRC;
        });
    }
}

function checkInputsTeams() {
    for (let pot = 0; pot < _POTS; pot++) {
        for (let team = 0; team < _POT_TEAMS; team++) {
            if (potsTeams[pot][team] == null) {
                return false;
            }
        }
    }
    return true;
}

function startGame() {
    let pots = [];
    for(let i = 0; i < _POTS; i++) {
        pots[i] = [];
        for(let j = 0; j < _POT_TEAMS; j++) {
            pots[i][j] = teams[findTeamIndex(teams, potsTeams[i][j])];
        }
    }
    const groups = drawGroups(pots);
    
    for (let groupChar in groups) {
        const group = groups[groupChar];
        for (let i = 0; i < _GROUP_TEAMS; i++) {
            const team = group[i];
            team.group_ch = groupChar;
            team.group_pos = (i + 1).toString();
        }
    }

    potsDiv.remove();
    titlesDiv.remove();
    startButton.remove();

    prepareGroupRound();
}