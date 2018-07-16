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
    <title>${manager.getString("detail-abonent-page-title")}</title>
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
        <form role="search">
            <div class="form-group">
                <input type="text" class="form-control" placeholder="Поиск">
            </div>
        </form>
        <ul class="nav menu">
            <li><a href="PhoneSystemServlet?action=getmain"><svg class="glyph stroked home"><use xlink:href="#stroked-home"></use></svg> ${manager.getString("main-page-nav-link1")}</a></li>
            <li class="active"><a href="PhoneSystemServlet?action=getabonents"><svg class="glyph stroked table"><use xlink:href="#stroked-table"></use></svg> ${manager.getString("main-page-nav-link2")}</a></li>
            <li><a href="PhoneSystemServlet?action=getservices"><svg class="glyph stroked table"><use xlink:href="#stroked-table"></use></svg> ${manager.getString("main-page-nav-link3")}</a></li>
            <li style="border-top: #0088cc solid 1px"><a href="PhoneSystemServlet?action=getadmins"><svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg> ${manager.getString("main-page-nav-link4")}</a></li>
        </ul>
    </div>
		
    <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">			
        <div class="row">
            <ol class="breadcrumb">
                <li><a href="#"><svg class="glyph stroked home"><use xlink:href="#stroked-home"></use></svg></a></li>
                <li class="active">${manager.getString("detail-abonent-page-head1")}</li>
            </ol>
        </div>

        <div style="margin-top:15px;" class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-body tabs">
                        <ul class="nav nav-pills">
                            <li class="active"><a href="#pilltab1" data-toggle="tab">${manager.getString("detail-abonent-page-tab1")}</a></li>
                            <li><a href="#pilltab2" data-toggle="tab">${manager.getString("detail-abonent-page-tab2")}</a></li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane fade in active" id="pilltab1">
                                <c:if test = "${flag >= 1}">
                                <div class="alert alert-success">
                                    <button type="button" class="close" data-dismiss="alert">×</button>
                                        ${manager.getString("detail-abonent-page-alert-succes")}
                                </div>
                                </c:if>
                                <form class="form-horizontal" method="POST" action="PhoneSystemServlet">
                                    <fieldset>
                                        <input type="hidden" name="action" value="updateuser" />
                                        <div class="form-group">
                                            <label class="col-xs-4 control-label" for="id">Id:</label>
                                            <div class="col-xs-8">
                                                <input type="text" value="${abonent.getId()}" class="form-control" id="id" name="id" placeholder="id">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-xs-4 control-label" for="firstname">${manager.getString("modal-new-abonent-label1")}:</label>
                                            <div class="col-xs-8">
                                                <input type="text" value="${abonent.getFirstName()}" required class="form-control" id="firstname" name="firstname" placeholder="${manager.getString("modal-new-abonent-input1")}">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-xs-4 control-label"  for="middlename">${manager.getString("modal-new-abonent-label2")}:</label>
                                            <div class="col-xs-8">
                                                <input type="text" value="${abonent.getMiddleName()}" required class="form-control" id="middlename" name="middlename" placeholder="${manager.getString("modal-new-abonent-input2")}">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-xs-4 control-label" for="lastname">${manager.getString("modal-new-abonent-label3")}:</label>
                                            <div class="col-xs-8">
                                                <input type="text" value="${abonent.getLastName()}" required class="form-control" id="lastname" name="lastname" placeholder="${manager.getString("modal-new-abonent-input3")}">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-xs-4 control-label" for="datebirthday">${manager.getString("modal-new-abonent-label4")}:</label>
                                            <div class="col-xs-8">
                                                <div class="input-group date" id="datetimepicker1">
                                                    
                                                    <input type="text" value="${dateBirthday}"  required placeholder="${manager.getString("modal-new-abonent-input4")}" id="datebirthday" name="datebirthday" class="form-control">
                                                    <div class="input-group-addon">
                                                        <span class="glyphicon glyphicon-calendar"></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-xs-4 control-label" for="city">${manager.getString("modal-new-abonent-label5")}: </label>
                                            <div class="col-xs-8">
                                                <input type="text" value="${abonent.getCity()}" required class="form-control" id="city" name="city" placeholder="${manager.getString("modal-new-abonent-input5")}">
                                            </div>
                                        </div>
                  
                                      <div class="form-group">
                                        <label class="col-xs-4 control-label" for="street">${manager.getString("modal-new-abonent-label6")}:</label>
                                        <div class="col-xs-8">
                                        <input type="text" value="${abonent.getStreet()}" required class="form-control" id="street" name="street" placeholder="${manager.getString("modal-new-abonent-input6")}">
                                        </div>
                                      </div>

                                      <div class="form-group">
                                        <label class="col-xs-4 control-label" for="homephonenumber">${manager.getString("modal-new-abonent-label7")}: </label>
                                        <div class="col-xs-8">
                                        <input type="text" value="${abonent.getHomePhoneNumber()}" required class="form-control" id="homephonenumber" name="homephonenumber" placeholder="${manager.getString("modal-new-abonent-input7")}">
                                        </div>
                                      </div>

                                      <div class="form-group">
                                        <label class="col-xs-4 control-label" for="phonenumber">${manager.getString("modal-new-abonent-label8")}: </label>
                                        <div class="col-xs-8">
                                        <input type="text" value="${abonent.getMobPhoneNumber()}" class="form-control" id="phonenumber" name="phonenumber" placeholder="${manager.getString("modal-new-abonent-input8")}">
                                        </div>
                                      </div>
                  
                                  <div class="form-group">
                                    <label class="col-xs-4 control-label" for="numpasport">${manager.getString("modal-new-abonent-label9")}:</label>
                                    <div class="col-xs-8">
                                    <input type="text" value="${abonent.getNumberPassport()}" required class="form-control" id="numpasport" name="numpasport" placeholder="${manager.getString("modal-new-abonent-input9")}">
                                    </div>
                                  </div>

                                  <div class="form-group">
                                    <label class="col-xs-4 control-label" for="numclient">${manager.getString("modal-new-abonent-label10")}: </label>
                                    <div class="col-xs-8">
                                    <input type="text" value="${abonent.getLogin()}" required class="form-control" id="numclient" name="numclient" placeholder="${manager.getString("modal-new-abonent-input10")}">
                                    </div>
                                  </div>

                                  <div class="form-group">
                                    <label class="col-xs-4 control-label" for="passwordclient">${manager.getString("modal-new-abonent-label11")}: </label>
                                    <div class="col-xs-8">
                                    <input type="text" value="${abonent.getPassword()}" required class="form-control" id="passwordclient" name="passwordclient" placeholder="${manager.getString("modal-new-abonent-input11")}">
                                    </div>
                                  </div>

                                  <div class="form-group">
                                      <div class="pull-right" style="margin-right:20px;">
                                        <button type="submit" class="btn btn-primary">${manager.getString("modal-new-abonent-button2")}</button>
                                      </div>
                                  </div>
                                  </fieldset>
                                </form>
                            </div>
			<div class="tab-pane fade" id="pilltab2">
			<div class="row">
				<div class="panel panel-default">
					<div class="panel-heading">${manager.getString("detail-abonent-page-head2")}</div>
					<div class="panel-body">
                                            <table class="table table-striped" data-toggle="table"  data-show-refresh="true" data-show-toggle="true" data-show-columns="true" data-search="true"  data-pagination="true" data-sort-name="name" data-sort-order="desc">
                                                <thead>
						    <tr>
						        <th data-field="id" data-sortable="true">№</th>
                                                        <th data-field="firstname" data-sortable="true">${manager.getString("detail-abonent-page-table-head1")}</th>
						        <th data-field="middletname"  data-sortable="true">${manager.getString("detail-abonent-page-table-head2")}</th>
						        <th data-field="lastname" data-sortable="true">${manager.getString("detail-abonent-page-table-head3")}</th>
                                                        <th data-field="datestart" data-sortable="true">${manager.getString("detail-abonent-page-table-head4")}</th>
                                                        <th data-field="login" data-sortable="true">${manager.getString("detail-abonent-page-table-head5")}</th>
                                                        <th>${manager.getString("detail-abonent-page-table-head6")}</th>
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
                                                                    <td><a href="PhoneSystemServlet?action=deleteservicefromuser&id=${invoice.getId()}"><span title="${manager.getString("detail-abonent-page-table-span")}" style="font-size:19px;padding-left: 7px; color:red" class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span></a>
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
                        format: 'dd-mm-yyyy',
                        autoclose: 'true',
                        language: 'ru'
                        
                        
                    });
                });
                
	</script>	
</body>

</html>
