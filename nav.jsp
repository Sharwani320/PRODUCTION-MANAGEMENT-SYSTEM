<head>
    <link rel="stylesheet" type="text/css" href="css/custom.css">
</head>

<div class="topnav" style="display: flex">
    <a href="dashboard.jsp"><img src="https://th.bing.com/th/id/OIP.1UCbwnIgUT6n1OKf44u2MAAAAA?w=225&h=225&rs=1&pid=ImgDetMain" alt="Logo"></a>
    <div class="search-container">
        <form action="departments.jsp" method="get">
            <div style="display: flex; flex-direction:row;">
                <input type="text" placeholder="Search.." name="search">
                        <button type="submit" style="border-radius: 100%; background-color: #333; border: 1px solid #666; width: 40px; height: 40px; margin: 5px">
                        <svg  xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" style="width:25px; height:25px"><path d="M18.031 16.6168L22.3137 20.8995L20.8995 22.3137L16.6168 18.031C15.0769 19.263 13.124 20 11 20C6.032 20 2 15.968 2 11C2 6.032 6.032 2 11 2C15.968 2 20 6.032 20 11C20 13.124 19.263 15.0769 18.031 16.6168ZM16.0247 15.8748C17.2475 14.6146 18 12.8956 18 11C18 7.1325 14.8675 4 11 4C7.1325 4 4 7.1325 4 11C4 14.8675 7.1325 18 11 18C12.8956 18 14.6146 17.2475 15.8748 16.0247L16.0247 15.8748Z"></path></svg>
                    </button>
            </div>
        </form>
    </div>
    <div class="nav-links" style="display: flex">
        <a class="nav_buttons" href="dashboard.jsp">Home</a>
        <a class="nav_buttons" href="departments.jsp">Departments</a>
        <a class="nav_buttons" href="News.jsp">News</a>
        <a class="nav_buttons" href="contact.jsp">Contact</a>
        <a class="nav_buttons" href="about.jsp">About</a>
        <%String menu_ind = (String) session.getAttribute("username");
        if (menu_ind != null) {%>
            <a href="index.jsp">Logout</a>
        <%} else { %>
            <a href="index.jsp">login</a>
        <%}%>
    </div>
</div>
