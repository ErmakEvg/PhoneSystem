<%-- 
    Document   : tables
    Created on : 22.11.2016, 10:36:11
    Author     : user
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${manager.getString("detail-service-page-title")}</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">
    </head>

<body>
    <%@include file="partial/headadmin.jsp" %>		
    <div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
        <form role="search">
            <div class="form-group">
                <input type="text" class="form-control" placeholder="Поиск">
            </div>
        </form>
        <ul class="nav menu">
            <li><a href="PhoneSystemServlet?action=getmain"><svg class="glyph stroked home"><use xlink:href="#stroked-home"></use></svg> ${manager.getString("main-page-nav-link1")}</a></li>
            <li><a href="PhoneSystemServlet?action=getabonents"><svg class="glyph stroked table"><use xlink:href="#stroked-table"></use></svg> ${manager.getString("main-page-nav-link2")}</a></li>
            <li class="active"><a href="PhoneSystemServlet?action=getservices"><svg class="glyph stroked table"><use xlink:href="#stroked-table"></use></svg> ${manager.getString("main-page-nav-link3")}</a></li>
            <li style="border-top: #0088cc solid 1px"><a href="PhoneSystemServlet?action=getadmins"><svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg> ${manager.getString("main-page-nav-link4")}</a></li>
        </ul>
    </div>
		
    <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">			
        <div class="row">
            <ol class="breadcrumb">
                <li><a href="#"><svg class="glyph stroked home"><use xlink:href="#stroked-home"></use></svg></a></li>
                <li class="active">${manager.getString("detail-service-page-head1")}</li>
            </ol>
        </div>

        <div style="margin-top:15px;" class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">${manager.getString("detail-service-page-head2")}</div>
                        <div class="panel-body">
                            <c:if test = "${flag >= 1}">
                                <div class="alert alert-success">
                                    <button type="button" class="close" data-dismiss="alert">×</button>
                                        ${manager.getString("detail-service-page-alert-succes")}
                                </div>
                            </c:if>
                            <form class="form-horizontal" method="POST" action="PhoneSystemServlet">
                                <input type="hidden" name="action" value="updateservice" />
                                <div class="form-group">
                                    <label class="col-xs-3 control-label" for="id">Id:</label>
                                    <div class="col-xs-9">
                                        <input type="text" value="${service.getId()}" class="form-control" id="id" name="id" placeholder="id">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3 control-label" for="name">${manager.getString("modal-new-services-label1")}:</label>
                                    <div class="col-xs-9">
                                        <input type="text" value="${service.getName()}" required class="form-control" id="name" name="name" placeholder="${manager.getString("modal-new-services-input1")}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3 control-label"  for="description">${manager.getString("modal-new-services-label2")}:</label>
                                    <div class="col-xs-9">
                                        <textarea style="height:200px;" class="form-control" required id="description" name="description" placeholder="${manager.getString("modal-new-services-input2")}">${service.getDescription()}</textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3 control-label" for="price">${manager.getString("modal-new-services-label3")}:</label>
                                    <div class="col-xs-9">
                                        <input type="text" value="${service.getPrice()}" required class="form-control" id="price" name="price" placeholder="${manager.getString("modal-new-services-input3")}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="pull-right" style="margin-right:20px;">
                                        <button type="submit" class="btn btn-primary">${manager.getString("detail-service-page-button")}</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
		</div>
            </div>
	</div>

	<script>
		!function ($) {
			$(document).on("click","ul.nav li.parent > a > span.icon", function(){		  
				$(this).find('em:first').toggleClass("glyphicon-minus");	  
			}); 
			$(".sidebar span.icon").find('em:first').addClass("glyphicon-plus");
		}(window.jQuery);

		$(window).on('resize', function () {
		  if ($(window).width() > 768) $('#sidebar-collapse').collapse('show')
		})
		$(window).on('resize', function () {
		  if ($(window).width() <= 767) $('#sidebar-collapse').collapse('hide')
		})
                
                $(function() {
                    $('#datetimepicker1').datepicker({
                        format: 'dd-mm-yyyy'
                    });
                });  
	</script>	
</body>

</html>
