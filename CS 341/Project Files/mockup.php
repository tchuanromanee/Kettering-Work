<html>
    <head>
        <title>Kettering Open Forum</title>
        <link rel = "stylesheet" type = "text/css" href = "style.css" media = "screen">
        <script src = "timeanddate.js"></script>
    </head>
    <body>
        <div id = "maincontent">
            <h1>Kettering University Open Forum</h1>
            <div id = "userInfoHeader">
                Welcome! &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                Login:
                <form method = "post" autocomplete = "on">
                    <label>
                      <input type = "text" id = "username"
                        placeholder = "Username"/>
                    </label>&nbsp;
                    <label>
                      <input type = "password" id = "password"
                        placeholder = "Password"/>
                    </label>&nbsp;
                    <input type = "submit" value = "Submit" />
                </form>
             <input id = "searchForum" type = "search" placeholder = "search"><br>
                <p>
                    <!--Add breadcrumb navigation here -->
                    <a href = "#">Home</a> &nbsp;&nbsp;
                    <!--<a href = "#">Profile</a>-->
                </p>
            </div>
            <div id = "forumsection">
                <br>
                <!-- Add a while loop to get stuff from the MySql DB on catagories (writtein in PHP)-->
                <h2>Academic</h2>
                <table>
                    <thead>
                        <td>Topic</td>
                        <td>Description</td>
                        <td># Topics</td>
                        <td># Posts</td>
                        <td>Last Post</td>
                    </thead>
                    <tr>
                        <td><a href = "#">Classes</a>
                        </td>
                        <td>Discuss about classes
                        </td>
                        <td>24</td>
                        <td>150</td>
                        <td><a href = "#">Re: CS-341</a><br>
                            by <a href = "#">Tee C.</a><br>
                            Mon Apr 24, 2017 3:52 am
                        </td>
                    </tr>
                    <tr>
                        <td><a href = "#">Professors</a>
                        </td>
                        <td>Discuss about professors</td>
                        <td>13</td>
                        <td>123</td>
                        <td><a href = "#">Re: So-and-so</a><br>
                            by <a href = "#">Tyler C.</a><br>
                            Tues Apr 25, 2017 1:54 pm
                        </td>
                    </tr>
                </table>

                <h2>Living and Dining</h2>
                <table>
                    <thead>
                        <td>Topic</td>
                        <td>Description</td>
                        <td># Topics</td>
                        <td># Posts</td>
                        <td>Last Post</td>
                    </thead>
                    <tr>
                        <td><a href = "#">Dining</a>
                        </td>
                        <td>Good places to eat, recipes, etc
                        </td>
                        <td>53</td>
                        <td>324</td>
                        <td><a href = "#">Einstein's Discount</a><br>
                            by <a href = "#">Jeff P.</a><br>
                            Mon Apr 24, 2017 11:49 pm
                        </td>
                    </tr>
                    <tr>
                        <td><a href = "#">Places to Live</a>
                        </td>
                        <td>Housing arrangements, roomate search, apartment reviews</td>
                        <td>19</td>
                        <td>87</td>
                        <td><a href = "#">Re: Campus Village Lease</a><br>
                            by <a href = "#">Alex M.</a><br>
                            Tues Apr 25, 2017 2:05 am
                        </td>
                    </tr>
                </table>

                <h2>Student Life</h2>
                <table>
                    <thead>
                        <td>Topic</td>
                        <td>Description</td>
                        <td># Topics</td>
                        <td># Posts</td>
                        <td>Last Post</td>
                    </thead>
                    <tr>
                        <td><a href = "#">Clubs</a>
                        </td>
                        <td>Discuss about clubs
                        </td>
                        <td>24</td>
                        <td>150</td>
                        <td><a href = "#">Re: Aquaneers</a><br>
                            by <a href = "#">Andrew C.</a><br>
                            Sun Apr 23, 2017 10:42 pm
                        </td>
                    </tr>
                    <tr>
                        <td><a href = "#">Events</a>
                        </td>
                        <td>Discuss about events</td>
                        <td>24</td>
                        <td>150</td>
                        <td><a href = "#">Technician Meeting Wk 4</a><br>
                            by <a href = "#">George R.</a><br>
                            Mon Apr 24, 2017 3:52 am
                        </td>
                    </tr>
                </table>

            </div>
        <!-- Footer: Forum statistics, contact info -->
        <footer>
            &copy;2017 Kettering Open Forum
        </footer>
        <br>
        </div>
    </body>
</html>
