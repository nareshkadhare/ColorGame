var container = document.querySelector(".container");
var newGameBtn = document.getElementById("newGameBtn");
var easyBtn = document.getElementById("easyBtn");
var hardBtn = document.getElementById("hardBtn");

var result = document.getElementById("result");
var numberOfDiv = 6;

var r = Math.floor((Math.random() * 255) + 1);
var g = Math.floor((Math.random() * 255) + 1);
var b = Math.floor((Math.random() * 255) + 1);
var color = "rgb(" + r + "," + g + "," + b + ")";

document.getElementById("actualColor").style.backgroundColor = color;
document.getElementById("colorCode").innerHTML = color;

hardBtn.setAttribute("class","menuBtnActive");

setTimeout(function () {
    setDivColors();
}, 100);

function setDivColors() {

    if (numberOfDiv === 6) {
        hardBtn.setAttribute("class","menuBtnActive");
        easyBtn.removeAttribute("class");
    } else {
        hardBtn.removeAttribute("class");
        easyBtn.setAttribute("class","menuBtnActive");
    }
    for (var i = 0; i < numberOfDiv; i++) {
        r = Math.floor((Math.random() * 255) + 1);
        g = Math.floor((Math.random() * 255) + 1);
        b = Math.floor((Math.random() * 255) + 1);
        divColor = "rgb(" + r + "," + g + "," + b + ")";
        container.children[i].style.opacity = '1';
        container.children[i].style.backgroundColor = divColor;
        container.children[i].addEventListener("click", function (event) {
            if (document.getElementById("actualColor").style.backgroundColor === this.style.backgroundColor) {
                result.textContent = "Correct!";
                wingame();
            } else {
                result.textContent = "Try Again!";
                this.style.opacity = "0";
            }
        });
    }
    var randomNumber = Math.floor((Math.random() * numberOfDiv - 1) + 1);
    container.children[randomNumber].style.background = color;
}
function wingame() {
    for (var i = 0; i < numberOfDiv; i++) {
        container.children[i].style.opacity = "1";
        container.children[i].style.backgroundColor = color;
        document.querySelector(".header").style.background = color;
        newGameBtn.innerHTML = "PLAY AGAIN?"

    }
}
function newGame() {
    newGameBtn.innerHTML = "New Game";
    result.textContent = "";
    document.querySelector(".header").style.backgroundColor = "black";
    r = Math.floor((Math.random() * 255) + 1);
    g = Math.floor((Math.random() * 255) + 1);
    b = Math.floor((Math.random() * 255) + 1);
    color = "rgb(" + r + "," + g + "," + b + ")";
    document.getElementById("actualColor").style.backgroundColor = color;
    document.getElementById("colorCode").innerHTML = color
    setDivColors();
}

newGameBtn.addEventListener("click", function () {
    newGame();
});

easyBtn.addEventListener("click", function () {
    for (var i = 3; i < numberOfDiv; i++) {
        container.children[i].style.opacity = "0";
    }
    numberOfDiv = 3;
    newGame();
});

hardBtn.addEventListener("click", function () {
    numberOfDiv = 6;
    newGame();
});
