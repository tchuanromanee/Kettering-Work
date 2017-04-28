function start() {
    var current = new Date();

    document.getElementById("maincontent").innerHTML =
        "<p>Time: " + current.getTime() + "<br>Date:" + current.getDate() +
        "<br>Month:" + current.getMonth() + "</p>";
}

window.onload = start;
