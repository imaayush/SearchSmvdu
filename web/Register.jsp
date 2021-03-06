<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>SMVDU SEARCH| SMVDU SHARE</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="images/icons/favicon.ico">
        <link rel="apple-touch-icon" href="images/icons/favicon.png">
        <link rel="apple-touch-icon" sizes="72x72" href="images/icons/favicon-72x72.png">
        <link rel="apple-touch-icon" sizes="114x114" href="images/icons/favicon-114x114.png">
        <!--Loading bootstrap css-->
        <link type="text/css" rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,400,300,700">
        <link type="text/css" rel="stylesheet" href="http://fonts.googleapis.com/css?family=Oswald:400,700,300">
        <link type="text/css" rel="stylesheet" href="styles/jquery-ui-1.10.4.custom.min.css">
        <link type="text/css" rel="stylesheet" href="styles/font-awesome.min.css">
        <link type="text/css" rel="stylesheet" href="styles/bootstrap.min.css">
        <link type="text/css" rel="stylesheet" href="styles/animate.css">
        <link type="text/css" rel="stylesheet" href="styles/all.css">
        <link type="text/css" rel="stylesheet" href="styles/main.css">
        <link type="text/css" rel="stylesheet" href="styles/style-responsive.css">
        <link type="text/css" rel="stylesheet" href="styles/zabuto_calendar.min.css">
        <link type="text/css" rel="stylesheet" href="styles/pace.css">
        <link type="text/css" rel="stylesheet" href="styles/jquery.news-ticker.css">
        <link type="text/css" rel="stylesheet" href="styles/jplist-custom.css">
    </head>
    <body >
        <div>

            <!--BEGIN BACK TO TOP-->
            <a id="totop" href="#"><i class="fa fa-angle-up"></i></a>
            <!--END BACK TO TOP-->
            <!--BEGIN TOPBAR-->
            <div id="header-topbar-option-demo" class="page-header-topbar">
                <nav id="topbar" role="navigation" style="background-color: #0C1112" data-step="3" class="navbar navbar-default navbar-static-top">
                    <div class="navbar-header">

                        <a id="logo" href="index.jsp" class="navbar-brand"><span class="fa fa-rocket"></span><span class="logo-text">SMVDU</span><span style="display: none" class="logo-text-icon">�</span></a></div>
                    <div style="float:right; padding: 15px; margin-right: 10px;">
                        <a href ="About"><strong style="font-size: 14px;"><span class="fa fa-globe"></span>&nbsp;About Us</strong></a>
                        <div/>                        
                </nav>

            </div>
            <s:if test="hasActionMessages()">
                <div class="alert alert-danger" role="alert" style="width:32%; margin-left: 34% ;margin-top: 1%; " >
                    <s:actionmessage/>
                </div>
            </s:if>
            <!--END TOPBAR-->
            <div id="wrapper">
                <div style="max-width: 450px; margin:auto; margin-top: 5%;">
                    <div class="panel panel-orange">
                        <div class="panel-heading">
                            Registration </div>
                        <div class="panel-body pan">
                            <form action="Register" method="post">
                                <div class="form-body pal">
                                    <div class="form-group">
                                        <div class="input-icon right">
                                            <i class="fa fa-user"></i>
                                            <input id="inputName" type="text" placeholder="Username" class="form-control" name="username" required></div>
                                    </div>
                                    <div class="form-group">
                                        <div class="input-icon right">
                                            <i class="fa fa-envelope"></i>
                                            <input id="inputEmail" type="email" placeholder="Email address" class="form-control" name ="email" required></div>
                                    </div>

                                    <hr>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <input id="inputFirstName" type="text" placeholder="First Name" class="form-control" name="fname" required></div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <input id="inputLastName" type="text" placeholder="Last Name" class="form-control" name="lname" required></div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <select class="form-control" name="gender">
                                            <option>Gender</option>
                                            <option>Male</option>
                                            <option>Female</option>
                                        </select>
                                    </div>                                    
                                    <div class="form-group mbn">
                                        <div class="checkbox">
                                            <label>
                                                <input tabindex="5" type="checkbox"  style="margin-left:1%;" required/>&nbsp; I want to upload and download files</label></div>
                                    </div><br/>
                                    <div class="form-group mbn">
                                        <div class="checkbox">
                                            <label>
                                                <input tabindex="5" type="checkbox" style="margin-left:1%;"  required/>&nbsp; I agree with the Terms and Conditions</label></div>
                                    </div>                                    
                                </div>
                                <div class="form-actions pal">
                                    <div class="form-group mbn">
                                        <div class="col-md-offset-3 col-md-6">                                                
                                            <button class="btn btn-primary">
                                                Submit</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>