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
                <li  class="active"><a href="PhoneSystemServlet?action=getservicesclient">${manager.getString("nav-link2")}</a></li>
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
            
       	<div style="float:none;"  class="col-sm-12 main">
            <div class="container">
		<div style="margin:0px;" class="row">
			<ol class="breadcrumb">
                            <li><a href="#"><svg style="width: 20px; height: 20px;" class="glyph stroked home"><use xlink:href="#stroked-home"></use></svg></a></li>
                            <li class="active">${manager.getString("service-page-title")}</li>
			</ol>
		</div>

		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-info">
                                    <div  class="panel-heading">${manager.getString("service-page-head")}</div>
					<div class="panel-body">
                                            <table data-toggle="table" data-show-refresh="true" data-show-toggle="true" data-show-columns="true" data-search="true" data-select-item-name="toolbar1" data-pagination="true" data-sort-name="name" data-sort-order="desc">
                                                <thead>
						    <tr>
						        <th data-field="id" data-sortable="true">№</th>
                                                        <th data-field="name" data-sortable="true">${manager.getString("service-page-table-head1")}</th>
						        <th data-field="description"  data-sortable="true">${manager.getString("service-page-table-head2")}</th>
						        <th data-field="price" data-sortable="true">${manager.getString("service-page-table-head3")}</th>
                                                        <c:if test = "${auth == true}">
                                                            <th>${manager.getString("service-page-table-head4")}</th>  
                                                        </c:if>
						    </tr>
						    </thead>
                                                    <tbody>
                                                        <c:forEach var="service" items="${services}">
                                                            <tr>
                                                                <td><c:out value="${service.getId()}"/></td>
                                                                <td><c:out value="${service.getName()}"/></td>
                                                                <td><c:out value="${service.getDescription()}"/></td>
                                                                <td><c:out value="${service.getPrice()}"/></td>
                                                                
                                                                    <c:if test = "${auth == true}">
                                                                        <td><a href="PhoneSystemServlet?action=addservicefor&idS=${service.getId()}&idA=${abonent.getId()}"><span title="${manager.getString("service-page-table-span1")}" style="color: green;font-size:19px;padding-left: 7px;"  class="glyphicon glyphicon-plus" aria-hidden="true"></span></a>    
                                                                    </td>
                                                                        </c:if>
                                                                
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

    <%@include file="partial/footer.jsp" %>

    <script src="js/jquery-1.11.1.min.js"></script>
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