<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="JavaSrc.Connections"%>
<%@page import="java.sql.Connection"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<s:bean id="file" name="com.fileviewAction"/>
<%! String user;%>
<%user = (String) session.getAttribute("username");%>
<div id="page-wrapper">
    <!--BEGIN TITLE & BREADCRUMB PAGE-->
    <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
        <div class="page-header pull-left">
            <div class="page-title">
                File Description</div>
        </div>
        <ol class="breadcrumb page-breadcrumb pull-right">
            <li><i class="fa fa-home"></i>&nbsp;<a href="index.jsp">Home</a></li>

        </ol>
        <div class="clearfix">
        </div>
    </div>
    <!--END TITLE & BREADCRUMB PAGE-->
    <!--BEGIN CONTENT-->
    <div class="page-content">
        <div id="tab-general">
            <div class="row mbl">
                <div class="col-lg-12">

                    <div class="col-md-12">
                        <div id="area-chart-spline" style="width: 100%; height: 300px; display: none;">
                        </div>
                    </div>

                </div>

                <div class="col-lg-12">

                    <div class="page-content">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="panel">
                                    <div class="panel-body">
                                        <div class="profile" style="width:100%;">
                                            <div style="margin-bottom: 15px;" class="row">
                                                <div class="col-xs-12 col-sm-4 text-center">
                                                    <figure><img src="images/<s:property value="filetags"/>.jpg" alt="" style="display: inline-block; height: 200px; width: 200px;" class="img-responsive img- btn-dark "/>
                                                        <figcaption class="ratings">
                                                            <%
                                                                double likes = Double.parseDouble((String) request.getAttribute("countLiked"));
                                                                double recommends = Double.parseDouble((String) request.getAttribute("countRecommended"));
                                                                double downloads = Double.parseDouble((String) request.getAttribute("countDownloaded"));
                                                                double views = Double.parseDouble((String) request.getAttribute("viewed"));
                                                                double val = (3 * likes + 2 * recommends + 5 * downloads) * 5 / (10 * views);
                                                                if (val < 0.5 || views == 0) {
                                                            %>
                                                            <p><a href="#"><span class="fa fa-star-o"></span></a><a href="#"><span class="fa fa-star-o"></span></a><a href="#"><span class="fa fa-star-o"></span></a><a href="#"><span class="fa fa-star-o"></span></a><a href="#"><span class="fa fa-star-o"></span></a></p>
                                                                    <%
                                                                    } else if (val < 1) {
                                                                    %>
                                                            <p><a href="#"><span class="fa fa-star-half-full"></span></a><a href="#"><span class="fa fa-star-o"></span></a><a href="#"><span class="fa fa-star-o"></span></a><a href="#"><span class="fa fa-star-o"></span></a><a href="#"><span class="fa fa-star-o"></span></a></p>
                                                                    <%
                                                                    } else if (val < 1.5) {
                                                                    %>
                                                            <p><a href="#"><span class="fa fa-star"></span></a><a href="#"><span class="fa fa-star-o"></span></a><a href="#"><span class="fa fa-star-o"></span></a><a href="#"><span class="fa fa-star-o"></span></a><a href="#"><span class="fa fa-star-o"></span></a></p>
                                                                    <%
                                                                    } else if (val < 2) {
                                                                    %>
                                                            <p><a href="#"><span class="fa fa-star"></span></a><a href="#"><span class="fa fa-star-half-full"></span></a><a href="#"><span class="fa fa-star-o"></span></a><a href="#"><span class="fa fa-star-o"></span></a><a href="#"><span class="fa fa-star-o"></span></a></p>
                                                                    <%
                                                                    } else if (val < 2.5) {
                                                                    %>
                                                            <p><a href="#"><span class="fa fa-star"></span></a><a href="#"><span class="fa fa-star"></span></a><a href="#"><span class="fa fa-star-o"></span></a><a href="#"><span class="fa fa-star-o"></span></a><a href="#"><span class="fa fa-star-o"></span></a></p>
                                                                    <%
                                                                    } else if (val < 3) {
                                                                    %>
                                                            <p><a href="#"><span class="fa fa-star"></span></a><a href="#"><span class="fa fa-star"></span></a><a href="#"><span class="fa fa-star-half-full"></span></a><a href="#"><span class="fa fa-star-o"></span></a><a href="#"><span class="fa fa-star-o"></span></a></p>
                                                                    <%
                                                                    } else if (val < 3.5) {
                                                                    %>
                                                            <p><a href="#"><span class="fa fa-star"></span></a><a href="#"><span class="fa fa-star"></span></a><a href="#"><span class="fa fa-star"></span></a><a href="#"><span class="fa fa-star-o"></span></a><a href="#"><span class="fa fa-star-o"></span></a></p>
                                                                    <%
                                                                    } else if (val < 4) {
                                                                    %>
                                                            <p><a href="#"><span class="fa fa-star"></span></a><a href="#"><span class="fa fa-star"></span></a><a href="#"><span class="fa fa-star"></span></a><a href="#"><span class="fa fa-star-half-full"></span></a><a href="#"><span class="fa fa-star-o"></span></a></p>
                                                                    <%
                                                                    } else if (val < 4.5) {
                                                                    %>
                                                            <p><a href="#"><span class="fa fa-star"></span></a><a href="#"><span class="fa fa-star"></span></a><a href="#"><span class="fa fa-star"></span></a><a href="#"><span class="fa fa-star"></span></a><a href="#"><span class="fa fa-star-o"></span></a></p>
                                                                    <%
                                                                    } else if (val < 5) {
                                                                    %>
                                                            <p><a href="#"><span class="fa fa-star"></span></a><a href="#"><span class="fa fa-star"></span></a><a href="#"><span class="fa fa-star"></span></a><a href="#"><span class="fa fa-star"></span></a><a href="#"><span class="fa fa-star-half-full"></span></a></p>
                                                                    <%
                                                                    } else {
                                                                    %>
                                                            <p><a href="#"><span class="fa fa-star"></span></a><a href="#"><span class="fa fa-star"></span></a><a href="#"><span class="fa fa-star"></span></a><a href="#"><span class="fa fa-star"></span></a><a href="#"><span class="fa fa-star"></span></a></p>
                                                                    <%
                                                                        }
                                                                    %>
                                                        </figcaption>
                                                    </figure>
                                                </div>
                                                <div class="col-xs-12 col-sm-8">
                                                    <h2>

                                                        <s:property value="filename"/></h2>
                                                    <p style="color: green;">
                                                        <strong >Seeders:</strong> 4</p>
                                                    <p style="color: red;">
                                                        <strong >leechers:</strong> 5</p>
                                                    <p>
                                                        <strong class="mrs">Tags:</strong><span class="label label-green mrs"><s:property value="filetags"/></span></p>
                                                </div>
                                            </div>
                                            <nav class="navbar-default" style="width: 125px; margin-top: -278px; float: right; margin-right: -15px">
                                                <div class="sidebar-collapse menu-scroll">
                                                    <ul id="side-menu" class="nav">
                                                        <div class="clearfix"></div>
                                                        <li><a href="#description"><span class="menu-title">Description</span></a></li>
                                                        <li><a href="#summary"><span class="menu-title">File Summery</span></a></li>
                                                        <li><a href="#comments"><span class="menu-title">Comments</span></a></li>
                                                    </ul> 
                                                </div>
                                            </nav>
                                            <div class="row text-center divider">
                                                <div class="col-xs-8 col-sm-3 emphasis">
                                                    <h2>
                                                        <strong><s:property value="countLiked"/></strong></h2>
                                                    <p>
                                                        <small>likes</small>
                                                    </p>
                                                    <%
                                                        Connection con = Connections.conn();
                                                        if (user != null) {
                                                            String username = (String) session.getAttribute("username");
                                                            String fileid = (String) request.getAttribute("idfiles");
                                                            System.out.println(username);
                                                            System.out.println(fileid);
                                                            if (!((String) session.getAttribute("username")).equals("admin")) {
                                                                Statement ps = con.createStatement();
                                                                ResultSet rs = ps.executeQuery("select * from notifications where notification='Liked' AND username='" + username + "' AND idfiles=" + Integer.parseInt(fileid));
                                                                if (rs.next()) {
                                                    %>
                                                    <form action="unlikefile">
                                                        <button class="btn btn-yellow btn-block" value="<s:property value="idfiles"/>" name="idfiles">
                                                            <span class="fa fa-minus-circle"></span>&nbsp; Unlike
                                                        </button>
                                                    </form>
                                                    <%
                                                    } else {
                                                    %>
                                                    <form action="likefile">
                                                        <button class="btn btn-yellow btn-block" value="<s:property value="idfiles"/>" name="idfiles">
                                                            <span class="fa fa-plus-circle"></span>&nbsp; Like
                                                        </button>
                                                    </form>
                                                    <%
                                                            }
                                                        }
                                                    } else {
                                                    %>
                                                    <form action="LoginFrom">
                                                        <button class="btn btn-yellow btn-block">
                                                            <span class="fa fa-plus-circle"></span>&nbsp; Like
                                                        </button>
                                                    </form>
                                                    <%
                                                        }
                                                    %>
                                                </div>
                                                <div class="col-xs-8 col-sm-3 emphasis">
                                                    <h2>
                                                        <strong><s:property value="countRecommended"/></strong></h2>
                                                    <p>
                                                        <small>Recommendation</small>
                                                    </p>
                                                    <%                                                        if (user != null) {
                                                            String username1 = (String) session.getAttribute("username");
                                                            String fileid1 = (String) request.getAttribute("idfiles");
                                                            if (!((String) session.getAttribute("username")).equals("admin")) {
                                                                Statement ps1 = con.createStatement();
                                                                ResultSet rs1 = ps1.executeQuery("select * from notifications where notification='Recommended' AND username='" + username1 + "' AND idfiles=" + Integer.parseInt(fileid1));
                                                                if (!rs1.next()) {
                                                    %>                                                    
                                                    <form action="recommendfile">
                                                        <button class="btn btn-blue btn-block" value="<s:property value="idfiles"/>" name="idfiles">
                                                            <span class="fa fa-user"></span>&nbsp; Recommended
                                                        </button>
                                                    </form>
                                                    <%
                                                                }
                                                            }
                                                        } else {
                                                    %>
                                                    <form action="LoginFrom">
                                                        <button class="btn btn-blue btn-block">
                                                            <span class="fa fa-user"></span>&nbsp; Recommended
                                                        </button>
                                                    </form>
                                                    <%
                                                        }
                                                    %>
                                                </div>
                                                <div class="col-xs-8 col-sm-3 emphasis">
                                                    <h2>
                                                        <strong><s:property value="countDownloaded"/></strong></h2>
                                                    <p>
                                                        <small>Downloads</small>
                                                    </p>
                                                    <%
                                                        if (user == null || !(user).equals("admin")) {
                                                    %>

                                                    <form action="downloadfile">
                                                        <button class="btn btn-blue btn-dark" value="<s:property value="idfiles"/>" name="idfiles">
                                                            <span class="fa fa-magnet"></span>&nbsp; Download
                                                        </button>
                                                    </form>
                                                    <%
                                                        }
                                                    %>    
                                                </div>

                                                <div class="col-xs-8 col-sm-3 emphasis">
                                                    <h2>
                                                        <strong>43</strong></h2>
                                                    <p>
                                                        <small>Snippets</small>
                                                    </p>
                                                    <%if (user != null) {%>
                                                    <div class="btn-group dropup">
                                                        <button type="button" data-toggle="dropdown" class="btn btn-orange dropdown-toggle">
                                                            <span class="fa fa-gear"></span>&nbsp; Options
                                                        </button>
                                                        <ul role="menu" class="dropdown-menu pull-right text-left">
                                                            <li><a href="#"><span class="fa fa-envelope"></span>&nbsp; Send an email</a></li>
                                                            <li><a href="#"><span class="fa fa-list"></span>&nbsp; Add or remove from a list</a></li>
                                                            <li class="divider"></li>
                                                            <li><a href="#"><span class="fa fa-warning"></span>&nbsp; Report this user for spam</a></li>
                                                            <li class="divider"></li>
                                                            <li><a href="#" role="button" class="btn disabled">Unfollow</a></li>
                                                        </ul>
                                                    </div>
                                                    <%}%>
                                                </div>
                                            </div>
                                            <div id ="description" class="row  divider" style="margin-top: 2%; padding-left: 2%;min-height:300px;">
                                                <h4 ><strong>Description</strong></h4>
                                                <span><s:property value="filedes"/></span>
                                            </div>
                                            <div  id ="summary" class="row  divider" style="margin-top: 2%; padding-left: 2%;min-height:300px;">
                                                <h4 ><strong>File Summery</strong></h4>
                                                <br>
                                                <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true" style="width:98%">
                                                    <div class="panel panel-default">
                                                        <div class="panel-heading" role="tab" id="headingOne">
                                                            <h4 class="panel-title">
                                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                                                    <strong><s:property value="torrentname"/>&nbsp;&nbsp;(Size:&nbsp;<s:property value="totalsize"/>)</strong>
                                                                </a>
                                                            </h4>
                                                        </div>
                                                        <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                                                            <ul class="list-group">

                                                                <s:iterator  value="torrentinfo">  
                                                                    <fieldset>
                                                                        <li class="list-group-item"><s:property value="tname" /> &nbsp;&nbsp;<span style="float: right"> <s:property value="tsize" /><span></li>
                                                                                    </fieldset>
                                                                                </s:iterator>
                                                                                </ul>
                                                                                </div>
                                                                                </div>

                                                                                <br>
                                                                                <span><strong>Primary Tracker:&nbsp;&nbsp;</strong><a href"<s:property value="tracker"/>"> <s:property value="tracker"/></a></span>
                                                                                </div>

                                                                                <%
                                                                                    if (user != null) {
                                                                                %>
                                                                                <div id="comments" class="row divider" style="margin-top: 2%; padding: 2%;">
                                                                                    <h4 ><strong>Comments</strong></h4>
                                                                                    <form action="comment">
                                                                                        <div class="portlet-body">
                                                                                            <div style="padding: 10px; background-color: #f0f0f0;">
                                                                                                <div class="input-group">
                                                                                                    <input id="input-chat" onClick="this.setSelectionRange(0, this.value.length)" name="cmt" type="text" placeholder="Type a message here..." class="form-control">
                                                                                                    <span id="btn-chat" class="input-group-btn">
                                                                                                        <button value="<s:property value="idfiles"/>" name="idfiles" class="btn btn-green">comment</button>
                                                                                                    </span>
                                                                                                </div>
                                                                                            </div><br/><br/>
                                                                                            <div class="slimScrollDiv" style="width: 100%; min-height: 350px;">
                                                                                                <div class="chat-scroller" style="width: 100%; min-height: 350px;">
                                                                                                    <s:iterator  value="commentinfo">  
                                                                                                        <fieldset>
                                                                                                            <ul class="chats bv">                                                                                                    
                                                                                                                <li class="in">
                                                                                                                    <img src="<s:property value="image"/>" class="avatar img-responsive">
                                                                                                                    <div class="message">
                                                                                                                        <span class="chat-arrow"></span>
                                                                                                                        <%                                                                                                                            String usernameCurrent = (String) request.getAttribute("username");
                                                                                                                            if (user.equals(usernameCurrent)) {
                                                                                                                        %>
                                                                                                                        <a href="<s:url  action="Myprofile">
                                                                                                                               <s:param name="UserName" value="%{username}"/> </s:url>" class="chat-name"><s:property value="username"/></a>&nbsp;
                                                                                                                        <span class="chat-datetime">at <s:property value="timedate"/></span>
                                                                                                                        <%
                                                                                                                        } else {
                                                                                                                        %>
                                                                                                                        <a href="<s:url  action="ViewProfile">
                                                                                                                               <s:param name="UserName" value="%{username}" /> </s:url>" class="chat-name"><s:property value="username"/></a>&nbsp;
                                                                                                                        <span class="chat-datetime">at <s:property value="timedate"/></span>
                                                                                                                        <%
                                                                                                                            }
                                                                                                                        %>
                                                                                                                        <span class="chat-body"><s:property value="comment"/></span>
                                                                                                                    </div>
                                                                                                                </li>
                                                                                                            </ul>
                                                                                                        </fieldset>
                                                                                                    </s:iterator>
                                                                                                </div>                                                                                                                                   
                                                                                            </div>                                                                                        
                                                                                        </div>
                                                                                    </form>                                                                                                    
                                                                                </div>
                                                                                <%
                                                                                    }
                                                                                %>
                                                                                </div>
                                                                                </div>
                                                                                </div>
                                                                                </div>
                                                                                </div>
                                                                                </div>

                                                                                </div>

                                                                                </div>
                                                                                </div>
                                                                                </div>
                                                                                <!--END CONTENT-->
                                                                                <!--BEGIN FOOTER-->
                                                                                <div id="footer">
                                                                                    <div class="copyright">
                                                                                        <a href="#">2015 © </a></div>
                                                                                </div>
                                                                                <!--END FOOTER-->
                                                                                </div>
                                                                                <!--END PAGE WRAPPER-->
                                                                                </div>
                                                                                </div>
                                                                                <script src="script/jquery-1.10.2.min.js"></script>
                                                                                <script src="script/jquery-migrate-1.2.1.min.js"></script>
                                                                                <script src="script/jquery-ui.js"></script>
                                                                                <script src="script/bootstrap.min.js"></script>
                                                                                <script src="script/bootstrap-hover-dropdown.js"></script>
                                                                                <script src="script/html5shiv.js"></script>
                                                                                <script src="script/respond.min.js"></script>
                                                                                <script src="script/jquery.metisMenu.js"></script>
                                                                                <script src="script/jquery.slimscroll.js"></script>
                                                                                <script src="script/jquery.cookie.js"></script>
                                                                                <script src="script/icheck.min.js"></script>
                                                                                <script src="script/custom.min.js"></script>
                                                                                <script src="script/jquery.news-ticker.js"></script>
                                                                                <script src="script/jquery.menu.js"></script>
                                                                                <script src="script/pace.min.js"></script>
                                                                                <script src="script/holder.js"></script>
                                                                                <script src="script/responsive-tabs.js"></script>
                                                                                <script src="script/jquery.flot.js"></script>
                                                                                <script src="script/jquery.flot.categories.js"></script>
                                                                                <script src="script/jquery.flot.pie.js"></script>
                                                                                <script src="script/jquery.flot.tooltip.js"></script>
                                                                                <script src="script/jquery.flot.resize.js"></script>
                                                                                <script src="script/jquery.flot.fillbetween.js"></script>
                                                                                <script src="script/jquery.flot.stack.js"></script>
                                                                                <script src="script/jquery.flot.spline.js"></script>
                                                                                <script src="script/zabuto_calendar.min.js"></script>
                                                                                <script src="script/index.js"></script>
                                                                                <script src="script/highcharts.js"></script>
                                                                                <script src="script/data.js"></script>
                                                                                <script src="script/drilldown.js"></script>
                                                                                <script src="script/exporting.js"></script>
                                                                                <script src="script/highcharts-more.js"></script>
                                                                                <script src="script/charts-highchart-pie.js"></script>
                                                                                <script src="script/charts-highchart-more.js"></script>
                                                                                <script src="script/modernizr.min.js"></script>
                                                                                <script src="script/jplist.min.js"></script>
                                                                                <script src="script/jplist.js"></script>

                                                                                <!--CORE JAVASCRIPT-->
                                                                                <script src="script/main.js"></script>
                                                                                <script>        (function (i, s, o, g, r, a, m) {
                                                                                                            i['GoogleAnalyticsObject'] = r;
                                                                                                            i[r] = i[r] || function () {
                                                                                                                (i[r].q = i[r].q || []).push(arguments)
                                                                                                            }, i[r].l = 1 * new Date();
                                                                                                            a = s.createElement(o),
                                                                                                                    m = s.getElementsByTagName(o)[0];
                                                                                                            a.async = 1;
                                                                                                            a.src = g;
                                                                                                            m.parentNode.insertBefore(a, m)
                                                                                                        })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');
                                                                                                        ga('create', 'UA-145464-12', 'auto');
                                                                                                        ga('send', 'pageview');


                                                                                </script>
                                                                                </body>
                                                                                </html>