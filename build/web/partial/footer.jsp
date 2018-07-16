<%-- 
    Document   : footer
    Created on : 30.11.2016, 13:34:59
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<footer class="footer-distributed">
    <div class="footer-left">
        <p class="footer-links">
            <a href="#">${manager.getString("nav-link1")}</a>
            ·
            <a href="#">${manager.getString("nav-link2")}</a>
            ·
            <a href="#">${manager.getString("nav-link3")}</a>
            ·
            <a href="#">${manager.getString("nav-link4")}</a>
        </p>
        <p class="footer-company-name">${manager.getString("company-name")} &copy; 2016</p>
        <br></br>
        <p class="footer-company-name">${manager.getString("footer-swap-lang")}:</p>
        <span><a href="PhoneSystemServlet?action=changelang&l=en">${manager.getString("footer-lang2")} </a><a href="PhoneSystemServlet?action=changelang&l=ru">${manager.getString("footer-lang1")}</a></span>
            
    </div>
    <div class="footer-center">
        <div>
            <i class="fa fa-map-marker"></i>
            <p><span>${manager.getString("footer-address1")}</span> ${manager.getString("footer-address2")}</p>
        </div>
        <div>
            <i class="fa fa-phone"></i>
            <p>+375 29 6066688</p>
        </div>
        <div>
            <i class="fa fa-envelope"></i>
            <p><a href="mailto:support@company.com">support@company.com</a></p>
        </div>
    </div>
    <div class="footer-right">
        <p class="footer-company-about">
            <span>${manager.getString("footer-about-company")}</span>
                ${manager.getString("footer-social-links")}
        </p>
        <div class="footer-icons">
            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-linkedin"></i></a>
        </div>
    </div>
</footer>
