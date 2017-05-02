window.onload=function(){
    document.getElementById("submitButton").addEventListener("click", processForm);
    document.getElementById("continueButton").addEventListener("click", continueButtonPress);
    setDateLimits();
}

function setDateLimits() {
    // This function sets the min and max date for leaving and return
    var today = new Date();
    var oneYearFromNow = new Date(); // Constraint for leaving and returning is 1 year from today
    var dd = today.getDate();
    var mm = today.getMonth()+1; // January is 0!
    var yyyy = today.getFullYear();
     if(dd < 10){
            dd = '0' + dd
        }
        if(mm < 10){
            mm = '0' + mm
        }
    today = yyyy + '-' + mm + '-' + dd;
    var nextYear = yyyy + 1
    oneYearFromNow = nextYear + '-' + mm + '-' + dd;
    document.getElementById("leaveDate").setAttribute("min", today);
    document.getElementById("leaveDate").setAttribute("max", oneYearFromNow);
    document.getElementById("returnDate").setAttribute("min", today);
    document.getElementById("returnDate").setAttribute("max", oneYearFromNow);
}
// Define globals
var possibleFlights = [
    ["bkk", "icn", 320],
    ["bkk", "sin", 350],
    ["dtw", "lga", 320],
    ["dtw", "nrt", 870],
    ["icn", "lga", 1080],
    ["lga", "bkk", 1250],
    ["nrt", "bkk", 320],
    ["sin", "bkk", 300],
    ["sin", "syd", 450],
];

var airportCodes = [
    ["bkk", "Suvarnabhumi Airport (BKK)"],
    ["dtw", "Detroit Metropolitan Airport (DTW)"],
    ["icn", "Incheon International Airport (ICN)"],
    ["lga", "LaGuardia Airport (LGA)"],
    ["nrt", "Narita International Airport (NRT)"],
    ["sin", "Singapore Changi Airport (SIN)"],
    ["syd", "Sydney Airport (SYD)"],
];

var errorMsg = ""; // Contains string of error messages if there are any
var resultMsg = "";
var layoverMsg = "";
function processForm() {
    // Get form values
    var form = document.getElementById('ticketForm');
    var from = document.getElementById('fromList').value;
    var to = document.getElementById('toList').value;
    var numPassengers = document.getElementById('numPassengers').value;
    var leaveDate = document.getElementById('leaveDate').value;
    var returnDate = document.getElementById('returnDate').value;
    form.style.display = "none";
    var processing = document.createElement('span');
    processing.appendChild(document.createTextNode('processing ...'));
    form.parentNode.insertBefore(processing, form);
    var price = checkFlights(to, from, numPassengers);
    price = formatPrice(price);
    // Get info to display message to user
    resultMsg += "Your flight from <strong>" + getAirportName(from) + "</strong> to <strong>";
    resultMsg += getAirportName(to) +  "</strong> for <strong>" + numPassengers + "</strong>";
    resultMsg += " has been found! " + layoverMsg + "Total price will be " + price + ". You will leave on ";
    resultMsg += leaveDate + " and return on " + returnDate + ". Enjoy your trip! <br />";

    processing.style.display = "none";
    if (errorMsg != "") {
        document.getElementById("results").innerHTML = errorMsg;
    }
    else {
        document.getElementById("results").innerHTML = resultMsg;
    }
    document.getElementById("continueButton").style.display = "block";
    return;
}

function continueButtonPress() {
        window.location.reload()
}

function formatPrice(price) {
    price = price.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");
    price = price + ".00";
    price = "$" + price;
    return price;
}

function checkFlights(to, from, numPassengers) {
    var transferFlights = new Array();
    //var layoverNeeded = true;
    var layoverCount = 0;
    // First find flights from the specified place
    for (i = 0; i < possibleFlights.length; i++) {
        if (possibleFlights[i][0] == from) {
            transferFlights[layoverCount] = possibleFlights[i];
            layoverCount++;
        }
        if (possibleFlights[i][0] == from && possibleFlights[i][1] == to) {
            return numPassengers * possibleFlights[i][2];
        }
    }
    // Find flights from intermediate location to destination
    for (i = 0; i < transferFlights.length; i++) {
        for (j = 0; j < possibleFlights.length; j++) {
            if (transferFlights[i][1] == possibleFlights[j][0] && possibleFlights[j][1] == to) {
                var intermediate = getAirportName(transferFlights[i][1]);
                layoverMsg += "<br>You have a layover in your flight. Your flight is scheduled starting at  ";
                layoverMsg += getAirportName(from) + " to " + intermediate;
                layoverMsg += " and from " + intermediate + " to ";
                layoverMsg += getAirportName(to) + ".<br />";
                return numPassengers * (possibleFlights[j][2] + transferFlights[i][2])
            }
        }
    }
    // At this point no flights have been found
    errorMsg += "<p>We're sorry, but we cannot find any flights from " + getAirportName(from) + " to " + getAirportName(to) + ". Please try again.";
    return 0;
}


function getAirportName(code) {
    for (k = 0; k < airportCodes.length; k++) {
        if (airportCodes[k][0] == code){
            return airportCodes[k][1];
        }
    }
    return "Not Found";
}
function generateNewWindow() {
     var w = window.open("");
     w.document.writeln("<h1>Thanks for submitting!</h1>")
}
