function serverGet(url, data, doFunction) {
    var request = new XMLHttpRequest();
    request.onreadystatechange = function() {
        if(this.readyState == 4) {
            doFunction(this.responseText);
        }
    }
    
    var dataString = "";
    for(var key in data) {
        dataString += key + "=" + data[key] + "&";
    }
    request.open("GET", url + "?" + dataString);
    request.send();
}

function serverPost(url, data, doFunction) {
    var request = new XMLHttpRequest();
    request.onreadystatechange = function() {
        if(this.readyState == 4) {
            doFunction(this.responseText);
        }
    }

    var dataString = "";
    for(var key in data) {
        dataString += key + "=" + data[key] + "&";
    }

    request.open("POST", url);
    request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    request.send(dataString);
}

function getId(id) {
    return document.getElementById(id);
}

function getClass(className) {
    var array = document.getElementsByClassName(className);
    var newArray = [];

    for(var element of array) {
        newArray.push(element);
    }
    return newArray;
}

function createScript(src) {
    var script = document.createElement("script");
    script.src = src;
    document.body.appendChild(script);
}

function createClearBoth(container) {
    const div = document.createElement("div");
    div.style.setProperty("clear", "both");
    container.appendChild(div);
}

function getRandom(min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
}

function isNumber(char) {
    const numbers = [];
    for(var i = 0; i <= 9; i++) {
        numbers.push(`${i}`);
    }
    if(numbers.indexOf(char) != -1) {
        return true;
    }
    return false;
}

function isLetter(char) {
    const letters = [];
    for(var i = 0; i < 26; i++) {
        var lower = String.fromCharCode(i + 97);
        var upper = lower.toUpperCase();

        letters.push(lower);
        letters.push(upper);
    }
    if(letters.indexOf(char) != -1) {
        return true;
    }
    return false;
}

function shuffleArray(array) {
    const bufferArray = copyArray(array);
    const newArray = [];

    while(bufferArray.length != 0) {
        const randomIndex = getRandom(0, bufferArray.length - 1);
        newArray.push(bufferArray[randomIndex]);
        bufferArray.splice(randomIndex, 1);
    }
    return newArray;
}

function getRandomArray(length) {
    const bufferArray = [];
    for(let i = 0; i < length; i++) {
        bufferArray.push(i);
    }
    const array = [];

    while(bufferArray.length != 0) {
        const randomIndex = getRandom(0, bufferArray.length - 1);
        array.push(bufferArray[randomIndex]);
        bufferArray.splice(randomIndex, 1);
    }
    return array;
}

function countElement(haystack, needle) {
    let counter = 0;
    if(haystack.length == 0) return 0;

    for(let elem of haystack) {
        if(Array.isArray(elem)) {
            counter += countElement(elem, needle);
        } else if(elem == needle) {
            counter++;
        }
    }
    return counter;
}

function countKey(haystack, key, needle) {
    let counter = 0;
    if(haystack.length == 0) return 0;

    for(let elem of haystack) {
        if(Array.isArray(elem)) {
            counter += countKey(elem, key, needle);
        } else if(elem[key] == needle) {
            counter++;
        }
    }
    return counter;
}

function concatArray(basicArray) {
    let array = [];
    if(basicArray.length == 0) return [];

    for(let elem of basicArray) {
        if(Array.isArray(elem)) {
            array = array.concat(concatArray(elem));
        } else {
            array.push(elem);
        }
    }
    return array;
}

function copyArray(array) {
    let newArray = [];
    if(array.length == 0) return [];

    for(let elem of array) {
        if(Array.isArray(elem)) {
            newArray.push(copyArray(elem));
        } else {
            newArray.push(elem);
        }
    }
    return newArray;
}