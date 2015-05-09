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
                                                <table class="demo-tbl">
                                                    <tr class="tbl-item">
                                                        <td class="td-block">
                                                            <s:iterator  value="note">  
                                                                <fieldset>

                                                                    <div class="portlet-body">
                                                                        <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: 100%; "><div class="chat-scroller" style="overflow: hidden; width: 100%; ">
                                                                                <ul class="chats bv">
                                                                                    <li class="in">
                                                                                        <img src="<s:property value="image"/>" class="avatar img-responsive">
                                                                                        <div class="message">
                                                                                            <span class="chat-arrow"></span><a  class="title" href="<s:url  action="ViewProfile">
                                                                                                                                    <s:param name="UserName" value="%{username}" /> </s:url>">                                                                            
                                                                                                                                <s:property value="username"/>
                                                                                            </a>&nbsp;<span class="chat-datetime">at&nbsp;&nbsp;&nbsp;<s:property value="datetime"/>&nbsp;&nbsp; </span><span class="chat-body"><s:property value="notifications"/> a <s:property value="filetags"/>
                                                                                            </span>
                                                                                            <hr class="hr">
                                                                                            <ul class="media-list">
                                                                                                <li class="media"><a href="#" class="pull-left"><img data-src="images/movie.jpg" alt="avatar" class="media-object" src="images/<s:property value="filetags"/>.jpg" style="width: 64px; height: 64px;"></a>

                                                                                                    <div class="media-body"><h4 class="media-heading"><a href="<s:url  action="fileview">
                                                                                                                                                             <s:param name="fileid" value="%{fileid}" /> </s:url>" >     
                                                                                                                                                         <s:property value="filename"/>       </a>
                                                                                                            &nbsp;<span class="chat-datetime"> uploaded by &nbsp;&nbsp;<s:property value="fileusername"/> </span>
                                                                                                        </h4>

                                                                                                        <p><span class="chat-body" style="color:black"> <s:property value="filedis"/></span></p>
                                                                                                    </div>
                                                                                                    </div>
                                                                                                    </div>
                                                                                                    </div>
                                                                                                </li>

                                                                                            </ul>

                                                                                        </div>
                                                                                    </li>

                                                                                </ul>
                                                                            </div></div>

                                                                    </div>



                                                                </fieldset>
                                                            </s:iterator> </td>
                                                    </tr>
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
                                                <div data-control-type="drop-down" data-control-name="sort" data-control-action="sort" data-control-animate-to-top="true" data-datetime-format="{month}/{day}/{year}" class="jplist-drop-down form-control">
                                                    <ul class="dropdown-menu">
                                                        <li><span data-path="default">Sort by</span></li>
                                                        <li><span data-path=".title" data-order="asc" data-type="text">Title A-Z</span></li>
                                                        <li><span data-path=".title" data-order="desc" data-type="text">Title Z-A</span></li>
                                                        <li><span data-path=".desc" data-order="asc" data-type="text">Description A-Z</span></li>
                                                        <li><span data-path=".desc" data-order="desc" data-type="text">Description Z-A</span></li>
                                                        <li><span data-path=".like" data-order="asc" data-type="number" data-default="true">Likes asc</span></li>
                                                        <li><span data-path=".like" data-order="desc" data-type="number">Likes desc</span></li>
                                                        <li><span data-path=".date" data-order="asc" data-type="datetime">Date asc</span></li>
                                                        <li><span data-path=".date" data-order="desc" data-type="datetime">Date desc</span></li>
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