<%-- 
    Document   : index
    Created on : 22.11.2016, 10:34:48
    Author     : user
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${manager.getString("main-page-title")}</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">
</head>

<body>
  
    <%@include file="partial/headadmin.jsp" %>

    <div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
        <ul class="nav menu">
            <li class="active"><a href="PhoneSystemServlet?action=getmain"><svg class="glyph stroked home"><use xlink:href="#stroked-home"></use></svg> ${manager.getString("main-page-nav-link1")}</a></li>
            <li><a href="PhoneSystemServlet?action=getabonents"><svg class="glyph stroked table"><use xlink:href="#stroked-table"></use></svg> ${manager.getString("main-page-nav-link2")}</a></li>
            <li><a href="PhoneSystemServlet?action=getservices"><svg class="glyph stroked table"><use xlink:href="#stroked-table"></use></svg> ${manager.getString("main-page-nav-link3")}</a></li>
            <li style="border-top: #0088cc solid 1px"><a href="PhoneSystemServlet?action=getadmins"><svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg> ${manager.getString("main-page-nav-link4")}</a></li>
        </ul>
               
    </div>
  
    <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">			
        <div  class="row">
            <ol class="breadcrumb">
                <li><a href="#"><svg class="glyph stroked home"><use xlink:href="#stroked-home"></use></svg></a></li>
                <li class="active">${manager.getString("main-page-title-head")}</li>
            </ol>
        </div>
        <div style="margin-top: 15px;" class="row">
            <div class="col-xs-12 col-md-6 col-lg-4">
                <div class="panel panel-blue panel-widget ">
                    <div class="row no-padding">
                        <div class="col-sm-3 col-lg-3 widget-left">
                            <svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg>
                        </div>
                        <div class="col-sm-9 col-lg-9 widget-right">
                            <div class="large">${countAbonent}</div>
                            <div class="text-muted">${manager.getString("main-page-block1-head")}</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-md-6 col-lg-4">
                <div class="panel panel-orange panel-widget">
                    <div class="row no-padding">
                        <div class="col-sm-3 col-lg-3 widget-left">
                            <svg class="glyph stroked calendar-blank"><use xlink:href="#stroked-calendar-blank"/></svg>
                        </div>
                        <div class="col-sm-9 col-lg-9 widget-right">
                            <div class="large">${countService}</div>
                            <div class="text-muted">${manager.getString("main-page-block2-head")}</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-md-6 col-lg-4">
                <div class="panel panel-teal panel-widget">
                    <div class="row no-padding">
                        <div class="col-sm-3 col-lg-3 widget-left">
                            <svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg>
                        </div>
                        <div class="col-sm-9 col-lg-9 widget-right">
                            <div class="large">${countNewAbonent}</div>
                            <div class="text-muted">${manager.getString("main-page-block3-head")}</div>
                        </div>
                    </div>
                </div>
            </div>
	</div>
                            
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">${manager.getString("main-page-chart-title")}</div>
                    <div class="panel-body">
                        <div class="canvas-wrapper">
                                <canvas class="main-chart" id="line-chart" height="200" width="600"></canvas>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>

        $(window).on('resize', function () {
          if ($(window).width() > 768) $('#sidebar-collapse').collapse('show')
        })
        $(window).on('resize', function () {
          if ($(window).width() <= 767) $('#sidebar-collapse').collapse('hide')
        })
        
        var randomScalingFactor = function(){ return Math.round(Math.random()*1000)};

	var lineChartData = {
			labels : ["${manager.getString("month1")}","${manager.getString("month2")}","${manager.getString("month3")}",
                            "${manager.getString("month4")}","${manager.getString("month5")}","${manager.getString("month6")}",
                            "${manager.getString("month7")}", "${manager.getString("month8")}", "${manager.getString("month9")}",
                            "${manager.getString("month10")}", "${manager.getString("month11")}", "${manager.getString("month12")}"],
			datasets : [
				{
					fillColor : "rgba(48, 164, 255, 0.2)",
					strokeColor : "rgba(48, 164, 255, 0.8)",
					highlightFill : "rgba(48, 164, 255, 0.75)",
					highlightStroke : "rgba(48, 164, 255, 1)",
					data : [${countByMonth[0]},${countByMonth[1]},${countByMonth[2]},
                                            ${countByMonth[3]},${countByMonth[4]},${countByMonth[5]},${countByMonth[6]},
                                                    ${countByMonth[7]},${countByMonth[8]},${countByMonth[9]},${countByMonth[10]},${countByMonth[11]}]
				}
			]

		}
		
	

window.onload = function(){
	var chart1 = document.getElementById("line-chart").getContext("2d");
	window.myLine = new Chart(chart1).Bar(lineChartData, {
		responsive: true
	});	
};
    </script>	
</body>

</html>
