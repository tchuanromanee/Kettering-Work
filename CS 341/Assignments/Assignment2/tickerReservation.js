var possibleFlights = [
    ["bkk", "inc", 320],
    ["bkk", "sin", 350],
    ["dtw", "lga", 320],
    ["dtw", "nrt", 870],
    ["inc", "lga", 1080],
    ["lga", "bkk", 1250],
    ["nrt", "bkk", 320],
    ["sin", "bkk", 300],
    ["sin", "syd", 450],
];
// bkk-> dtw
// after cannot find any:
// for each flights start w/ bkk
// get the destination (ie. intermediate point)
// for each flight w/ the destination as the starting point
// find the final dest.


//document.getElementById("myForm").submit();
//http://stackoverflow.com/questions/9855656/how-to-submit-a-form-using-javascript


//var w = window.open("");
//w.document.writeln("<the html you wanted to write>")

// Set listener for submit button
// Upon submit, check for possibility of flights using the array
    // Have a function to go thru the array. Arg 1 is from: arg2 is to.
    // If fail, call recursively the function to find all flights "from" the specified lication
// If there are no possibilities, tell the user so.

// Else if there is a possibility, calculate the price
