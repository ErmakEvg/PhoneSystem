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
        <link href="css/bootstrap-table.css" rel="stylesheet">
        <link href="css/carousel.css" rel="stylesheet">
        <link rel="stylesheet" href="css/demo.css">
        <link rel="stylesheet" href="css/footer-distributed-with-address-and-phones.css">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
        
    
    </head>

<body>
    <div style="position:inherit;"  class="navbar-wrapper">
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
                        <a class="navbar-brand" href="#">${manager.getString("company-name")}</a>
                    </div>
                    <div id="sidebar-collapse"  class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                            <li><a href="PhoneSystemServlet?action=gethomepageabonent">${manager.getString("nav-link1")}</a></li>
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
                    
<div style="float: none;"  class="col-sm-12 main">
    <div class="container">
        <div style="margin:0px;" class="row">
            <ol class="breadcrumb">
                <li><a href="#"><svg style="width: 20px; height: 20px;" class="glyph stroked home"><use xlink:href="#stroked-home"></use></svg></a></li>
                <li class="active">${manager.getString("my-services-page-title")}</li>
            </ol>
        </div>
        <div class="alert alert-info">
            <h5>${manager.getString("my-services-page-info")}</h5>
        </div>
        <c:if test="${paid == false}">
            <div class="alert alert-error">
                <button type="button" class="close" data-dismiss="alert">×</button>
                ${manager.getString("my-services-page-alert-error")}
            </div>
        </c:if>
        <c:if test="${paid == true}">
            <div class="alert alert-succes">
                <button type="button" class="close" data-dismiss="alert">×</button>
                ${manager.getString("my-services-page-alert-succes")}
            </div>
        </c:if>
 	<div class="row">
            <div  class="col-lg-12">
                <div class="panel panel-info">
                    <div  class="panel-heading">${manager.getString("my-services-page-table-name")}</div>
                    <div class="panel-body">
                        <table data-toggle="table" data-show-refresh="true" data-show-toggle="true" data-show-columns="true" data-search="true" data-select-item-name="toolbar1" data-pagination="true" data-sort-name="name" data-sort-order="desc">
                            <thead>
                                <tr>
                                    <th data-field="id" data-sortable="true">№</th>
                                    <th data-field="name" data-sortable="true">${manager.getString("my-services-page-table-head1")}</th>
                                    <th data-field="description"  data-sortable="true">${manager.getString("my-services-page-table-head2")}</th>
                                    <th data-field="price" data-sortable="true">${manager.getString("my-services-page-table-head3")}</th>
                                    <th data-field="datestart" data-sortable="true">${manager.getString("my-services-page-table-head4")}</th>
                                    <th data-field="paid" data-sortable="true">${manager.getString("my-services-page-table-head5")}</th>
                                    <th>${manager.getString("my-services-page-table-head6")}</th>
                                </tr>
                                </thead>
                                <tbody>                   
                                    <c:forEach var="invoice" items="${invoices}">
                                        <tr>
                                            <td><c:out value="${invoice.getService().getId()}"/></td>
                                            <td><c:out value="${invoice.getService().getName()}"/></td>
                                            <td><c:out value="${invoice.getService().getDescription()}"/></td>
                                            <td><c:out value="${invoice.getService().getPrice()}"/></td>
                                            <td><c:out value="${invoice.getDateStart()}"/></td>
                                            <c:if test = "${invoice.isPaid()}"> 
                                                <td style="text-align:center;"><span style="font-size: 19px; color: green;" class="glyphicon glyphicon-thumbs-up"></span></td>
                                            </c:if>
                                            <c:if test = "${!invoice.isPaid()}"> 
                                                <td style="text-align:center;"><span style="font-size: 19px; color: red;" class="glyphicon glyphicon-thumbs-down"></span></td>
                                            </c:if>
                                            <td>
                                                <c:if test = "${invoice.isPaid() == false}"> 
                                                    <a href="PhoneSystemServlet?action=paymentservice&idS=${invoice.getId()}"><span title="${manager.getString("my-services-page-table-head7")}" style="font-size:19px;padding-left: 7px; color:red" class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span></a>
                                                </c:if>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>       
    <script src="js/jquery-1.11.1.min.js"></script>
                    <%@include file="partial/footer.jsp" %>
       

    <script src="js/bootstrap.min.js"></script>
    <script src="js/bootstrap-table.js"></script>
    <script src="js/docs.min.js"></script>
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