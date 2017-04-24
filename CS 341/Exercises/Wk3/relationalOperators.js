var name; // String entered by user
var now = new Date(); // current date and time
var hour = now.getHours(); // current hour (0-23)

// read the name from the prompt box as a string
name = window.prompt("Please enter your name");

// determine whether it's morning
if (hour < 12)
    document.write("Good morning, ");

// determine whether the time is PM
if (hour >= 12)
{
    // convert to a 12-hour clock
    hour = hour - 12;

    // determine whether it is before 6PM
    if (hour < 6)
        document.write("Good afternoon, ");

    // determine whether it is after 6 PM
    if (hour >= 6)
        document.write("Good evening, ");
}

document.write(name);
