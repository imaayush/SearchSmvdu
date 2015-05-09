<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="JavaSrc.Connections"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<div id="page-wrapper">
    <!--BEGIN TITLE & BREADCRUMB PAGE-->
    <%@ taglib uri="/struts-tags" prefix="s" %>  

    <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
        <div class="page-header pull-left">
            <div class="page-title">
                Email Box</div>
        </div>
        <ol class="breadcrumb page-breadcrumb pull-right">
            <li><i class="fa fa-home"></i>&nbsp;<a href="home">Home</a>&nbsp;&nbsp;</i>&nbsp;&nbsp;</li>


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


                    <div class="row">
                        <div class="col-sm-3 col-md-2">

                        </div>
                        <form action="Mailbox">
                            <div class="col-sm-9 col-md-10">
                                <!--<div class="btn-group">
                                    <button type="button" class="btn btn-default"><input type="checkbox" style="margin: 0; vertical-align: middle;" class="checkall"/></button>
                                    <button type="button" data-toggle="dropdown" class="btn btn-default dropdown-toggle"><span class="caret"></span><span class="sr-only">Toggle Dropdown</span></button>
                                    <ul role="menu" class="dropdown-menu">
                                        <li><a href="#">All</a></li>
                                        <li><a href="#">None</a></li>
                                        <li><a href="#">Read</a></li>
                                        <li><a href="#">Unread</a></li>
                                        <li><a href="#">Starred</a></li>
                                        <li><a href="#">Unstarred</a></li>
                                    </ul>
                                <button type="button" data-toggle="tooltip" title="Refresh" class="btn btn-default mls mrs"><span class="fa fa-refresh"></span></button>
                                </div>-->   
                                <button data-toggle="tooltip" title="Refresh" class="btn btn-default mls mrs"><span class="fa fa-refresh"></span></button>
                                <a href="Allread" data-toggle="tooltip" class="btn btn-default mls mrs">All Read</a>
                            </div>
                        </form>
                    </div>
                    <div class="mtl mbl"></div>
                    <div class="row">
                        <div class="col-sm-3 col-md-2"><a href="#myModal" role="button" class="btn btn-danger btn-sm btn-block" data-toggle="modal" >COMPOSE</a>
                            <jsp:include page="/compose.jsp"/>
                            <div class="mtm mbm"></div>
                            <div class="panel">
                                <div class="panel-body pan">
                                    <ul style="background: #fff" class="nav nav-pills nav-stacked">
                                        <%
                                            Connection con = Connections.conn();
                                            int number = 0;
                                            String email = (String) session.getAttribute("email");
                                            System.out.println(email);
                                            Statement st = con.createStatement();
                                            ResultSet rs = st.executeQuery("select * from message where receiveremail='" + email + "' And receiver='Unread'");
                                            while (rs.next()) {
                                                number++;
                                            }
                                        %>
                                        <li class="active"><a href="Mailbox"><span class="badge pull-right"><%=number%></span><i class="fa fa-inbox fa-fw mrs"></i>Inbox</a></li>
                                        <!--<li><a href="#"><i class="fa fa-star-o fa-fw mrs"></i>Starred</a></li>-->
                                        <li><a href="Importantmail"><i class="fa fa-info-circle fa-fw mrs"></i>Important</a></li>
                                        <li><a href="Starredmail"><i class="fa fa-star fa-fw mrs"></i>Starred</a></li>
                                        <li><a href="Sentmail"><i class="fa fa-plane fa-fw mrs"></i>Sent Mail</a></li>                                        
                                    </ul>
                                </div>
                            </div>
                            <hr/>
                        </div>
                        <div class="col-sm-9 col-md-10">
                            <s:iterator  value="mailinfo">  
                                <fieldset>
                                    <%
                                        String status = (String) request.getAttribute("status");
                                        String mail = (String) request.getAttribute("mail");
                                        System.out.println(mail);
                                        if (status.equals("Unread") && mail.equals(email)) {
                                    %>
                                    <div style="background-color: #FDFFFF; border-top: window 1px groove; height: 25px;">
                                        <%
                                        } else {
                                        %>
                                        <div style="background-color: #EFF3F0; border-top: window 1px groove; height: 25px;">
                                            <%
                                                }
                                            %>
                                            <%
                                                String body;
                                                body = (String) request.getAttribute("body");

                                                if (body.length()
                                                        > 30) {
                                                    body = body.substring(0, 30);
                                                }
                                            %>

                                            <input type="checkbox"/>
                                            <%
                                                String starred = (String)request.getAttribute("starred");
                                                if(starred.equals("No")){
                                            %>
                                            <a href="<s:url action="Updatestarredmail"><s:param name="idmessage"><s:property value="idmessage"/></s:param></s:url>"><span class="fa fa-star-o mlm"></span></a>
                                            <%
                                                }else{
                                            %>
                                            <a href="<s:url action="Updatestarredmail"><s:param name="idmessage"><s:property value="idmessage"/></s:param></s:url>"><span class="fa fa-star mlm" style="color: goldenrod;"></span></a>
                                            <%
                                                }
                                            %>
                                            <%
                                                String important = (String)request.getAttribute("important");
                                                if(important.equals("No")){
                                            %>
                                            <a href="<s:url action="Updateimportantmail"><s:param name="idmessage"><s:property value="idmessage"/></s:param></s:url>"><span class="fa fa-bookmark-o mrm mlm"></span></a>
                                            <%
                                                }else{
                                            %>
                                            <a href="<s:url action="Updateimportantmail"><s:param name="idmessage"><s:property value="idmessage"/></s:param></s:url>"><span class="fa fa-bookmark mrm mlm" style="color: goldenrod;"></span></a>
                                            <%
                                                }
                                            %>
                                            <a href="<s:url action="viewemail"><s:param name="msgid" value="%{idmessage}"></s:param></s:url>">

                                                        <span style="min-width: 120px; display: inline-block;" class="name"><s:property value="sendername"/></span>
                                                <span><s:property value="sub"/></span>&nbsp; - &nbsp;<span style="font-size: 11px;" class="text-muted"><%=body%>
                                                </span><span style="float:right; font-style: italic;"><s:property value="time"/></span>

                                            </a>
                                        </div>

                                </fieldset>
                            </s:iterator> 
                            <div style="background-color: #EFF3F0; border-top: window 1px groove;">

                            </div>
                        </div>
                        <div class="common-modal modal fade" id="common-Modal1" tabindex="-1" role="dialog" aria-hidden="true">
                            <div class="modal-content">
                                <ul class="list-inline item-details">
                                    <li><a href="http://themifycloud.com">Admin templates</a></li>
                                    <li><a href="http://themescloud.org">Bootstrap themes</a></li>
                                </ul>
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
            <a href="#">2015 ©</a></div>
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
<!--LOADING SCRIPTS FOR CHARTS-->
<script src="script/highcharts.js"></script>
<script src="script/data.js"></script>
<script src="script/drilldown.js"></script>
<script src="script/exporting.js"></script>
<script src="script/highcharts-more.js"></script>
<script src="script/charts-highchart-pie.js"></script>
<script src="script/charts-highchart-more.js"></script>
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
