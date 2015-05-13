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
                </nav>
                <%@ taglib prefix="s" uri="/struts-tags" %>


                <!--END TOPBAR-->
                <s:if test="hasActionMessages()">
                    <div class="alert alert-danger" role="alert" style="width:30%; margin-left: 34% ;margin-top: 1%; " >
                        <s:actionmessage/>
                    </div>
                </s:if>
                <div id="wrapper">
                    <div style="max-width: 450px; margin:auto; margin-top: 15%;">
                        <div class="panel panel-orange">
                            <div class="panel-heading">
                                Forgot Password </div>
                            <div class="panel-body pan">
                                <form action="Forgetpassword" class="form-horizontal" method="post">                                    
                                    <div class="form-body pal">
                                        <div class="form-group">
                                            <br/>
                                            <label for="inputName" class="col-md-3 control-label">
                                                Email</label>
                                            <div class="col-md-9">
                                                <div class="input-icon right">
                                                    <i class="fa fa-envelope"></i>
                                                    <input id="inputName" type="email" placeholder="Email" class="form-control" name="email" required/></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-actions pal">
                                        <div class="form-group mbn">
                                            <div class="col-md-offset-4 col-md-5">                                                
                                                <button type="submit" class="btn btn-primary">
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
        </div>
    </body>
</html>