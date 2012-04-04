<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--@elvariable id="productPrices" type="java.util.List<ru.aktubselmash.model.ProductPrice>"--%>
<%--@elvariable id="browserClass" type="java.lang.String"--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Каталог машинок для стрижки овец - Актюбсельмаш</title>
	<meta content="Каталог машинок для стрижки овец. Продажа по России наложенным платежом или самовывозом." name="description">
	<meta content="машинка +для стрижки овец каталог, машинки +для стрижки овец каталог, машинка +для стрижки овец цена" name="keywords">
	<meta content="Актюбсельмаш" name="author">

	<link href="<%=request.getContextPath()%>/favicon.ico" rel="shortcut icon"/>
	<link type="image/x-icon" href="<%=request.getContextPath()%>/favicon.ico" rel="icon"/>
	<link media="all" type="text/css" href="<%=request.getContextPath()%>/css/main.css" rel="stylesheet"/>

	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.6.1.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/main.js"></script>
    <c:if test="${fn:contains(browserClass, 'ie6')}">
        <script type="text/javascript" src="<%=request.getContextPath()%>/js/DD_belatedPNG.js"></script>
    </c:if>
    <script type="text/javascript">
        $(document).ready(function() {
            <c:if test="${fn:contains(browserClass, 'ie6')}">
                DD_belatedPNG.fix('.png');
            </c:if>
        });
    </script>
</head>
<body class="${browserClass}">
<div title="description" class="se-description" style="display: none;">
    Каталог машинок для стрижки овец Liscop, Heiniger, "Актюбсельмаш". Продажа по России наложенным платежом или самовывозом, запрос пишите на <a href="mailto:info@aktubselmash.ru">info@aktubselmash.ru</a>
</div>
<div id="wrapper">
    <fmt:setLocale value="RU"/>
    <c:set var="selected" value="clippers" scope="request"/>
    <c:set var="selectedLink" value="false" scope="request"/>
    <jsp:include page="header.jsp" />
    <jsp:useBean id="now" class="java.util.Date" />
	<div id="content">
        <div class="box box-main">
            <h1>Машинки</h1>
            <c:forEach var="pp" items="${productPrices}" varStatus="status">
                <c:if test="${status.count % 3 eq 1}">
                    <div class="ul-list ul-list-transparent ul-list-three" style="margin-top:20px;">
                        <ul>
                </c:if>
                            <li class="box transparent <c:if test="${status.count % 3 eq 1}">first</c:if>">
                                <a href="<%=request.getContextPath()%>/clippers/${pp.product.shortName}">
                                    <p style="text-align: center;">
                                        <img src="<%=request.getContextPath()%>${pp.product.mediumImagePath}"
                                             alt="${pp.product.name}" border="0" class="png" width="200" height="207"/>
                                    </p>
                                    <h2 class="name">${pp.product.name}</h2>
                                    <h2 class="price">
                                        <c:choose>
                                            <c:when test="${pp.discount gt 0 and pp.discountDueDate.time ge now.time}">
                                                <span class="old-price-s" style="font-size: 10pt; color: #808080;">
                                                    <fmt:formatNumber value="${pp.price}"/></span>
                                                <fmt:formatNumber value="${pp.price - pp.discount}"/> руб.
                                            </c:when>
                                            <c:otherwise>
                                                <fmt:formatNumber value="${pp.price}"/> руб.
                                            </c:otherwise>
                                        </c:choose>
                                    </h2>
                                </a>
                                <c:choose>
                                    <c:when test="${pp.product.newFlag}">
                                        <div class="corner-en">
                                            <img src="<%=request.getContextPath()%>/images/new-m.png" alt="Новинка" border="0" class="png" width="100" height="94"/>
                                        </div>
                                    </c:when>
                                    <c:when test="${pp.discount gt 0 and pp.discountDueDate.time ge now.time}">
                                        <c:set var="date">
                                            <fmt:formatDate value="${pp.discountDueDate}" pattern="ddMM" />
                                        </c:set>
                                        <div class="corner-en">
                                            <img src="<%=request.getContextPath()%>/images/discounts/discount-m-${date}.png"
                                                 alt="Скидка до <fmt:formatDate value="${pp.discountDueDate}" pattern="dd MMM" />"
                                                 border="0" class="png" width="100" height="94"/>
                                        </div>
                                    </c:when>
                                </c:choose>
                            </li>
                <c:if test="${status.count % 3 eq 0}"></ul></div></c:if>
            </c:forEach>
            <c:if test="${fn:length(productPrices) % 3 ne 0}"></ul></div></c:if>
        </div>
	</div>
	<jsp:include page="footer.jsp" />
</div>
</body>
</html>