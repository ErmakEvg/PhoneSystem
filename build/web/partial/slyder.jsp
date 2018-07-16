<%-- 
    Document   : slyder
    Created on : 30.11.2016, 13:31:16
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<ol style="bottom:0px; top:450px;" class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1" class=""></li>
        <li data-target="#myCarousel" data-slide-to="2" class=""></li>
      </ol>
          <div id="myCarousel" class="carousel slide" data-ride="carousel">
               
      <div class="carousel-inner">
        <div class="item active">
         <img alt="First slide" src="image/slyder1.jpg">
          <div class="container">
            <div class="carousel-caption">
              <p>${manager.getString("slyder-text1")}</p>
            </div>
          </div>
        </div>
        <div class="item">
            <img alt="Second slide" src="image/slyder2.jpg">
          <div class="container">
            <div class="carousel-caption">
              <p>${manager.getString("slyder-text2")}</p>
            </div>
          </div>
        </div>
        <div class="item">
            <img alt="Third slide" src="image/slyder3.jpeg">
          <div class="container">
            <div class="carousel-caption">
              <p>${manager.getString("slyder-text3")}</p>
            </div>
          </div>
        </div>
      </div>

      <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
      <a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
    </div>