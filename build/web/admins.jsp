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
    <title>${manager.getString("admins-page-title")}</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-table.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">

</head>

<body>
    <%@include file="partial/headadmin.jsp" %>
    
    <div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
        <ul class="nav menu">
            <li><a href="PhoneSystemServlet?action=getmain"><svg class="glyph stroked home"><use xlink:href="#stroked-home"></use></svg> ${manager.getString("main-page-nav-link1")}</a></li>
            <li><a href="PhoneSystemServlet?action=getabonents"><svg class="glyph stroked table"><use xlink:href="#stroked-table"></use></svg> ${manager.getString("main-page-nav-link2")}</a></li>
            <li><a href="PhoneSystemServlet?action=getservices"><svg class="glyph stroked table"><use xlink:href="#stroked-table"></use></svg> ${manager.getString("main-page-nav-link3")}</a></li>
            <li class="active" style="border-top: #0088cc solid 1px"><a href="PhoneSystemServlet?action=getadmins"><svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg> ${manager.getString("main-page-nav-link4")}</a></li>
        </ul>
    </div>
    
    <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">			
        <div class="row">
            <ol class="breadcrumb">
                <li><a href="#"><svg class="glyph stroked home"><use xlink:href="#stroked-home"></use></svg></a></li>
                <li class="active">${manager.getString("admins-page-head1")}</li>
            </ol>
        </div>
        <div style="margin-top:15px;" class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">${manager.getString("admins-page-head2")}</div>
                        <div class="panel-body">
                            <button data-target="#myModalBox" style="float:left; margin-top: 10px;" type="button" class="btn btn-success" data-toggle="modal">${manager.getString("admins-page-button")}</button>
                                <table class="table table-striped" data-toggle="table"  data-show-refresh="true" data-show-toggle="true" data-show-columns="true" data-search="true"  data-pagination="true" data-sort-name="name" data-sort-order="desc">
                                    <thead>
                                        <tr>
                                            <th data-field="id" data-sortable="true">№</th>
                                            <th data-field="name" data-sortable="true">${manager.getString("admins-page-table-head1")}</th>
                                            <th data-field="description"  data-sortable="true">${manager.getString("admins-page-table-head2")}</th>
                                            <th data-field="price" data-sortable="true">${manager.getString("admins-page-table-head3")}</th>
                                            <th>${manager.getString("admins-page-table-head4")}</th>
                                        </tr>
                                    </thead>
                                    <tbody>                
                                    <c:forEach var="admin" items="${admins}">
                                        <tr>
                                            <td><c:out value="${admin.getId()}"/></td>
                                            <td><c:out value="${admin.getFirtsName()}"/></td>
                                            <td><c:out value="${admin.getMiddleName()}"/></td>
                                            <td><c:out value="${admin.getLastName()}"/></td> 
                                            <td>
                                                <a href="PhoneSystemServlet?action=deleteadmin&id=${admin.getId()}"><span title="${manager.getString("admins-page-table-span")}" style="font-size:19px;padding-left: 7px; color:red" class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span></a>
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
    
        <div id="myModalBox" class="modal fade">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header" style="background-color: #30A5FF; color:white;">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 style="color: white;" class="modal-title">${manager.getString("modal-new-admin-title")}</h4>
              </div>
              <div class="modal-body">
                <form method="POST" action="PhoneSystemServlet">
                  <input type="hidden" name="action" value="addadmin" />
                  <fieldset>
                  <div class="form-group">
                    <label for="id">Id:</label>
                    <input type="text" value="" class="form-control" id="id" name="id" placeholder="id">
                  </div>
                  <div class="form-group">
                    <label for="firstname">${manager.getString("modal-new-admin-label1")}: </label>
                    <input type="text" class="form-control" id="firstname" required name="firstname" placeholder="${manager.getString("modal-new-admin-input1")}">
                  </div>
                  <div class="form-group">
                    <label for="middlename">${manager.getString("modal-new-admin-label2")}: </label>
                    <input type="text" class="form-control" required id="middlename" name="middlename" placeholder="${manager.getString("modal-new-admin-input2")}">
                  </div>
                  <div class="form-group">
                    <label for="lastname">Отче${manager.getString("modal-new-admin-label3")} </label>
                    <input type="text" class="form-control" required id="lastname" name="lastname" placeholder="${manager.getString("modal-new-admin-input3")}">
                  </div>
                  <div class="form-group">
                    <label for="login">${manager.getString("modal-new-admin-label4")}: </label>
                    <input type="text" class="form-control" required id="login" name="login" placeholder="${manager.getString("modal-new-admin-input4")}">
                  </div>
                  <div class="form-group">
                    <label for="password">${manager.getString("modal-new-admin-label5")}: </label>
                    <input type="text" class="form-control" required id="password" name="password" placeholder="${manager.getString("modal-new-admin-input5")}">
                  </div>
                  <div class="form-group">
                      <div class="pull-right">
                        <button type="button" class="btn btn-default" data-dismiss="modal">${manager.getString("modal-new-admin-button1")}</button>
                        <button type="submit" class="btn btn-primary">${manager.getString("modal-new-admin-button2")}</button>
                      </div>
                  </div>
                  </fieldset>
                </form>
              </div>
            </div>
          </div>
        </div>

	<script>  
            $(document).ready(function(){
            //при нажатию на любую кнопку, имеющую класс .btn
            $(".btn").click(function() {
            //открыть модальное окно с id="myModal"
            $("#myModal").modal('show');
            });
            });
            $(window).on('resize', function () {
              if ($(window).width() > 768) $('#sidebar-collapse').collapse('show')
            })
            $(window).on('resize', function () {
              if ($(window).width() <= 767) $('#sidebar-collapse').collapse('hide')
            })
	</script>	
</body>

</html>
