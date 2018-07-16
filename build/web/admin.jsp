<%-- 
    Document   : login
    Created on : 22.11.2016, 10:35:01
    Author     : user
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>${manager.getString("admin-page-title")}</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/styles.css" rel="stylesheet">
        <link href="css/login.css" rel="stylesheet">

    </head>

    <body>
	<div class="row">
            <div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4">
                <div class="effect7 login-panel panel panel-info">
                    <div class="panel-heading" style="background-color: #30A5FF; color: white">${manager.getString("admin-page-title")}</div>
                    <div class="panel-body">
                        <form  role="form" method="POST" action="PhoneSystemServlet">
                            <fieldset>
                                <input type="hidden" name="action" value="login" />
                                <div class="form-group">
                                    <input class="form-control"  placeholder="${manager.getString("admin-page-input-login")}" name="login"  autofocus="">
                                </div>
                                <div class="form-group">
                                    <input class="form-control"  placeholder="${manager.getString("admin-page-input-password")}" name="password" type="password" value="">
                                </div>
                                <div class="form-group">                    
                                    <c:if test = "${flag == 1}">
                                        <div class="alert alert-danger">
                                            <button type="button" class="close" data-dismiss="alert">×</button>
                                                ${manager.getString("admin-page-alert-error")}
                                        </div>
                                    </c:if>
                                </div>
                                <div class="form-group">
                                    <div class="pull-right">
                                        <input class="btn btn-primary" type="submit" value="${manager.getString("admin-page-button")}"/></input>  
                                    </div>
                                </div>
                            </fieldset>
                        </form>
                    </div>
		</div>
            </div>
	</div>	

	<script src="js/bootstrap.min.js"></script>
        
    </body>
</html>
