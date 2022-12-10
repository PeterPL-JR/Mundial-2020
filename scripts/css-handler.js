const STYLES_PATH = "/create-mundial/styles/";
const COLORS_CSS_PATH = "css-colors.css";

function initStyles(key) {
    const sheetName = COLORS_CSS_PATH;
    const url = window.location.origin + STYLES_PATH + sheetName;
    
    const allVariables = getPropertiesAll(url);
    const variablesKeys = Object.keys(allVariables);

    let variables = [];
    for(let key of variablesKeys) {
        variables.push(key.substring(0, key.length - findModeName(key)));
    }
    variables = Array.from(new Set(variables));
    
    for(let variable of variables) {
        const value = allVariables[`${variable}-${key}`];
        document.documentElement.style.setProperty(variable, value);
    }
}
function initCustomStyles() {
    initStyles("custom");
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

function findModeName(key) {
    const hyphenIndex = key.lastIndexOf("-");
    const modeName = key.substring(hyphenIndex, key.length);

    return modeName.length;
}