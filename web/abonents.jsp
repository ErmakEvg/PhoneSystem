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
    <title>${manager.getString("admin-abonents-page-title")}</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/datepicker3.css" rel="stylesheet">
    <link href="css/bootstrap-table.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">

    <style>
        .datepicker {
            z-index:1051 !important;
        }
    </style>
</head>

<body>
    <%@include file="partial/headadmin.jsp" %>
    <div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
        <ul class="nav menu">
            <li><a href="PhoneSystemServlet?action=getmain"><svg class="glyph stroked home"><use xlink:href="#stroked-home"></use></svg> ${manager.getString("main-page-nav-link1")}</a></li>
            <li class="active"><a href="PhoneSystemServlet?action=getabonents"><svg class="glyph stroked table"><use xlink:href="#stroked-table"></use></svg> ${manager.getString("main-page-nav-link2")}</a></li>
            <li><a href="PhoneSystemServlet?action=getservices"><svg class="glyph stroked table"><use xlink:href="#stroked-table"></use></svg> ${manager.getString("main-page-nav-link3")}</a></li>
            <li style="border-top: #0088cc solid 1px"><a href="PhoneSystemServlet?action=getadmins"><svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg> ${manager.getString("main-page-nav-link4")}</a></li>
        </ul>
    </div>	
    <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">			
        <div  class="row">
            <ol class="breadcrumb">
                <li><a href="#"><svg class="glyph stroked home"><use xlink:href="#stroked-home"></use></svg></a></li>
                <li class="active">${manager.getString("admin-abonents-page-head1")}</li>
            </ol>
        </div>
        <div style="margin-top:15px;" class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">${manager.getString("admin-abonents-page-head2")}</div>
                    <div class="panel-body">
                        <button style="float:left; margin-top: 10px;"  data-target="#myModalBox" type="button" class="btn btn-success" data-toggle="modal">${manager.getString("admin-abonents-page-button")}</button>
                        <table class="table table-striped" data-toggle="table"  data-show-refresh="true" data-show-toggle="true" data-show-columns="true" data-search="true"  data-pagination="true" data-sort-name="name" data-sort-order="desc">
                            <thead>
                                <tr>
                                    <th data-field="id" data-sortable="true">№</th>
                                    <th data-field="firstname" data-sortable="true">${manager.getString("admin-abonents-table-head1")}</th>
                                    <th data-field="middletname"  data-sortable="true">${manager.getString("admin-abonents-table-head2")}</th>
                                    <th data-field="lastname" data-sortable="true">${manager.getString("admin-abonents-table-head3")}</th>
                                    <th data-field="phone" data-sortable="true">${manager.getString("admin-abonents-table-head4")}</th>
                                    <th data-field="datestart" data-sortable="true">${manager.getString("admin-abonents-table-head5")}</th>
                                    <th data-field="status" data-sortable="true">${manager.getString("admin-abonents-table-head6")}</th>
                                    <th>${manager.getString("admin-abonents-table-head7")}</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="abonent" items="${abonents}">
                                    <tr>
                                        <td><c:out value="${abonent.getId()}"/></td>
                                        <td><c:out value="${abonent.getFirstName()}"/></td>
                                        <td><c:out value="${abonent.getMiddleName()}"/></td>
                                        <td><c:out value="${abonent.getLastName()}"/></td>
                                        <td><c:out value="${abonent.getHomePhoneNumber()}"/></td>
                                        <td><c:out value="${abonent.getDateRegistr()}"/></td>
                                        <c:if test = "${abonent.isBlock()}"> 
                                            <td>
                                                ${manager.getString("admin-abonents-status-block")}
                                            </td>
                                        </c:if>
                                            <c:if test = "${abonent.isBlock() == false}"> 
                                        <td>${manager.getString("admin-abonents-status-unblock")}</td>
                                            </c:if>
                                        <td>
                                            <a href="PhoneSystemServlet?action=detailuser&role=adm&id=${abonent.getId()}"><span title="${manager.getString("admin-abonents-span1")}" style="font-size:19px;padding-left: 7px;" class="glyphicon glyphicon-edit" aria-hidden="true"></span></a>
                                            <c:if test = "${abonent.isBlock()}"> 
                                                <a href="PhoneSystemServlet?action=unblockuser&id=${abonent.getId()}"><span title="${manager.getString("admin-abonents-span2")}" style="font-size:19px;padding-left: 7px; color:green" class="glyphicon glyphicon-ok" aria-hidden="true"></span></a>
                                            </c:if>
                                            <c:if test = "${abonent.isBlock() == false}"> 
                                                <a href="PhoneSystemServlet?action=blockuser&id=${abonent.getId()}"><span title="${manager.getString("admin-abonents-span3")}" style="font-size:19px;padding-left: 7px; color: orange" class="glyphicon glyphicon-ban-circle"  aria-hidden="true"></span></a>
                                            </c:if>
                                            <a href="PhoneSystemServlet?action=deleteuser&id=${abonent.getId()}"><span title="${manager.getString("admin-abonents-span4")}" style="font-size:19px;padding-left: 7px; color:red" class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span></a>
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
          <div class="modal-header" style="background-color: #30A5FF; color: white;">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h4 style="color:white;" class="modal-title">${manager.getString("modal-new-abonent-title")}</h4>
          </div>
          <div class="modal-body">
            <form method="POST" action="PhoneSystemServlet">
                <fieldset>
              <input type="hidden" name="action" value="addAbonents" />
              <div class="form-group">
                <label for="id">Id:</label>
                <input type="text" value="" class="form-control" id="id" name="id" placeholder="id">
              </div>
              <div class="form-group">
                <label for="firstname">${manager.getString("modal-new-abonent-label1")}:</label>
                <input type="text" class="form-control" id="firstname" required name="firstname" placeholder="${manager.getString("modal-new-abonent-input1")}">
              </div>
              <div class="form-group">
                <label for="middlename">${manager.getString("modal-new-abonent-label2")}:</label>
                <input type="text" class="form-control" id="middlename" required name="middlename" placeholder="${manager.getString("modal-new-abonent-input2")}">
              </div>
              <div class="form-group">
                <label for="lastname">${manager.getString("modal-new-abonent-label3")}:</label>
                <input type="text" class="form-control" id="lastname" required name="lastname" placeholder="${manager.getString("modal-new-abonent-input3")}">
              </div>
              <div class="form-group">
                <label for="datebirthday">${manager.getString("modal-new-abonent-label4")}:</label>
                <div class="input-group date" id="datetimepicker1">
                <input type="text" placeholder="${manager.getString("modal-new-abonent-input4")}" required id="datebirthday" name="datebirthday" class="form-control">
                <div class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                </div>
                </div>
              </div>
              <div class="form-group">
                <label for="city">${manager.getString("modal-new-abonent-label5")}: </label>
                <input type="text" class="form-control" id="city" required name="city" placeholder="${manager.getString("modal-new-abonent-input5")}">
              </div>
              <div class="form-group">
                <label for="street">${manager.getString("modal-new-abonent-label6")}: </label>
                <input type="text" class="form-control" id="street" required name="street" placeholder="${manager.getString("modal-new-abonent-input6")}">
              </div>

              <div class="form-group">
                <label for="homephonenumber">${manager.getString("modal-new-abonent-label7")}: </label>
                <input type="text" class="form-control" id="homephonenumber" required name="homephonenumber" placeholder="${manager.getString("modal-new-abonent-input7")}">
              </div>
              <div class="form-group">
                <label for="phonenumber">${manager.getString("modal-new-abonent-label8")}: </label>
                <input type="text" class="form-control" id="phonenumber" name="phonenumber" placeholder="${manager.getString("modal-new-abonent-input8")}">
              </div>
              <div class="form-group">
                <label for="numpasport">${manager.getString("modal-new-abonent-label9")}: </label>
                <input type="text" class="form-control" id="numpasport" required name="numpasport" placeholder="${manager.getString("modal-new-abonent-input9")}">
              </div>
              <div class="form-group">
                <label for="numclient">${manager.getString("modal-new-abonent-label10")}: </label>
                <input type="text" class="form-control" id="numclient" required name="numclient" placeholder="${manager.getString("modal-new-abonent-input10")}">
              </div>
              <div class="form-group">
                <label for="passwordclient">${manager.getString("modal-new-abonent-label11")}: </label>
                <input type="text" class="form-control" id="passwordclient" required name="passwordclient" placeholder="${manager.getString("modal-new-abonent-input11")}">
              </div>
              <div class="form-group">
                  <div class="pull-right">
                    <button type="button" class="btn btn-default" data-dismiss="modal">${manager.getString("modal-new-abonent-button1")}</button>
                    <button type="submit" class="btn btn-primary">${manager.getString("modal-new-abonent-button2")}</button>
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
