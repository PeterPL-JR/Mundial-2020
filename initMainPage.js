const URL = "/create-mundial/get_data.php";
const scripts = [];
let teams = {};
let YEAR = "NULL";

const MODE_PREDICT = 0;
const MODE_CUSTOM = 1;

let mode;
const CUSTOM = 0;

function start() {
    contentDiv = getId("content");
    roundNameDiv = document.querySelector(".round-name .name-div");

    if(mode == MODE_PREDICT) prepareGroupRound();
    if(mode == MODE_CUSTOM) preparePots();
}

// Functions of game initialization
function initIndex(year) {
    setScriptsInterval();
    initStyles(year);
    
    mode = MODE_PREDICT;
    YEAR = year;
    serverGet(URL, {year}, function(text) {
        init(text);
    });
}
function initCustom() {
    setScriptsInterval();
    initCustomStyles();
    
    mode = MODE_CUSTOM;
    serverGet(URL, {}, function(text) {
        init(text);
    });
}

function init(text) {
    teams = JSON.parse(text);

    createScript("prepare-groups.js", scripts, 0);
    createScript("group-round-handler.js", scripts, 1);

    createScript("shared-obj-handler.js", scripts, 2);
    createScript("knock-round-handler.js", scripts, 3);
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
    script.src = "/create-mundial/" + src;
    script.onload = function() { variable[index] = true; };
    document.body.appendChild(script);
}