const URL = "/create-mundial/get_data.php";
const scripts = [];
let teams = {};
let YEAR = "NULL";

function createScript(src, variable, index) {
    var script = document.createElement("script");
    script.src = "../" + src;
    script.onload = function() { variable[index] = true; };
    document.body.appendChild(script);
}

function start() {
    contentDiv = getId("content");
    roundNameDiv = document.querySelector(".round-name .name-div");

    if(prepareGroupRound) {
        prepareGroupRound();
    }
    // auto_mundial();
}

function initIndex(year) {
    setScriptsInterval();
    initStyles(year);

    YEAR = year;
    serverGet(URL, {year}, function(text) {
        teams = JSON.parse(text);
        createScript("prepare-groups.js", scripts, 0);
        createScript("group-round-handler.js", scripts, 1);
    
        createScript("shared-obj-handler.js", scripts, 2);
        createScript("knock-round-handler.js", scripts, 3);
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
        };
    }, 100);
}

function initStyles(year) {
    const sheetName = "css-colors.css";
    const url = window.location.origin + "/create-mundial/styles/" + sheetName;
    
    const allVariables = getPropertiesAll(url);
    const variablesKeys = Object.keys(allVariables);

    let variables = [];
    for(let key of variablesKeys) {
        variables.push(key.substring(0, key.length - 5));
    }
    variables = Array.from(new Set(variables));
    
    for(let variable of variables) {
        const value = allVariables[`${variable}-${year}`];
        document.documentElement.style.setProperty(variable, value);
    }
}

function getPropertiesAll(url) {
    const sheet = findSheet(document.styleSheets, url);
    const rule = findRule(sheet.cssRules, ":root");
    const style = getComputedStyle(document.documentElement);
    
    const variables = {};
    const allKeys = Object.keys(rule.style);
    
    for(let key of allKeys) {
        if(!isNaN(parseInt(key))) {
            const objKey = rule.style[key];
            const objElement = style.getPropertyValue(objKey);
            variables[objKey] = objElement;
        }
    }
    return variables;
}

function findSheet(styleSheets, url) {
    for(let sheet of styleSheets) {
        if(sheet.href == url) {
            return sheet;
        }
    }
    return -1;
}

function findRule(cssRules, key) {
    for(let rule of cssRules) {
        if(rule.selectorText == key) {
            return rule;
        }
    }
    return -1;
}