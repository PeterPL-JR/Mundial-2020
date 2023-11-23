const DB_URL = MAIN_DIR + "get_db_data.php";
const scripts = [];
let teams = {};
let confeds = [];
let YEAR = "NULL";
let TYPE = "NULL";

const MODE_PREDICT = 0;
const MODE_CUSTOM = 1;

let mode;
const CUSTOM = 0;

function start() {
    contentDiv = getId("content");
    phaseNameDiv = document.querySelector("#phase");
    nameDiv = document.querySelector("#phase #phase-div");

    if(mode == MODE_PREDICT) prepareGroupRound();
    if(mode == MODE_CUSTOM) preparePots();
}

// Functions of game initialization
function initIndex(year, type) {
    mode = MODE_PREDICT;
    YEAR = year;
    TYPE = type;
    serverGet(DB_URL, {year, type}, function(text) {
        init(text);
    });
}
function initCustom(type) {
    mode = MODE_CUSTOM;
    TYPE = type;
    serverGet(DB_URL, {}, function(text) {
        init(text);
    });
}

function init(text) {
    teams = JSON.parse(text);
    
    createScript("prepare-groups.js", scripts, 0);
    createScript("group-round-handler.js", scripts, 1);
    
    createScript("shared-obj-handler.js", scripts, 2);
    createScript("knock-round-handler.js", scripts, 3);
    
    serverGet(DB_URL, {get_confeds: null}, function(text) {
        const confedsNames = JSON.parse(text);
        for(let i = 0; i < confedsNames.length; i++) {
            confeds[i] = {
                name: confedsNames[i],
                teams: null,
                maxInGroup: null
            };         
        }
        setScriptsInterval();
    });
}

function setScriptsInterval() {
    var int = setInterval(function() {
        var loaded = true;
        for(var elem of scripts) {
            if(!elem) loaded = false;
        }
        if(loaded) {
            start();
            clearInterval(int);
            return;
        }
    }, 100);
}

function createScript(src, variable, index) {
    var script = document.createElement("script");
    script.src = MAIN_DIR + src;
    script.onload = function() { variable[index] = true; };
    document.body.appendChild(script);
}