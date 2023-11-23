<%@ page import="com.example.inyeon.main.dto.SportsclassDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.inyeon.paging.Paging" %>
<%@ page import="com.example.inyeon.paging.Criteria" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-11-17
  Time: 오후 11:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    Object obj = request.getAttribute("paging");
    Paging paging = (Paging) obj;
    int startPage = paging.getStartPage();
    int endPage = paging.getEndPage();
    boolean prev = paging.isPrev();
    boolean next = paging.isNext();

%>
<html>
<head>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <title>Title</title>
    <link rel="stylesheet" href="css/commonBody.css">
    <script src="js/sportsclassfunctionjs.js"></script> <!-- Separate JavaScript file -->
    <script>
        $(document).ready(function () {

            var startPage = "<%=startPage%>";
            var endPage = "<%=endPage%>";
            var prev = "<%=prev%>";
            var next = "<%=next%>";
            console.log(startPage);
            console.log(endPage);
            console.log(prev);
            console.log(next);

            paging(prev, startPage, endPage, next);

            $("#ctprvn_nm").change(function (){

                var ctprvn_nm = $("#ctprvn_nm").val();
                var item_nm = $("#item_nm").val();
                var page = 1;

                ajaxselect(ctprvn_nm, item_nm, page);
            });

            $("#item_nm").change(function (){

                var ctprvn_nm = $("#ctprvn_nm").val();
                var item_nm = $("#item_nm").val();
                var page = 1;
                ajaxselect(ctprvn_nm, item_nm, page);

            });

            $(".classname").on("click", function() {
                var classname = $(this).text();
                console.log("class" + classname);
                window.location.href = "/sportsclassselect" + '?clssrm_nm=' + encodeURIComponent(classname);
            });

        });
    </script>
    <style>
    table, tr, td {
        border : 1px solid black;
        text-align: center;
    }
</style>
</head>

<body>
<!-- header include start -->
<jsp:include page="header.jsp"/>
<!-- header include end -->
    <main>
            <div class="mainContainer">
                <select id="ctprvn_nm" name="ctprvn_nm">
                    <option value="-" selected>지역</option>
            <c:forEach var="citynamelist" items="${cityname}">
                <option value="${citynamelist}">${citynamelist}</option>
            </c:forEach>
                </select>
        <select id="item_nm" name="item_nm">
            <option value="-" selected>종목</option>
            <c:forEach var="itemnamelist" items="${itemname}">
                <option value="${itemnamelist}">${itemnamelist}</option>
            </c:forEach>
        </select>
        <table id="sportsclasslist">
            <tr>
                <td>종목명</td>
                <td>부종목명</td>
                <td>시도명</td>
                <td>시군구명</td>
                <td>교실명</td>
            </tr>
            <c:forEach var="lista" items="${list}">
               <tr>
                   <td>${lista.item_nm}</td>
                   <td>${lista.subitem_nm}</td>
                   <td>${lista.ctprvn_nm}</td>
                   <td>${lista.signgu_nm}</td>
                   <td class="classname">${lista.clssrm_nm}</td>
               </tr>
            </c:forEach>
        </table>
        <ul class="paging" id="paging">

        </ul>
    </div>
</main>
<!-- footer include start-->
<jsp:include page="footer.jsp" />
<!-- footer include end-->
</body>
</html>
