<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@page import="com.opensymphony.xwork2.util.ValueStack"%>
<%@page import="com.Loginfo"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="JavaSrc.Connections"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<%
    Connection con = Connections.conn();
    String query;
    String username = (String) session.getAttribute("username");
    if (username.equals("admin")) {
        query = "select distinct name from user where username!='" + username + "' AND username!='admin' AND status='Active'";
    } else {
        query = "select distinct name from user where username!='" + username + "' AND username!='admin'";
    }
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

        $("#search").autocomplete({
            autoFocus: true,
            source: availableTags
        });
    });
</script>

<div id="page-wrapper">
    <!--BEGIN TITLE & BREADCRUMB PAGE-->
    <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
        <div class="page-header pull-left">
            <div class="page-title">
                Add to Circle
            </div>
        </div>
        <ol class="breadcrumb page-breadcrumb pull-right">
            <li><i class="fa fa-home"></i>&nbsp;<a href="home">Home</a></li>

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
                                        <div id="grid-layout-table-1" class="box jplist">
                                            <div class="row mbl">
                                                <form action="Searchuser">
                                                    <div class="col-lg-6">
                                                        <div class="input-group"><input id="search" name="name" type="text" class="form-control"><span class="input-group-btn"><button type="button" class="btn btn-white">Search</button></span></div>
                                                    </div>
                                                </form>
                                            </div>                                         
                                            <div class="box text-shadow">
                                                <%!
                                                    String userincircle;
                                                    Connection con = Connections.conn();
                                                    String circlename;
                                                    Statement ps;
                                                    ResultSet rs;
                                                %>
                                                <table class="demo-tbl"><!--<item>1</item>-->
                                                    <s:iterator  value="people">  
                                                        <fieldset>
                                                            <tr class="tbl-item"><!--<img/>-->
                                                                <td class="img" style="width:160px;"><img src="<s:property value="photo"/>" alt="" title="" style="width:100%; height:40%;max-width:150px; max-height:180px;"/></td>
                                                                <!--<data></data>-->
                                                                <td class="td-block">
                                                                    <p class="date"></p>
                                                                    <p class="title">
                                                                        <a href="<s:url  action="ViewProfile">
                                                                               <s:param name="UserName" value="%{UserName}" /> </s:url>">                                                                            
                                                                           <s:property value="name"/>
                                                                        </a>
                                                                    </p>
                                                                    </br>
                                                                    <p class="desc">

                                                                        <%

                                                                            circlename = (String) session.getAttribute("username");
                                                                            userincircle = (String) request.getAttribute("UserName");
                                                                            System.out.println(circlename);
                                                                            System.out.println(userincircle);
                                                                            ps = con.createStatement();
                                                                            rs = ps.executeQuery("select * from circle where circlename='" + circlename + "' AND username='" + userincircle + "'");
                                                                            if (rs.next()) {
                                                                        %>
                                                                    <form action="Removefromcircle" method="post" >
                                                                        <button class="btn btn-green" value="<s:property value="UserName"/>" name="username2"><span class="fa fa-circle-o"></span>&nbsp;&nbsp;Friends</button></p>
                                                                    </form>
                                                                    <%
                                                                    } else {
                                                                    %>
                                                                    <form action="Addtocircle" method="post" >
                                                                        <button class="btn btn-blue" value="<s:property value="UserName"/>" name="username2">Add to Circles</button></p>
                                                                    </form>
                                                                    <%
                                                                        }
                                                                    %> 
                                                                    </p>
                                                                    <p class="like"></p></td>
                                                            </tr>
                                                            <!--<item>2</item>-->
                                                        </fieldset>
                                                    </s:iterator> 
                                                </table>
                                            </div>
                                            <div class="box jplist-no-results text-shadow align-center"><p>No results found</p></div>
                                            <div class="jplist-ios-button"><i class="fa fa-sort"></i>jPList Actions</div>
                                            <div class="jplist-panel box panel-bottom">
                                                <div data-control-type="drop-down" data-control-name="paging" data-control-action="paging" data-control-animate-to-top="true" class="jplist-drop-down form-control">
                                                    <ul class="dropdown-menu">
                                                        <li><span data-number="3"> 3 per page</span></li>
                                                        <li><span data-number="5"> 5 per page</span></li>
                                                        <li><span data-number="10" data-default="true"> 10 per page</span></li>
                                                        <li><span data-number="all"> view all</span></li>
                                                    </ul>
                                                </div>

                                                <div data-type="{start} - {end} of {all}" data-control-type="pagination-info" data-control-name="paging" data-control-action="paging" class="jplist-label btn btn-default"></div>
                                                <div data-control-type="pagination" data-control-name="paging" data-control-action="paging" data-control-animate-to-top="true" class="jplist-pagination"></div>
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
