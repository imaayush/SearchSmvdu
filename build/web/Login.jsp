
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
                <nav id="topbar" role="navigation" style="background-color: #0C1112;" data-step="3" class="navbar navbar-default navbar-static-top">
                    <div class="navbar-header">
                        <a id="logo" href="index.jsp" class="navbar-brand"><span class="fa fa-rocket"></span><span class="logo-text">SMVDU</span><span style="display: none" class="logo-text-icon">µ</span></a>
                    </div>
                    <div style="float:right; padding: 15px; margin-right: 10px;">
                        <a href ="About"><strong style="font-size: 14px;"><span class="fa fa-globe"></span>&nbsp;About Us</strong></a>
                        <div/>
                </nav>
                <%@ taglib prefix="s" uri="/struts-tags" %>


                <!--END TOPBAR-->
                <s:if test="hasActionMessages()">
                    <div class="alert alert-danger" role="alert" style="width:30%; margin-left: 34% ;margin-top: 1%; " >
                        <s:actionmessage/>
                    </div>
                </s:if>
                <div id="wrapper">
                    
                    <div style="max-width: 450px; margin:auto; margin-top: 10%;">
                        <div class="panel panel-orange">
                            <div class="panel-heading">
                                Sign In </div>
                            <div class="panel-body pan">
                                <form action="login" class="form-horizontal" method="post">
                                    <div class="form-body pal">
                                        <div class="form-group">
                                            <label for="inputName" class="col-md-3 control-label">
                                                User Name</label>
                                            <div class="col-md-9">
                                                <div class="input-icon right">
                                                    <i class="fa fa-user"></i>
                                                    <input id="inputName" type="text" placeholder="" class="form-control" name="username" required/></div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputPassword" class="col-md-3 control-label">
                                                Password</label>
                                            <div class="col-md-9">
                                                <div class="input-icon right">
                                                    <i class="fa fa-lock"></i>
                                                    <input id="inputPassword" type="password" placeholder="" class="form-control" name="password" required/></div>
                                                <span class="help-block mbn">Forgot password? <a href="forgetpassword.jsp">click here</a></span>
                                            </div>
                                        </div>
                                        <div class="form-group mbn">
                                            <div class="col-md-offset-3 col-md-6">
                                                <div class="checkbox">
                                                    <label>
                                                        <input tabindex="5" type="checkbox" />Keep me logged in</label></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-actions pal">
                                        <div class="form-group mbn">
                                            <div class="col-md-offset-3 col-md-6">
                                                <a href="Register.jsp" class="btn btn-primary">Sign up</a>&nbsp;&nbsp;
                                                <button type="submit" class="btn btn-primary">
                                                    Log in</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>

                    </div>
                    
                    <div  >
                         <center>
                        <span>Android App </span><br>
                        <a href="images/Share.apk">
                        <img src="images/ic_launcher-web.png" alt="" style="width: 50px; height:50px;"/>
                       </a>
                        </center>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>