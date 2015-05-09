<%@ taglib uri="/struts-tags" prefix="s" %>


<div id="page-wrapper">
    <!--BEGIN TITLE & BREADCRUMB PAGE-->
    <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
        <div class="page-header pull-left">
            <div class="page-title">
                Profile View</div>
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
                                        <div class="profile" style="width:100%;">
                                            <div style="margin-bottom: 15px" class="row" >
                                                <div class="col-xs-12 col-sm-2 text-center">
                                                    <figure><img src="<s:property value="image"/>" alt="" style="display: inline-block" class="img-responsive img-circle">
                                                        <figcaption class="ratings">
                                                            <%
                                                                double circle = Double.parseDouble((String) request.getAttribute("circle"));
                                                                double likes = Double.parseDouble((String) request.getAttribute("likes"));
                                                                double val = likes * 5 / circle;
                                                                if (val < 0.5 || circle==0) {
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
                                                        <s:property value="name"/></h2>
                                                    <p>
                                                        <strong>Email:</strong> <s:property value="email"/></p>
                                                    <p>
                                                        <strong>Status:</strong> Active</p>
                                                    <p>

                                                        <strong class="mrs">Member&nbsp;&nbsp;Since:</strong><span class="label label-green mrs"><s:property value="date"/></span></p>
                                                    <p><button type="button" class="btn  btn-blue" data-toggle="modal" data-target="#myModal">
                                                            Upload Photo</button><jsp:include page="/uploadphoto.jsp"></jsp:include></p>
                                                    </div>


                                                </div>
                                                <div class="row text-center divider">
                                                    <div class="col-xs-12 col-sm-4 emphasis">
                                                        <h2>
                                                            <strong><s:property value="circle"/></strong></h2>
                                                    <p>
                                                        <small>Circle</small>
                                                    </p>

                                                </div>
                                                <div class="col-xs-12 col-sm-4 emphasis">
                                                    <h2>
                                                        <strong><s:property value="likes"/></strong></h2>
                                                    <p>
                                                        <small>Likes</small>
                                                    </p>

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
                                                    <li class="active"><a href="#tab-timeline" data-toggle="tab">Timeline</a></li>
                                                    <li><a href="#tab-edit" data-toggle="tab">Edit Profile</a></li>
                                                    <li><a href="#tab-password" data-toggle="tab">Change Password</a></li>
                                                    <li><a href="#tab-circle" data-toggle="tab">Circle</a></li>
                                                    <li><a href="#tab-file" data-toggle="tab">File Uploaded</a></li>

                                                </ul> 
                                                <div id="generalTabContent" class="tab-content">
                                                    <jsp:include page="/timeline.jsp"></jsp:include>
                                                        <div id="tab-edit" class="tab-pane fade in">
                                                            <form action="Editprofile" method="post" class="form-horizontal">
                                                                <h3>Profile Setting</h3>
                                                                <div class="form-group"><label class="col-sm-3 control-label">First Name</label>

                                                                    <div class="col-sm-9 controls">
                                                                        <div class="row">
                                                                            <div class="col-xs-9"><input type="text" name="fname" placeholder="first name" class="form-control" /></div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group"><label class="col-sm-3 control-label">Last Name</label>

                                                                    <div class="col-sm-9 controls">
                                                                        <div class="row">
                                                                            <div class="col-xs-9"><input type="text" name="lname" placeholder="last name" class="form-control" /></div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group"><label class="col-sm-3 control-label">Gender</label>

                                                                    <div class="col-sm-9 controls">
                                                                        <div class="row">
                                                                            <div class="col-xs-9">
                                                                                <div class="radio">
                                                                                    <label class="radio-inline"><div class="iradio_minimal-grey" style="position: relative;"><input type="radio" value="Male" name="gender" checked="checked" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div>&nbsp;
                                                                                        Male</label>
                                                                                    <label class="radio-inline"><div class="iradio_minimal-grey" style="position: relative;"><input type="radio" value="Female" name="gender" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div>&nbsp;
                                                                                        Female</label>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group"><label class="col-sm-3 control-label">Birthday</label>

                                                                    <div class="col-sm-9 controls">
                                                                        <div class="row">
                                                                            <div class="col-xs-6"><input id="datepicker-normal" name="dates" type="date" class="form-control"></div>
                                                                        </div>
                                                                    </div>
                                                                </div>


                                                                <div class="form-group"><label class="col-sm-3 control-label">About</label>

                                                                    <div class="col-sm-9 controls">
                                                                        <div class="row">
                                                                            <div class="col-xs-9"><textarea rows="3" name="about" class="form-control"></textarea></div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <hr>
                                                                <h3>Contact Setting</h3>

                                                                <div class="form-group"><label class="col-sm-3 control-label">Mobile Phone</label>

                                                                    <div class="col-sm-9 controls">
                                                                        <div class="row">
                                                                            <div class="col-xs-9"><input type="tel" name="mobile" placeholder="mobile phone" class="form-control"></div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <hr>
                                                                <button type="submit" class="btn btn-green btn-block">Finish</button>
                                                            </form>
                                                        </div>
                                                        <div id="tab-password" class="tab-pane fade in">
                                                            <form action="Changepassword" name="passchangeForm" method="post" class="form-horizontal" onsubmit="return checkPassword();">
                                                                <h3>Account Setting</h3>
                                                                <div class="form-group"><label class="col-sm-3 control-label">Password</label>

                                                                    <div class="col-sm-9 controls">
                                                                        <div class="row">
                                                                            <div class="col-xs-9">
                                                                                <input type="password" name="password" placeholder="password" class="form-control" required/>                                                                
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group"><label class="col-sm-3 control-label">Confirm Password</label>

                                                                    <div class="col-sm-9 controls">
                                                                        <div class="row">
                                                                            <div class="col-xs-9">
                                                                                <input type="password"  name="repassword" placeholder="password" class="form-control" required/>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <hr>
                                                                <button type="submit" class="btn btn-green btn-block">Change Password</button>
                                                            </form>
                                                        </div>                                                        
                                                        <div id="tab-circle" class="tab-pane fade in">
                                                            <div class="row mbl">

                                                                <div class="col-lg-6">
                                                                    <div class="input-group"><input type="text" class="form-control"><span class="input-group-btn"><button type="button" class="btn btn-white">Search</button></span></div>
                                                                </div>
                                                            </div>
                                                            <div class="box text-shadow">


                                                            <s:iterator  value="people">  
                                                                <fieldset>
                                                                    <div class="list-group-item" style="height:50px;"> 
                                                                        <div style="width:10%; float:left;height:40px; margin-top:-0.5%;"><img src="<s:property value="photo"/>" alt="" title="" style="width:100%; max-width:40px; max-height:40px;"/></div>
                                                                        <!--<data></data>-->
                                                                        <form action="Removefromcircle2" >
                                                                            <div style="width:88%; float:left; height:40px;"><p class="date"></p>
                                                                                <p class="title">
                                                                                    <a href="<s:url  action="ViewProfile">
                                                                                           <s:param name="UserName" value="%{UserName}" /> </s:url>">                                                                            
                                                                                       <s:property value="name"/>
                                                                                    </a>
                                                                                    <button class="btn btn-blue" value="<s:property value="UserName"/>" name="username2" style="float:right;">Remove from  Circle</button>
                                                                                </p>
                                                                            </div>
                                                                        </form>
                                                                    </div>
                                                                </fieldset>
                                                            </s:iterator> 
                                                        </div>
                                                    </div>
                                                    <div id="tab-file" class="tab-pane fade in">
                                                        <div class="row mbl">

                                                            <div class="col-lg-6">
                                                                <div class="input-group"><input type="text" class="form-control"><span class="input-group-btn"><button type="button" class="btn btn-white">Search</button></span></div>
                                                            </div>
                                                        </div>
                                                        <div class="list-group">
                                                            <s:iterator  value="file1">  
                                                                <fieldset>
                                                                    <div class="list-group-item" style="height:50px;"> 
                                                                        <div style="width:12%; float:left; margin-top:-0.5%;"><img src="images/<s:property value="filetags"/>.jpg" alt="" title="" style="width:100%; max-width:40px; max-height:40px;"/></div>
                                                                        <!--<data></data>-->
                                                                        <form action="Removefile" >
                                                                            <div style="width:88%; float:left; height:40px;"><p class="date"></p>
                                                                                <p class="title">
                                                                                    <a href="<s:url  action="fileview">
                                                                                           <s:param name="fileid" value="%{idfiles}" /> </s:url>">     
                                                                                       <s:property value="filename"/>&nbsp;&nbsp;(<s:property value="filetags"/>)
                                                                                    </a>
                                                                                    <button class="btn btn-blue" value="<s:property value="idfiles"/>" name="idfiles" style="float:right;">Remove file</button>
                                                                                </p>
                                                                            </div>
                                                                        </form>
                                                                    </div>

                                                                </fieldset>
                                                            </s:iterator> 
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
<script>
    function checkPassword() {
        if ((passchangeForm.password.value !== passchangeForm.repassword.value)) {
            alert("Password mismatch");
            return false;
        }
        return true;
    }
</script>
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