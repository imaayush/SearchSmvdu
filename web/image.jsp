<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.CountLDRFile"%>
<%@page import="com.CountLDRFile"%>
<%@page import="com.Files"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="JavaSrc.Connections"%>
<%@page import="java.sql.Connection"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<s:bean id="search" name="com.SearchAction"/>
<div id="page-wrapper">
    <!--BEGIN TITLE & BREADCRUMB PAGE-->
    <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
        <div class="page-header pull-left">
            <div class="page-title">
                Home</div>
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
                                            <div class="jplist-ios-button"><i class="fa fa-sort"></i>jPList Actions</div>

                                            <div class="box text-shadow">
                                                <table class="demo-tbl"><!--<item>1</item>-->

                                                    <tr class="tbl-item"><!--<img/>-->

                                                        <td class="td-block" style="width:60%;">
                                                            <strong style="font-size: 18px; margin-left:1.5%;">Most Popular</strong><br>
                                                            <%
                                                                Connection con = Connections.conn();
                                                                String[] ids = new String[5];
                                                                String[] tags = new String[5];
                                                                String[] name = new String[5];
                                                                Statement ps = con.createStatement();
                                                                ResultSet rs = ps.executeQuery("select filename,filetags,filedescription ,idfiles, datetime,viewed from files ORDER BY viewed DESC");
                                                                int i = 0;
                                                                while (rs.next() && i < 5) {

                                                                    ids[i] = rs.getString(4);
                                                                    tags[i] = rs.getString(2);
                                                                    name[i] = rs.getString(1);
                                                                    i++;
                                                                }
                                                                con.close();
                                                            %>

                                                            <div class="col-lg-12" style=" height:350px;">

                                                                <header id="myCarousel" class="carousel slide">
                                                                    <!-- Indicators -->


                                                                    <!-- Wrapper for Slides -->
                                                                    <div class="carousel-inner">
                                                                        <div class="item active">
                                                                            <!-- Set the first background image using inline CSS below. -->
                                                                            <div class="fill" style="background-image:url('images/<%=tags[0]%>.jpg');"></div>
                                                                            <div class="carousel-caption">
                                                                                <a href="fileview?fileid=<%=ids[0]%>">    
                                                                                    <span style="font-size:16px;color:red"><%=name[0]%></span>
                                                                                </a>
                                                                            </div>
                                                                        </div>
                                                                        <div class="item">
                                                                            <!-- Set the second background image using inline CSS below. -->
                                                                            <div class="fill" style="background-image:url('images/<%=tags[1]%>.jpg');"></div>
                                                                            <div class="carousel-caption">
                                                                                <a href="fileview?fileid=<%=ids[1]%>">  
                                                                                    <span style="font-size:16px;color:red"><%=name[1]%></span>
                                                                                </a>
                                                                            </div>
                                                                        </div>
                                                                        <div class="item">
                                                                            <!-- Set the third background image using inline CSS below. -->
                                                                            <div class="fill" style="background-image:url('images/<%=tags[2]%>.jpg');"></div>
                                                                            <div class="carousel-caption">
                                                                                <a href="fileview?fileid=<%=ids[2]%>">     
                                                                                    <span style="font-size:16px;color:red"> <%=name[2]%></span>
                                                                                </a>
                                                                            </div>
                                                                        </div>
                                                                        <div class="item">
                                                                            <!-- Set the third background image using inline CSS below. -->
                                                                            <div class="fill" style="background-image:url('images/<%=tags[3]%>.jpg');"></div>
                                                                            <div class="carousel-caption">
                                                                                <a href="fileview?fileid=<%=ids[3]%>">   

                                                                                    <span style="font-size:16px;color:red"><%=name[3]%><span style="font-size:16px;color:red">
                                                                                            </a>
                                                                                            </div>
                                                                                        </div><div class="item">
                                                                                        <!-- Set the third background image using inline CSS below. -->
                                                                                        <div class="fill" style="background-image:url('images/<%=tags[4]%>.jpg');"></div>
                                                                                        <div class="carousel-caption">
                                                                                            <a href="fileview?fileid=<%=ids[4]%>">       
                                                                                                <span style="font-size:16px;color:red">  <%=name[4]%> <span style="font-size:16px;color:red">
                                                                                                        </a>
                                                                                                        </div>
                                                                                                        </div>
                                                                                                        </div>

                                                                                                        <!-- Controls -->
                                                                                                        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                                                                                                            <span class="icon-prev"></span>
                                                                                                        </a>
                                                                                                        <a class="right carousel-control" href="#myCarousel" data-slide="next">
                                                                                                            <span class="icon-next"></span>
                                                                                                        </a>

                                                                                                        </header>

                                                                                                        <!-- jQuery -->
                                                                                                        <script src="images/img/js/jquery.js"></script>

                                                                                                        <!-- Bootstrap Core JavaScript -->
                                                                                                        <script src="images/img/js/bootstrap.min.js"></script>

                                                                                                        <!-- Script to Activate the Carousel -->


                                                                                                        </td>
                                                                                                        <td  rowspan="2"><div><strong style="font-size:16px;"> Recent Notification</strong>
                                                                                                                <hr class="hr"></div>
                              
                                                                                                            <div style="height:700px; overflow: auto;">
                                                                                                               
                                   
                                        
                                      
                                        
                                        <%        
                                            
                                            con = Connections.conn();
                                            String q2 = "select  notification,notifications.username,files.username ,notifications.idfiles,filedescription,filetags,filename,notificationdatetime,image from circle inner join notifications on notifications.username=circle.username inner join files on notifications.idfiles=files.idfiles inner join user  on circle.username=user.username order by notificationdatetime desc";
                                            Statement st = con.createStatement();
                                            rs = st.executeQuery(q2);
                                            while (rs.next()) {
                                              
                                            
                                        %>
                                        <div style="height:50px;">
                                        <a href="<s:url  action="fileview"><s:param name="fileid"><%=rs.getString(4)%></s:param></s:url>"> 
                                                   
                                                      
                                                            <div style="width:40px;float:left;padding-left:2%;">  
                                                                <img src="<%=rs.getString(9)%>" class="avatar img-responsive"/>
                                                    </div>
                                                    <div style="width: 235px; float: left; padding-left: 2%;">
                                                        <%=rs.getString(2)%>
                                                        <%=rs.getString(1)%> a <%=rs.getString(6)%>
                                                    </div>
                                                    <div style="width:30px;float:left;padding-right:2%;"><img data-src="images/movie.jpg" alt="avatar" class="media-object" src="images/<%=rs.getString(6)%>.jpg" style="width: 40px; height: 40px;">
                                                    </div>
                                                
                                            
                                        </a></div>
                                        <%
                                                }
                                            
                                        %>
                                    </div>
                                
                                                                                                            </td>
                                                                                                        </tr>

                                                                                                        <tr class="tbl-item"><!--<img/>-->

                                                                                                            <td class="td-block">
                                                                                                        
                                                                                                                <strong style="font-size: 18px; margin-left:1.5%;">Recently Add</strong><br>
                                                                                                                <%
                                                                                                                    con = Connections.conn();
                                                                                                                    String[] ids1 = new String[5];
                                                                                                                    String[] tags1 = new String[5];
                                                                                                                    String[] name1 = new String[5];
                                                                                                                    ps = con.createStatement();
                                                                                                                    rs = ps.executeQuery("select filename,filetags,filedescription ,idfiles, datetime,viewed from files ORDER BY datetime DESC");
                                                                                                                    i = 0;
                                                                                                                    while (rs.next() && i < 5) {

                                                                                                                        ids1[i] = rs.getString(4);
                                                                                                                        tags1[i] = rs.getString(2);
                                                                                                                        name1[i] = rs.getString(1);
                                                                                                                        i++;
                                                                                                                    }
                                                                                                                    con.close();
                                                                                                                    %>
                                                                                                                <div class="col-lg-12" style=" height:350px; ">
                                                                                                                    <header id="myCarousel1" class="carousel slide">
                                                                                                                        <!-- Indicators -->


                                                                                                                        <!-- Wrapper for Slides -->
                                                                                                                        <div class="carousel-inner">
                                                                                                                            <div class="item active">
                                                                                                                                <!-- Set the first background image using inline CSS below. -->
                                                                                                                                <div class="fill" style="background-image:url('images/<%=tags1[0]%>.jpg');"></div>
                                                                                                                                <div class="carousel-caption">
                                                                                                                                    <a href="fileview?fileid=<%=ids1[0]%>">    
                                                                                                                                        <span style="font-size:16px;color:red"><%=name1[0]%></span>
                                                                                                                                    </a>
                                                                                                                                </div>
                                                                                                                            </div>
                                                                                                                            <div class="item">
                                                                                                                                <!-- Set the second background image using inline CSS below. -->
                                                                                                                                <div class="fill" style="background-image:url('images/<%=tags1[1]%>.jpg');"></div>
                                                                                                                                <div class="carousel-caption">
                                                                                                                                    <a href="fileview?fileid=<%=ids1[1]%>">  
                                                                                                                                        <span style="font-size:16px;color:red"><%=name1[1]%></span>
                                                                                                                                    </a>
                                                                                                                                </div>
                                                                                                                            </div>
                                                                                                                            <div class="item">
                                                                                                                                <!-- Set the third background image using inline CSS below. -->
                                                                                                                                <div class="fill" style="background-image:url('images/<%=tags1[2]%>.jpg');"></div>
                                                                                                                                <div class="carousel-caption">
                                                                                                                                    <a href="fileview?fileid=<%=ids1[2]%>">     
                                                                                                                                        <span style="font-size:16px;color:red"> <%=name1[2]%></span>
                                                                                                                                    </a>
                                                                                                                                </div>
                                                                                                                            </div>
                                                                                                                            <div class="item">
                                                                                                                                <!-- Set the third background image using inline CSS below. -->
                                                                                                                                <div class="fill" style="background-image:url('images/<%=tags1[3]%>.jpg');"></div>
                                                                                                                                <div class="carousel-caption">
                                                                                                                                    <a href="fileview?fileid=<%=ids1[3]%>">   

                                                                                                                                        <span style="font-size:16px;color:red"><%=name1[3]%><span style="font-size:16px;color:red">
                                                                                                                                                </a>
                                                                                                                                                </div>
                                                                                                                                            </div><div class="item">
                                                                                                                                            <!-- Set the third background image using inline CSS below. -->
                                                                                                                                            <div class="fill" style="background-image:url('images/<%=tags1[4]%>.jpg');"></div>
                                                                                                                                            <div class="carousel-caption">
                                                                                                                                                <a href="fileview?fileid=<%=ids1[4]%>">       
                                                                                                                                                    <span style="font-size:16px;color:red">  <%=name1[4]%> <span style="font-size:16px;color:red">
                                                                                                                                                            </a>
                                                                                                                                                            </div>
                                                                                                                                                            </div>
                                                                                                                                                            </div>

                                                                                                                                                            <!-- Controls -->
                                                                                                                                                            <a class="left carousel-control" href="#myCarousel1" data-slide="prev">
                                                                                                                                                                <span class="icon-prev"></span>
                                                                                                                                                            </a>
                                                                                                                                                            <a class="right carousel-control" href="#myCarousel1" data-slide="next">
                                                                                                                                                                <span class="icon-next"></span>
                                                                                                                                                            </a>

                                                                                                                                                            </header>

                                                                                                                                                            <!-- jQuery -->
                                                                                                                                                            <script src="images/img/js/jquery.js"></script>

                                                                                                                                                            <!-- Bootstrap Core JavaScript -->
                                                                                                                                                            <script src="images/img/js/bootstrap.min.js"></script>

                                                                                                                                                            <!-- Script to Activate the Carousel -->


                                                                                                                                                            </td>

                                                                                                                                                            </tr>

                                                                                                                                                            </table>
                                                                                                                                                            </div>

                                                                                                                                                            <div class="jplist-ios-button"><i class="fa fa-sort"></i>jPList Actions</div>
                                                                                                                                                            <div class="jplist-panel box panel-bottom">





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