<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="JavaSrc.Connections"%>
<%@page import="java.sql.Connection"%>
<%@ taglib uri="/struts-tags" prefix="s" %>


<div id="page-wrapper">
    <!--BEGIN TITLE & BREADCRUMB PAGE-->
    <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
        <div class="page-header pull-left">
            <div class="page-title">
                Profile View</div>
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
                                            <div style="margin-bottom: 15px" class="row" >
                                                <div class="col-xs-12 col-sm-2 text-center">
                                                    <figure><img src="<s:property value="image"/>" alt="" style="display: inline-block" class="img-responsive img-circle">
                                                        <figcaption class="ratings"><p><a href="#"><span class="fa fa-star"></span></a><a href="#"><span class="fa fa-star"></span></a><a href="#"><span class="fa fa-star"></span></a><a href="#"><span class="fa fa-star"></span></a><a href="#"><span class="fa fa-star-o"></span></a></p></figcaption>
                                                    </figure>
                                                </div>
                                                <div class="col-xs-12 col-sm-8">
                                                    <h2>
                                                        <s:property value="name"/></h2>
                                                    <p>
                                                        <strong>Email:</strong> <s:property value="email"/></p>
                                                    <p>
                                                        <strong>Status:</strong> Active</p>
                                                    <p>
                                                        <strong class="mrs">Member&nbsp;&nbsp;Since:</strong><span class="label label-green mrs">Jun 03, 2014</p>
                                                </div>

                                            </div>
                                            <div class="row text-center divider">
                                                <div class="col-xs-12 col-sm-4 emphasis">
                                                    <h2>
                                                        <strong><s:property value="circle"/></strong></h2>
                                                    <p>
                                                        <small>Circle</small>
                                                    </p>

                                                    <%! String userincircle;%> 
                                                    <%
                                                        Connection con = Connections.conn();
                                                        String circlename = (String) session.getAttribute("username");
                                                        userincircle = (String) request.getAttribute("UserName");
                                                        System.out.println(circlename);
                                                        System.out.println(userincircle);
                                                        Statement ps = con.createStatement();
                                                        ResultSet rs = ps.executeQuery("select * from circle where circlename='" + circlename + "' AND username='" + userincircle + "'");
                                                        if (rs.next()) {
                                                    %>                                                    
                                                    <form action="Removefromcircle1" method="post" >
                                                        <button class="btn btn-yellow btn-block" value="<s:property value="UserName"/>" name="username2"><span class="fa fa-minus-circle"></span>&nbsp;Remove from Circle</button></p>
                                                    </form>
                                                    <%
                                                    } else {
                                                    %>
                                                    <form action="Addtocircle1" method="post" >
                                                        <button class="btn btn-yellow btn-block" value="<s:property value="UserName"/>" name="username2"><span class="fa fa-plus-circle"></span>&nbsp;Add to Circle</button></p>
                                                    </form>
                                                    <%
                                                        }
                                                    %> 

                                                </div>
                                                <div class="col-xs-12 col-sm-4 emphasis">
                                                    <h2>
                                                        <strong><s:property value="likes"/></strong></h2>
                                                    <p>
                                                        <small>Likes</small>
                                                    </p>

                                                    <%! String liketo;%> 
                                                    <%
                                                        String likefrom = (String) session.getAttribute("username");
                                                        liketo = (String) request.getAttribute("UserName");
                                                        System.out.println(likefrom);
                                                        System.out.println(liketo);
                                                        Statement ps1 = con.createStatement();
                                                        ResultSet rs1 = ps1.executeQuery("select * from likeuser where likes='" + likefrom + "'AND username='" + liketo + "'");
                                                        if (rs1.next()) {
                                                    %>                                                    
                                                    <form action="addtounlike" method="post" >
                                                        <button class="btn btn btn-blue btn-block" value="<s:property value="UserName"/>" name="username2"><span class="fa fa-user"></span>&nbsp;Unlike</button></p>
                                                    </form>
                                                    <%
                                                    } else {
                                                    %>
                                                    <form action="addtolike" method="post" >
                                                        <button class="btn btn btn-blue btn-block" value="<s:property value="UserName"/>" name="username2"><span class="fa fa-user"></span>&nbsp;Like</button></p>
                                                    </form>
                                                    <%
                                                        }
                                                    %>

                                                </div>
                                                <div class="col-xs-12 col-sm-4 emphasis">
                                                    <h2>
                                                        <strong>43</strong></h2>
                                                    <p>
                                                        <small>Snippets</small>
                                                    </p>
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
                                                </div>
                                            </div>

                                            <div class="row divider" style="margin-top: 2%; padding: 2%;">
                                                <ul class="nav nav-tabs">
                                                    <li role="presentation" class="active"><a href="#">Time Line</a></li>

                                                </ul> 
                                                <div class="col-lg-12">
                                                    <jsp:include page="/timeline.jsp"></jsp:include>
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

</body>
</html>