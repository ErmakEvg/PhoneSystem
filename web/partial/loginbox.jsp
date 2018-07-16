<%-- 
    Document   : loginbox
    Created on : 30.11.2016, 13:48:51
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="num" value="0"></c:set>
                        <c:if test = "${auth == true}">
                            <c:set var="num" value="1"></c:set>
                        </c:if>
                        <c:set var="num1" value="0"></c:set>
                        <c:if test = "${error == true}">
                            <c:set var="num1" value="1"></c:set>
                        </c:if>
                        <c:choose>
                            <c:when test = "${num == 0 and num1 == 0}">
                                <form role="form" class="navbar-form navbar-right" style="margin-right: 15px;"  method="POST" action="PhoneSystemServlet">
                                    <input type="hidden" name="action" value="loginabonent" />
                                    <div class="input-group">
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                                        <input required autofocus type="text" class="form-control" id="login" name="login" placeholder="${manager.getString("nav-input1")}">
                                    </div>
                                    <div class="input-group">
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                                        <input  required type="password" class="form-control" id="password" name="password" placeholder="${manager.getString("nav-input2")}">
                                    </div>
                                    <button  type="submit" class="btn btn-success">${manager.getString("nav-button1")}</button>
                                </form>
                            </c:when>
                            <c:when test = "${num1 == 1}">
                                <form role="form" class="navbar-form navbar-right" style="margin-right: 15px;"  method="POST" action="PhoneSystemServlet">
                                    <input type="hidden" name="action" value="loginabonent" />
                                    <div class="input-group has-error has-feedback">
                                        <span class="input-group-addon" ><span style="color: red;" class="glyphicon glyphicon-user"></span></span>
                                        <input required autofocus type="text" class="form-control has-error" id="login" name="login" placeholder="${manager.getString("nav-input1")}">
                                        <span class="glyphicon glyphicon-remove form-control-feedback"></span>    
                                    </div>
                                    <div class="input-group has-error has-feedback">
                                        <span class="input-group-addon"><span style="color: red;" class="glyphicon glyphicon-lock"></span></span>
                                        <input  required type="password" class="form-control" id="password" name="password" placeholder="${manager.getString("nav-input2")}">
                                        <span class="glyphicon glyphicon-remove form-control-feedback"></span>
                                    </div>
                                    <button  type="submit" class="btn btn-success">${manager.getString("nav-button1")}</button>
                                </form>
                            </c:when>
                            <c:when test = "${num == 1}">
                                <c:if test = "${block != true}">
                                    <c:set var="block" value="false"></c:set>
                                </c:if>
                                <c:if test = "${block == false}">
  
                                <form role="form" class="navbar-form navbar-right" style="margin-right: 15px;"  method="POST" action="PhoneSystemServlet">
                                    <input type="hidden" name="action" value="loginabonent" />
                                    <div class="form-group">
                                        <p style="color:white; margin: 0px;">${manager.getString("nav-login-label1")}: ${abonent.getCountMooney()} ${manager.getString("nav-login-label2")}.</p>  
                                    </div>
                                    <button  type="submit" class="btn btn-primary">${manager.getString("nav-login-button1")}</button>
                                    <div class="form-group">
                                        <ul style="margin: 0px; margin-right: 15px;" class="user-menu">
                                            <li class="dropdown pull-right">
                                                <a  href="#" class="dropdown-toggle" data-toggle="dropdown"><svg style="margin:0px; width: 25px; height: 25px;" class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg> ${abonent.getFirstName()} ${abonent.getMiddleName()} <span class="caret"></span></a>
                                                <ul  class="dropdown-menu" role="menu">
                                                    <li><a href="#"><svg style="margin:0px; width: 20px; height: 20px;" class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg> ${manager.getString("nav-login-select1")}</a></li>
                                                    <li><a href="PhoneSystemServlet?action=detailuser&role=cl&id=${abonent.getId()}"><svg style="margin:0px; width: 20px; height: 20px;" class="glyph stroked calendar-blank"><use xlink:href="#stroked-calendar-blank"></use></svg> ${manager.getString("nav-login-select2")}</a></li>
                                                    <li><a href="PhoneSystemServlet?action=logoutabonent"><svg style="margin:0px; width: 20px; height: 20px;" class="glyph stroked cancel"><use xlink:href="#stroked-cancel"></use></svg> ${manager.getString("nav-login-select3")}</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                </form>
                                </c:if>
                                <c:if test = "${block == true}">
                                    <form role="form" class="navbar-form navbar-right" style="margin-right: 15px;"  method="POST" action="PhoneSystemServlet">
                                    <input type="hidden" name="action" value="loginabonent" />
                                    <div class="input-group has-warning has-feedback">
                                        <span class="input-group-addon" ><span style="color: red;" class="glyphicon glyphicon-user"></span></span>
                                        <input required autofocus type="text" class="form-control has-error" id="login" name="login" placeholder="${manager.getString("nav-input1")}">
                                        <span class="glyphicon glyphicon-remove form-control-feedback"></span>    
                                    </div>
                                    <div class="input-group has-warning has-feedback">
                                        <span class="input-group-addon"><span style="color: red;" class="glyphicon glyphicon-lock"></span></span>
                                        <input  required type="password" class="form-control" id="password" name="password" placeholder="${manager.getString("nav-input1")}">
                                        <span class="glyphicon glyphicon-remove form-control-feedback"></span>
                                    </div>
                                    <button  type="submit" class="btn btn-success">${manager.getString("nav-button1")}</button>
                                </form>
                                </c:if>
                            </c:when>
                        </c:choose>