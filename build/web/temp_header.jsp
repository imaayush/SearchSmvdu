<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="JavaSrc.Connections"%>
<%@page import="java.sql.Connection"%>
<%@ taglib uri="/struts-tags" prefix="s" %>  
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>SMVDU SEARCH| SMVDU SHARE </title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="images/icons/favicon.ico">
        <link rel="apple-touch-icon" href="images/icons/favicon.png">
        <link rel="apple-touch-icon" sizes="72x72" href="images/icons/favicon-72x72.png">
        <link rel="apple-touch-icon" sizes="114x114" href="images/icons/favicon-114x114.png">
        <!--Loading bootstrap css-->
        <link type="text/css" rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,400,300,700">
        <link type="text/css" rel="stylesheet" href="http://fonts.googleapis.com/css?family=Oswald:400,700,300">
        <link type="text/css" rel="stylesheet" href="styles/jquery-ui-1.10.4.custom.min.css">
        <link type="text/css" rel="stylesheet" href="styles/font-awesome.min.css">
        <link type="text/css" rel="stylesheet" href="styles/bootstrap.min.css">
        <link type="text/css" rel="stylesheet" href="styles/animate.css">
        <link type="text/css" rel="stylesheet" href="styles/all.css">
        <link type="text/css" rel="stylesheet" href="styles/main.css">
        <link type="text/css" rel="stylesheet" href="styles/style-responsive.css">
        <link type="text/css" rel="stylesheet" href="styles/zabuto_calendar.min.css">
        <link type="text/css" rel="stylesheet" href="styles/pace.css">
        <link type="text/css" rel="stylesheet" href="styles/jquery.news-ticker.css">
        <link type="text/css" rel="stylesheet" href="styles/jplist-custom.css">
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>       
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <%
            Connection con = Connections.conn();

            String query = "select filename from files";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(query);
            String Autostr = "";
            while (rs.next()) {
                Autostr = Autostr + "," + rs.getString(1);
            }
        %>
        <script>
            $(function () {
                var s = "<%=Autostr%>";
                var availableTags = s.split(",");

                $("#tags").autocomplete({
                    autoFocus: true,
                    source: availableTags
                });
            });
        </script>

    </head>
    <body>
        <div>

            <!--BEGIN BACK TO TOP-->

            <!--END BACK TO TOP-->
            <!--BEGIN TOPBAR-->
            <%
                if (((String) request.getSession().getAttribute("username")) != null) {
            %>
            <div id="header-topbar-option-demo" class="page-header-topbar">
                <nav id="topbar" role="navigation" style="margin-bottom: 0;" data-step="3" class="navbar navbar-default navbar-static-top">
                    <div class="navbar-header">
                        <button type="button" data-toggle="collapse" data-target=".sidebar-collapse" class="navbar-toggle"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
                        <a id="logo" href="index.jsp" class="navbar-brand"><span class="fa fa-rocket"></span><span class="logo-text">SMVDU</span><span style="display: none" class="logo-text-icon">µ</span></a></div>
                    <div class="topbar-main"><a id="menu-toggle" href="#" class="hidden-xs"><i class="fa fa-bars"></i></a>

                        <form id="topbar-search" action="search" method="" class="hidden-sm hidden-xs" style="width:35%;">
                            <div class="input-icon right text-white"><a href="#" onclick="document.getElementById('topbar-search').submit();"><i class="fa fa-search"></i></a><input id="tags"  type="text" placeholder="Search here..." class="form-control text-white" name="searchtext"/></div>
                        </form>
                        <div class="news-update-box hidden-xs">
                            <button onclick="window.location.href = 'UploadFrom'" class="btn btn-white" >Upload</button>
                        </div>
                        <ul class="nav navbar navbar-top-links navbar-right mbn">
                            <%
                                con = Connections.conn();
                                String username;
                                String image_path = "";
                                HttpSession hs = request.getSession();
                                username = (String) hs.getAttribute("username");
                                query = "select image from user where username='" + username + "'";
                                st = con.createStatement();
                                rs = st.executeQuery(query);
                                if (rs.next()) {
                                    image_path = rs.getString(1);
                                }
                            %>
                            <li class="dropdown" ><a data-hover="dropdown" href="#" class="dropdown-toggle"><i class="fa fa-tasks fa-fw"></i><span class="badge badge-yellow">8</span></a>
                                <ul class="dropdown-menu dropdown-user pull-right" style="width:320px;">
                                    <div style="height:0px; margin-left:4%;"><strong>Notification</strong></div>
                                    <hr class="hr">
                                    <s:iterator  value="note">  
                                        <a  href="<s:url  action="fileview" > 
                                                <s:param name="fileid" value="%{fileid}" /> </s:url>"> 
                                                <fieldset >
                                                    <li style="height:50px;"><div style="width:40px;float:left;padding-left:2%;">  <img src="<s:property value="image"/>" class="avatar img-responsive"></div>
                                                    <div style="width: 235px; float: left; padding-left: 2%;">     

                                                        <s:property value="username"/>
                                                        <s:property value="notifications"/> a <s:property value="filetags"/>


                                                    </div>
                                                    <div style="width:30px;float:left;padding-right:2%;"><img data-src="images/movie.jpg" alt="avatar" class="media-object" src="images/movie.jpg" style="width: 40px; height: 40px;">
                                                    </div>
                                                </li>

                                                <li class="divider"></li>

                                            </fieldset>
                                        </a>

                                    </s:iterator>
                                </ul>
                            </li>
                            <li class="dropdown topbar-user"><a data-hover="dropdown" href="#" class="dropdown-toggle"><img src="<%=image_path%>" alt="" class="img-responsive img-circle"/>&nbsp;<span class="hidden-xs"><s:property value="#session.username"/></span>&nbsp;<span class="caret"></span></a>
                                <ul class="dropdown-menu dropdown-user pull-right">
                                    <li><a href="Myprofile"><i class="fa fa-user"></i>My Profile</a></li>
                                    <li><a href="Addcircle"><i class="fa fa-circle-o"></i>Add Circle</a></li>
                                    <li><a href="Mailbox"><i class="fa fa-envelope"></i>My Inbox</a></li>
                                    <li><a href=""><i class="fa fa-tasks"></i>Forum</a></li>
                                    <li class="divider"></li>

                                    <li><a href="Logout"><i class="fa fa-key"></i>Log Out</a></li>
                                </ul>

                            </li>


                        </ul>
                    </div>
                </nav>

            </div>
            <%
            } else {
            %>
            <div id="header-topbar-option-demo" class="page-header-topbar"  >
                <nav id="topbar" role="navigation" style="margin-bottom: 0;" data-step="3" class="navbar navbar-default navbar-static-top">
                    <div class="navbar-header">                        
                        <a id="logo" href="index.jsp" class="navbar-brand"><span class="fa fa-rocket"></span><span class="logo-text">SMVDU</span><span style="display: none" class="logo-text-icon">µ</span></a>
                    </div>
                    <div class="topbar-main">


                        <form id="topbar-search" action="search" method="" class="hidden-sm hidden-xs" style="width:35%;">
                            <div class="input-icon right text-white"><a href="#" onclick="document.getElementById('topbar-search').submit();"><i class="fa fa-search"></i></a><input id="tags"  onkeyup="showData(this.value);" type="text" placeholder="Search here..." class="form-control text-blue" name="searchtext"/></div>
                        </form>

                        <div style="float:right; margin-top:0.7%; margin-right: 3%">
                            <button onclick="window.location.href = 'LoginFrom'" class="btn btn-white">Upload</button>

                            &nbsp;&nbsp;
                            <button onclick="window.location.href = 'LoginFrom'" class="btn btn-blue">Sign in</button>
                        </div>
                    </div>
                </nav>
            </div>
            <%
                }
            %>