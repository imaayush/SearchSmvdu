<%@ taglib uri="/struts-tags" prefix="s" %>
<div id="page-wrapper">
    <!--BEGIN TITLE & BREADCRUMB PAGE-->
    <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
        <div class="page-header pull-left">
            <div class="page-title">
                Forum</div>
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
                                            <div class="box text-shadow">
                                                <table class="demo-tbl">
                                                    <tr class="tbl-item">
                                                        <td class="td-block">
                                                            <div id="comments" class="row divider" style="padding: 2%; margin-top: -3%">
                                                                <h4 ><strong>Add new Question</strong></h4>
                                                                <form action="Addforumquestion">
                                                                    <div class="portlet-body">
                                                                        <div style="padding: 10px; background-color: #f0f0f0;">
                                                                            <div class="input-group">
                                                                                <input id="input-chat" onClick="this.setSelectionRange(0, this.value.length)" name="question" type="text" placeholder="Type a discussion question here..." class="form-control">
                                                                                <span id="btn-chat" class="input-group-btn">
                                                                                    <button class="btn btn-green">Submit</button>
                                                                                </span>
                                                                            </div>
                                                                        </div><br/><br/>
                                                                        <h4 style="margin-bottom: -10px"><strong>All Questions</strong></h4>
                                                                        <div style="min-height: 250px; ">
                                                                            <s:iterator  value="forum">  
                                                                                <fieldset>
                                                                                    <hr class="hr"/>
                                                                                    <p class="title">
                                                                                        <a href="<s:url action="Questioncomments"><s:param name="idforumquestion"><s:property value="idforumquestion"/></s:param></s:url>" style="color: #07c; ">     
                                                                                            <s:property value="question"/>
                                                                                        </a>
                                                                                        <br/>
                                                                                        <span class="fa fa-reply-all"></span>&nbsp;&nbsp;<span style="color:black;"><s:property value="answered"/></span>&nbsp;&nbsp;&nbsp;&nbsp;
                                                                                        <span class="fa fa-check" style="color: #06b53c;"></span>&nbsp;&nbsp;<span style="color:black;"><s:property value="viewed"/></span>
                                                                                    </p>                                                                                 
                                                                                </fieldset>
                                                                            </s:iterator>
                                                                        </div>
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div class="box jplist-no-results text-shadow align-center"><p>No results found</p></div>                                            
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