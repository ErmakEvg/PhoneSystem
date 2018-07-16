<%-- 
    Document   : main
    Created on : 21.11.2016, 9:47:37
    Author     : user
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>${manager.getString("company-name")}</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/carousel.css" rel="stylesheet">
        <link rel="stylesheet" href="css/demo.css">
        <link rel="stylesheet" href="css/footer-distributed-with-address-and-phones.css">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
        
    </head>

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
                    <div id="sidebar-collapse" class="navbar-collapse collapse">
                        <ul class="nav navbar-nav">
                            <li class="active"><a href="PhoneSystemServlet?action=gethomepageabonent">${manager.getString("nav-link1")}</a></li>
                            <li><a href="PhoneSystemServlet?action=getservicesclient">${manager.getString("nav-link2")}</a></li>
                            <li><a href="PhoneSystemServlet?action=getabout">${manager.getString("nav-link3")}</a></li>
                            <li><a href="PhoneSystemServlet?action=getcontacts">${manager.getString("nav-link4")}</a></li>
                        </ul>
                        <%@include file="partial/loginbox.jsp" %>
                    </div>
                </div>
            </div>
        </div>
    </div>
                    
                        <%@include file="partial/slyder.jsp" %>

    <div class="container marketing">
        <div class="row">
            <div class="col-lg-4">
                <img style="width: 180px; height: 180px;" class="img-circle" data-src="" alt="140x140" src="image/services.jpg" style="width: 140px; height: 140px;">
                <h2>${manager.getString("block1-head-text")}</h2>
                <p>${manager.getString("block1-content-text")}</p>
                <p><a class="btn btn-default" href="PhoneSystemServlet?action=getservicesclient" role="button">${manager.getString("block-button")} »</a></p>
            </div>
            <div class="col-lg-4">
                <img style="width: 180px; height: 180px;" class="img-circle" data-src="" alt="140x140" src="image/technolog.gif" style="width: 140px; height: 140px;">
                <h2>${manager.getString("block2-head-text")}</h2>
                <p>${manager.getString("block2-content-text")}</p>
                <p><a class="btn btn-default" href="#" role="button">${manager.getString("block-button")} »</a></p>
            </div>
            <div class="col-lg-4">
                <img style="width: 180px; height: 180px;" class="img-circle" data-src="" alt="140x140" src="image/consult.png" style="width: 140px; height: 140px;">
                <h2>${manager.getString("block3-head-text")}</h2>
                <p>${manager.getString("block3-content-text")}</p>
                <p><a class="btn btn-default" href="PhoneSystemServlet?action=getcontacts" role="button">${manager.getString("block-button")} »</a></p>
            </div>
        </div>
    </div>
    
    <%@include file="partial/footer.jsp" %>

    <script src="js/jquery-1.11.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/lumino.glyphs.js"></script>
          <script>
              $(window).load(function() {
                  $.ajax ({ 
    type: "GET",
    url: 'PhoneSystemServlet?action=gethomepageabonent'
});
              })           

        $(window).on('resize', function () {
          if ($(window).width() > 768) $('#sidebar-collapse').collapse('show')
        })
        $(window).on('resize', function () {
          if ($(window).width() <= 767) $('#sidebar-collapse').collapse('hide')
        })
        </script>
</body>
</html>