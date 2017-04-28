// Fig 10.10 RollDice.js
// Summarizing die rolling frequencies with an array instead of switch

var frequency = [ , 0, 0, 0, 0, 0, 0]]; // frequency [0] uninitialized
var totalDice = 0;
var dieImages = new Array(12); // array to store img elements

// get die img elements
function start() {
    var button = document.getElementById("rollbutton");
    button.addEventListener("click", rollDice, false);
    var length = dieImages.length; // get array's length once before loop

    for (var i = 0; i < length; ++i) {
        dieImages[i] = document.getElementById("die" + (i + 1));
    }
}

// roll the dice
function rollDice() {
    var face; // face rolled
    var length = dieImages.length;

    for (var i = 0; i < length; ++i) {
        face = Math.floor(1 + Math.random() * 6);
        tallyRolls(face); // increment a frequency counter
        setImage(i, face); // display appropriate die image
        ++totalDice; // increment total
    }

    updateFrequencyTable();
}

// increment appropriate frequency counter
function
