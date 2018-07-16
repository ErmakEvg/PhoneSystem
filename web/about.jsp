<%-- 
    Document   : main
    Created on : 21.11.2016, 9:47:37
    Author     : user
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/demo.css">
    <link rel="stylesheet" href="css/footer-distributed-with-address-and-phones.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
    <title>${manager.getString("company-name")}</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/carousel.css" rel="stylesheet">

<body>
    <div class="navbar-wrapper">
        <div class="container">
            <div class="navbar navbar-inverse navbar-static-top" role="navigation">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#sidebar-collapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
                        <a class="navbar-brand" href="PhoneSystemServlet?action=gethomepageabonent">${manager.getString("company-name")}</a>
                    </div>
                <div id="sidebar-collapse"  class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="PhoneSystemServlet?action=gethomepageabonent">${manager.getString("nav-link1")}</a></li>
                        <li><a href="PhoneSystemServlet?action=getservicesclient">${manager.getString("nav-link2")}</a></li>
                        <li class="active"><a href="PhoneSystemServlet?action=getabout">${manager.getString("nav-link3")}</a></li>
                        <li><a href="PhoneSystemServlet?action=getcontacts">${manager.getString("nav-link4")}</a></li>
                        </ul>
                    <%@include file="partial/loginbox.jsp" %>
            </div>
        </div>
    </div>
  </div>
</div>

                    <%@include file="partial/slyder.jsp" %>
   
<div style="float:none;" class="col-sm-12 main">
<div class="container">
    <div style="margin:0px;" class="row">
        <ol class="breadcrumb">
            <li><a href="#"><svg style="width: 20px; height: 20px;" class="glyph stroked home"><use xlink:href="#stroked-home"></use></svg></a></li>
            <li class="active">${manager.getString("about-page-title")}</li>
        </ol>
    </div>
    <div style="margin:0px;" class="row">
        <div style="padding: 0px;" class="col-lg-12">
            <div class="panel panel-info">
                <div  class="panel-heading">${manager.getString("about-page-title")}</div>
                    <div class="panel-body">
                        <p>
                            ${manager.getString("about-page-content")}
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>      

<%@include file="partial/footer.jsp" %>

<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/lumino.glyphs.js"></script>
                <script>

        $(window).on('resize', function () {
          if ($(window).width() > 768) $('#sidebar-collapse').collapse('show')
        })
        $(window).on('resize', function () {
          if ($(window).width() <= 767) $('#sidebar-collapse').collapse('hide')
        })
        </script> 
</body>
</html>