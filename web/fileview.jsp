<%@ taglib uri="/struts-tags" prefix="s" %>
<s:bean id="file" name="com.fileviewAction"/>
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
                                            <div style="margin-bottom: 15px" class="row">
                                                <div class="col-xs-12 col-sm-4 text-center">
                                                    <figure><img src="images/movie.jpg" alt="" style="display: inline-block" class="img-responsive img- btn-dark ">
                                                        <figcaption class="ratings"><p><a href="#"><span class="fa fa-star"></span></a><a href="#"><span class="fa fa-star"></span></a><a href="#"><span class="fa fa-star"></span></a><a href="#"><span class="fa fa-star"></span></a><a href="#"><span class="fa fa-star-o"></span></a></p></figcaption>
                                                    </figure>
                                                </div>
                                                <div class="col-xs-12 col-sm-8">
                                                    <h2>

                                                        <s:property value="filename"/></h2>
                                                    <p style="color: green;">
                                                        <strong >Seeders:</strong> 4</p>
                                                    <p style="color: red;">
                                                        <strong >leechers:</strong> 
                                                        5  </p>
                                                    <p>
                                                        <strong class="mrs">Tags:</strong><span class="label label-green mrs"><s:property value="filetags"/></span></p>
                                                </div>

                                            </div>
                                            <div class="row text-center divider">
                                                <div class="col-xs-8 col-sm-3 emphasis">
                                                    <h2>
                                                        <strong>20,7K</strong></h2>
                                                    <p>
                                                        <small>likes</small>
                                                    </p>
                                                    <button class="btn btn-yellow btn-block">
                                                        <span class="fa fa-plus-circle"></span>&nbsp; Like
                                                    </button>
                                                </div>
                                                <div class="col-xs-8 col-sm-3 emphasis">
                                                    <h2>
                                                        <strong>245</strong></h2>
                                                    <p>
                                                        <small>Recommendation</small>
                                                    </p>
                                                    <button class="btn btn-blue btn-block">
                                                        <span class="fa fa-user"></span>&nbsp; Recommended
                                                    </button>
                                                </div>
                                                <div class="col-xs-8 col-sm-3 emphasis">
                                                    <h2>
                                                        <strong>245</strong></h2>
                                                    <p>
                                                        <small>Downloaded</small>
                                                    </p>
                                                    <form action="downloadfile">
                                                    <button class="btn btn-blue btn-dark" value="<s:property value="idfiles"/>" name="idfiles">
                                                        <span class="fa fa-magnet"></span>&nbsp; Download
                                                    </button>
                                                    </form>
                                                </div>
                                                <div class="col-xs-8 col-sm-3 emphasis">
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
                                            <div class="row  divider" style="margin-top: 2%; padding-left: 2%;min-height:200px;">
                                                <h4 ><strong>Description</strong></h4>
                                                <span><s:property value="filedes"/></span>
                                            </div>
                                            <div class="row divider" style="margin-top: 2%; padding: 2%;">
                                              
                                               <h4 ><strong>Comments</strong></h4>
                                                    
                                                        
                                                        <div class="portlet-body">
                                                            <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: 100%; height: 270px;"><div class="chat-scroller" style="overflow: hidden; width: 100%; height: 270px;">
                                                                    <ul class="chats bv">
                                                                        <li class="in">
                                                                            <img src="images/avatar/48.jpg" class="avatar img-responsive">
                                                                            <div class="message">
                                                                                <span class="chat-arrow"></span><a href="#" class="chat-name">Admin</a>&nbsp;<span class="chat-datetime">at July 06, 2014 17:06</span><span class="chat-body">Lorem ipsum
                                                                                    dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt
                                                                                    ut laoreet dolore magna aliquam erat volutpat.</span></div>
                                                                        </li>
                                                                        <li class="out">
                                                                            <img src="images/avatar/48.jpg" class="avatar img-responsive">
                                                                            <div class="message">
                                                                                <span class="chat-arrow"></span><a href="#" class="chat-name">Admin</a>&nbsp;<span class="chat-datetime">at July 06, 2014 18:06</span><span class="chat-body">Lorem ipsum
                                                                                    dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt
                                                                                    ut laoreet dolore magna aliquam erat volutpat.</span></div>
                                                                        </li>
                                                                        <li class="in">
                                                                            <img src="images/avatar/48.jpg" class="avatar img-responsive">
                                                                            <div class="message">
                                                                                <span class="chat-arrow"></span><a href="#" class="chat-name">Admin</a>&nbsp;<span class="chat-datetime">at July 06, 2014 17:06</span><span class="chat-body">Lorem ipsum
                                                                                    dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt
                                                                                    ut laoreet dolore magna aliquam erat volutpat.</span></div>
                                                                        </li>
                                                                        <li class="out">
                                                                            <img src="images/avatar/48.jpg" class="avatar img-responsive">
                                                                            <div class="message">
                                                                                <span class="chat-arrow"></span><a href="#" class="chat-name">Admin</a>&nbsp;<span class="chat-datetime">at July 06, 2014 18:06</span><span class="chat-body">Lorem ipsum
                                                                                    dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt
                                                                                    ut laoreet dolore magna aliquam erat volutpat.</span></div>
                                                                        </li>
                                                                        <li class="in">
                                                                            <img src="images/avatar/48.jpg" class="avatar img-responsive">
                                                                            <div class="message">
                                                                                <span class="chat-arrow"></span><a href="#" class="chat-name">Admin</a>&nbsp;<span class="chat-datetime">at July 06, 2014 17:06</span><span class="chat-body">Lorem ipsum
                                                                                    dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt
                                                                                    ut laoreet dolore magna aliquam erat volutpat.</span></div>
                                                                        </li>
                                                                        <li class="in"><img class="avatar" src="https://s3.amazonaws.com/uifaces/faces/twitter/kolage/48.jpg"><div class="message"><span class="chat-arrow"></span><a class="chat-name" href="#">Admin &nbsp;</a><span class="chat-datetime">at July 6, 201420:11</span><span class="chat-body">bv</span></div></li></ul>
                                                                </div><div class="slimScrollBar" style="width: 7px; position: absolute; top: 183px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 86.9928400954654px; background: rgb(0, 0, 0);"></div><div class="slimScrollRail" style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; opacity: 0.2; z-index: 90; right: 1px; background: rgb(51, 51, 51);"></div></div>
                                                            <div class="chat-form">
                                                                <div class="input-group">
                                                                    <input id="input-chat" type="text" placeholder="Type a message here..." class="form-control"><span id="btn-chat" class="input-group-btn">
                                                                        <button type="button" class="btn btn-green">
                                                                            <i class="fa fa-check"></i>
                                                                        </button>
                                                                    </span>
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