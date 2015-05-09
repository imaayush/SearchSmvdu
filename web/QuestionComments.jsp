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
                                                                <h4><strong></strong></h4>
                                                                <div class="portlet-body" style="min-height: 300px;">
                                                                    <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: 100%; ">
                                                                        <div class="chat-scroller" style="overflow: hidden; width: 100%; ">
                                                                            <ul class="chats bv">
                                                                                <li class="in">
                                                                                    <img src="<s:property value="img"/>" class="avatar img-responsive">
                                                                                    <div class="message">
                                                                                        <span class="chat-arrow"></span>
                                                                                        <h4><strong><s:property value="question"/></strong></h4>
                                                                                        uploaded by
                                                                                        <%
                                                                                            String usernameCurrent = (String) request.getAttribute("username");
                                                                                            if (((String) session.getAttribute("username")).equals(usernameCurrent)) {
                                                                                        %>
                                                                                        <a href="<s:url  action="Myprofile">
                                                                                               <s:param name="UserName" value="%{username}"/> </s:url>" class="chat-name"><s:property value="username"/>
                                                                                           </a>&nbsp;                                                                                       
                                                                                        <%
                                                                                        } else {
                                                                                        %>
                                                                                        <a href="<s:url  action="ViewProfile">
                                                                                               <s:param name="UserName" value="%{username}" /> </s:url>" class="chat-name"><s:property value="username"/>
                                                                                           </a>&nbsp;                                                                                        
                                                                                        <%
                                                                                            }
                                                                                        %>
                                                                                        <span class="chat-datetime">at&nbsp;&nbsp;&nbsp;<s:property value="time"/>&nbsp;&nbsp; </span>
                                                                                    </div>
                                                                                </li>
                                                                            </ul>
                                                                        </div>
                                                                    </div>
                                                                    <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: 94%; margin-left: 6%;">
                                                                        <div class="chat-scroller" style="overflow: hidden; width: 100%; ">
                                                                            <s:iterator value="forum">
                                                                                <fieldset>
                                                                                    <ul class="chats bv">
                                                                                        <li class="in">
                                                                                            <img src="<s:property value="image"/>" class="avatar img-responsive">
                                                                                            <div class="message">
                                                                                                <span class="chat-arrow"></span>                                                                                                
                                                                                                <h4><strong>Answered by</strong></h4>
                                                                                                <%
                                                                                            String usernameCurrentAnswer = (String) request.getAttribute("usernameAnswer");        
                                                                                            if (((String) session.getAttribute("username")).equals(usernameCurrentAnswer)) {
                                                                                                %>
                                                                                                <a href="<s:url  action="Myprofile">
                                                                                                       <s:param name="UserName" value="%{username}"/> </s:url>" class="chat-name"><s:property value="username"/>
                                                                                                   </a>&nbsp;                                                                                       
                                                                                                <%
                                                                                                } else {
                                                                                                %>
                                                                                                <a href="<s:url  action="ViewProfile">
                                                                                                       <s:param name="UserName" value="%{usernameAnswer}" /> </s:url>" class="chat-name"><s:property value="usernameAnswer"/>
                                                                                                   </a>&nbsp;                                                                                        
                                                                                                <%
                                                                                                    }
                                                                                                %>
                                                                                                <span class="chat-datetime">at&nbsp;&nbsp;&nbsp;<s:property value="timeAnswer"/>&nbsp;&nbsp; </span>
                                                                                                <hr class="hr">
                                                                                                <s:property value="answer"/>
                                                                                                <br/><br/>
                                                                                            </div>
                                                                                        </li>
                                                                                    </ul>
                                                                                </fieldset>
                                                                            </s:iterator>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <form action="Addanswertoquestion">
                                                                    <div style="padding: 10px; margin-left: 60px;">
                                                                        <h4><strong>Your Answer</strong></h4><br/>
                                                                        <div class="input-group">                                                                            
                                                                            <textarea id="input-chat" onClick="this.setSelectionRange(0, this.value.length)" class="form-control" name="youranswer" cols="92" rows="15" tabindex="101" data-min-length="" placeholder="Type a message here..."></textarea>
                                                                        </div><br/>
                                                                        <button value="<s:property value="idforumquestion"/>" name="idforumquestion" class="btn btn-green">Post Your Answer</button>
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