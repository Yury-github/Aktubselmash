<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--@elvariable id="browserClass" type="java.lang.String"--%>
<%--@elvariable id="country" type="java.lang.Boolean"--%>
<%--@elvariable id="productPrice" type="ru.aktubselmash.model.ProductPrice"--%>
<%--@elvariable id="dependantPrices" type="java.util.List<ru.aktubselmash.model.ProductPrice>"--%>
<c:set var="price">
    <c:choose>
        <c:when test="${productPrice.discount gt 0}">${productPrice.price - productPrice.discount}</c:when>
        <c:otherwise>${productPrice.price}</c:otherwise>
    </c:choose>
</c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>${productPrice.product.name}</title>
	<meta content="${productPrice.product.name} - ${price} руб. Продажа по России наложенным платежом или самовывозом." name="description">
	<meta content="агрегат +для стрижки овец аси-101, куплю агрегат +для стрижки овец аси-101, агрегат +для стрижки овец аси-101 купить, агрегат +для стрижки овец аси-101 цена, машинка +для стрижки овец актюбсельмаш" name="keywords">
	<meta content="Актюбсельмаш" name="author">

	<link href="<%=request.getContextPath()%>/favicon.ico" rel="shortcut icon"/>
	<link type="image/x-icon" href="<%=request.getContextPath()%>/favicon.ico" rel="icon"/>
	<link media="all" type="text/css" href="<%=request.getContextPath()%>/css/smoothness/jquery-ui-1.8.13.custom.css" rel="stylesheet"/>
	<link media="all" type="text/css" href="<%=request.getContextPath()%>/css/main.css" rel="stylesheet"/>

	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.12.3.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-ui-1.8.13.custom.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/main.js"></script>
    <c:if test="${fn:contains(browserClass, 'ie6')}">
        <script type="text/javascript" src="<%=request.getContextPath()%>/js/DD_belatedPNG.js"></script>
    </c:if>
    <script type="text/javascript">
        $(document).ready(function() {
            <c:if test="${fn:contains(browserClass, 'ie6')}">
                DD_belatedPNG.fix('.png, .pdf');
            </c:if>

            var cnt = 1;
            var galInterval = setInterval(function() {
                if (cnt != -1) $($('.gallery-dots span').get(cnt++ % 3)).click();
            }, 5000);

            var blur = false;
            $(window).blur(function() {
                clearInterval(galInterval);
                blur = true;
            }).focus(function() {
                if (blur) {
                    galInterval = setInterval(function() {
                        if (cnt != -1) $($('.gallery-dots span').get(cnt++ % 3)).click();
                    }, 5000);
                    blur = false;
                }
            });

            setTimeout(function() { $(window).focus(); }, 0);

            $('.gallery-dots span').mousedown(function() {
                if (!$(this).hasClass('active')) cnt = -1;
            });
            $('.buy-button').click(function() {
                return buy(${productPrice.product.id}, "<%=request.getContextPath()%>/cart/addProduct");
            });
        });
    </script>
</head>
<body class="${browserClass}">
<div title="description" class="se-description" style="display: none;">
    Агрегат индивидуальный АСИ-101 работает от однофазной сети (обычной розетки)
    220 В, укомплектован одной машинкой МСУ-200. Отличается от АСУ-1 компактным и легким,
    но не менее мощным преобразователем частоты тока, достаточным для работы одной машинкой, запрос пишите на <a href="mailto:info@aktubselmash.ru">info@aktubselmash.ru</a>
</div>
<div itemscope itemtype="http://data-vocabulary.org/Breadcrumb" style="display:none;">
    <a itemprop="url" href="http://aktubselmash.ru/"><span itemprop="title">Главная</span></a>
</div>
<div id="wrapper">
    <fmt:setLocale value="RU"/>
    <c:set var="selected" value="clippers" scope="request"/>
    <c:set var="selectedLink" value="true" scope="request"/>
    <jsp:include page="../header.jsp" />
    <jsp:useBean id="now" class="java.util.Date" />
	<div id="content">
        <div class="main-content-sidebar" itemscope itemtype="http://schema.org/Product">
            <div class="box box-container">
                <h1 itemprop="name">${productPrice.product.name}</h1>
                <%--<meta itemprop="category" content="Машинки для стрижки овец" />--%>
                <p>
                    <div class="box-heading" style="height: 433px;">
                        <div class="gallery" style="float:left; margin-left: 5px; height: 433px; width: 400px;">
                            <div class="gallery-box" style="width: 400px;">
                                <ul class="gallery-box-ul" style="width: 1240px;">
                                    <li><img itemprop="image" src="<%=request.getContextPath()%>/images/clippers/ASI-101/1b.jpg" alt="${productPrice.product.name}" border="0" width="400" height="414"/></li>
                                    <li><img src="<%=request.getContextPath()%>/images/clippers/MSU-200/2b.jpg" alt="${productPrice.product.name}" border="0" width="400" height="414"/></li>
                                    <li><img src="<%=request.getContextPath()%>/images/clippers/MSU-200/3b.jpg" alt="${productPrice.product.name}" border="0" width="400" height="414"/></li>
                                </ul>
                            </div>
                            <div class="gallery-dots" style="width: 52px;">
                                <span class="active"></span>
                                <span></span>
                                <span></span>
                            </div>
                        </div>
                        <div style="float:left; padding-left: 3em;">
                            <h2 style="margin-top: 1em;">Характеристики</h2>
                            <ul class="char-ul">
                                <li>— мощность двигателя 300 Вт</li>
                                <li>— вес машинки 1,7 кг</li>
                                <li>— вес преобразователя 5,4 кг</li>
                                <li>— напряжение сети 220 В</li>
                                <li>— напряжение на машинке 36 В</li>
                                <li>— выходная частота тока 200 Гц</li>
                                <li>— частота тока на входе 50 Гц</li>
                                <li>— число оборотов в минуту 2100-3000</li>
                                <li>— уровень шума 83 Дб(а)</li>
                                <li>— размеры машинки <br/><span style="padding-left: 1.3em;">(Ш х В х Дл.) 80х100х325 мм</span></li>
                                <li>— размеры преобразователя <br/><span style="padding-left: 1.3em;">(Ш х В х Дл.) 240х180х90 мм</span></li>
                                <li>— диаметр рукоятки 37-49 мм</li>
                            </ul>
                            <div style="text-align: center; margin-top: 2em;">
                                <h1 style="margin-left: 0;" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
                                    <meta itemprop="priceCurrency" content="RUB" />
                                    <c:choose>
                                        <c:when test="${country}">
                                            <c:choose>
                                                <c:when test="${productPrice.discount gt 0 and productPrice.discountDueDate.time ge now.time}">
                                                    <span class="old-price-s"><fmt:formatNumber value="${productPrice.foreignPrice}"/></span>
                                                    <span itemprop="price"><fmt:formatNumber value="${productPrice.foreignPrice - productPrice.foreignDiscount}"/></span> руб.
                                                </c:when>
                                                <c:otherwise>
                                                    <span itemprop="price"><fmt:formatNumber value="${productPrice.foreignPrice}"/></span> руб.
                                                </c:otherwise>
                                            </c:choose>
                                        </c:when>
                                        <c:otherwise>
                                            <c:choose>
                                                <c:when test="${productPrice.discount gt 0 and productPrice.discountDueDate.time ge now.time}">
                                                    <span class="old-price-s"><fmt:formatNumber value="${productPrice.price}"/></span>
                                                    <span itemprop="price"><fmt:formatNumber value="${productPrice.price - productPrice.discount}"/></span> руб.
                                                </c:when>
                                                <c:otherwise>
                                                    <span itemprop="price"><fmt:formatNumber value="${productPrice.price}"/></span> руб.
                                                </c:otherwise>
                                            </c:choose>
                                        </c:otherwise>
                                    </c:choose>
                                </h1>
                                <c:choose>
                                    <c:when test="${productPrice.product.unavailableFlag}">
                                        <h2 style="padding-top: 10px;">Нет в наличии</h2>
                                    </c:when>
                                    <c:otherwise>
                                        <div style="margin: 10px auto; width: 110px;">
                                            <a class="buy-button blue-button" href="">
                                                <span class="label">Купить</span>
                                                <span class="r"></span>
                                            </a>
                                            <span style="display: none;" class="blue-button-loading"></span>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <c:choose>
                            <c:when test="${productPrice.product.newFlag}">
                                <div class="corner-en">
                                    <img src="<%=request.getContextPath()%>/images/new-l.png" alt="Новинка" border="0" class="png" width="152" height="143"/>
                                </div>
                            </c:when>
                            <c:when test="${productPrice.discount gt 0 and productPrice.discountDueDate.time ge now.time}">
                                <c:set var="date">
                                    <fmt:formatDate value="${productPrice.discountDueDate}" pattern="ddMM" />
                                </c:set>
                                <c:if test="${fn:contains(browserClass, 'ie6')}"><br/></c:if>
                                <div class="corner-en">
                                    <img src="<%=request.getContextPath()%>/images/discounts/discount-l-${date}.png"
                                         alt="Скидка до <fmt:formatDate value="${productPrice.discountDueDate}" pattern="dd MMM" />"
                                         border="0" width="152" height="143"
                                         class="png "/>
                                </div>
                            </c:when>
                        </c:choose>
                    </div>
                </p>
            </div>
            <div class="box box-container" style="margin-top: 1em;">
                <ul class="vertical-ul">
                    <li>
                        <h2>Описание</h2>

                        <div itemprop="description">
                            <p style="margin-top: 12px;">Агрегат индивидуальный АСИ-101 работает от однофазной сети (обычной розетки) 220В. Поставляется в комплекте с машинкой
                                <a href="<%=request.getContextPath()%>/parts/msu-200">МСУ-200</a> производства завода &laquo;Актюбсельмаш&raquo; и преобразователем частоты тока мощностью 250 Вт,
                                выдающего 3-х фазный ток с частотой 200 Гц и напряжением 36 В. Преобразователь оснащен гибким кабелем со штеккерным разъемом и кнопкой Вкл/Выкл.
                                Это самый надежный агрегат из существующих.</p>
                            <p>На машинке МСУ-200 установлен бесщеточный асинхронный 3-х фазный двигатель, который не греется при работе и не требует дополнительного обслуживания и
                               замены угольных щеток. При хорошем навыке стригалей с помощью АСИ-101 можно постричь 100–160 овец за смену и свыше 3000 овец за сезон.</p>
                        </div>
                    </li>
                    <li>
                        <h2>Комплектация</h2>
                        <ul class="sc-case-ul">
                            <li class="first">Машинка для стрижки овец МСУ-200</li>
                            <li>Преобразователь частоты тока (в настоящее время поставляется новая модель преобразователя на современной электронной базе)</li>
                            <li>Комплект ножей (установлены на машинку)</li>
                            <!--<li>Специальная отвертка и спецключ</li>-->
                            <li><a href="<%=request.getContextPath()%>/files/ASI_MSU_manual_rus.pdf" target="_blank">Инструкция по эксплуатации</a></li>
                            <!--<li>Портфель для транспортировки и хранения</li>-->
                        </ul>
                    </li>
                </ul>
            </div>
            <%--<div class="ul-list-two" style="margin-top: 1em;">--%>
                <%--<ul class="ul">--%>
                    <%--<li class="li li-first"><div class="box box-container">--%>
                        <%--<div class="description" style="height: 200px;">--%>
                            <%--<h2 class="b">Описание</h2>--%>
                            <%--<div itemprop="description">--%>
                                <%--<p style="margin-top: 12px;">Агрегат индивидуальный АСИ-101 работает от однофазной сети (обычной розетки) 220В, укомплектован машинкой--%>
                                <%--<a href="<%=request.getContextPath()%>/parts/msu-200">МСУ-200</a> производства завода &laquo;Актюбсельмаш&raquo; и преобразователем частоты тока мощностью 250 Вт,--%>
                                <%--выдающего 3-х фазный ток с частотой 200 Гц и напряжением 36 В. Преобразователь оснащен гибким кабелем со штеккерным разъемом и кнопкой Вкл/Выкл.--%>
                                <%--Машинка МСУ-200 работает только от преобразователя частоты тока, при этом на машинку с преобразователя подается безопасное 3-х фазное напряжение 36 В с частотой 200 Гц.--%>
                                <%--Это самый надежный агрегат из имеющихся. На его машинке МСУ-200 установлен без щеточный асинхронный 3-х фазный двигатель, который не греется при работе и--%>
                                <%--не требует дополнительных работ по контролю за состоянием и замене угольных щеток. При хорошем навыке стригалей им можно постричь 100&ndash;160 овец за смену и--%>
                                <%--свыше 3000 овец за сезон.</p></div>--%>
                        <%--</div>--%>
                    <%--</div></li>--%>
                    <%--<li class="li"><div class="box box-container">--%>
                        <%--<div class="description" style="height: 200px;">--%>
                            <%--<p>--%>
                                <%--<h2 class="b">Комплектация</h2>--%>
                                <%--<ul class="sc-case-ul">--%>
                                    <%--<li class="first">Машинка для стрижки овец МСУ-200</li>--%>
                                    <%--<li>Преобразователь частоты тока ПЧ-400-2</li>--%>
                                    <%--<li>Комплект ножей (установлены на машинку)</li>--%>
                                    <%--<li>Специальная отвертка и спецключ</li>--%>
                                    <%--<li>Инструкция по применению</li>--%>
                                    <%--<li>Портфель для транспортировки и хранения</li>--%>
                                <%--</ul>--%>
                            <%--</p>--%>
                        <%--</div>--%>
                    <%--</div></li>--%>
                <%--</ul>--%>
            <%--</div>--%>
        </div>
        <div class="sidebar">
            <div class="portlet">
                <h3>Файлы</h3>
                <div class="content description">
                    <ul class="ul-clean ul-li-mb-1em">
                        <li class="first"><a class="pdf" href="<%=request.getContextPath()%>/files/ASI_MSU_manual_rus.pdf" target="_blank" title="Инструкция по эксплуатации агрегата АСИ-101">Инструкция по эксплуатации</a></li>
                        <!--<li><a class="pdf" href="<%=request.getContextPath()%>/files/ASI_MPO_manual_rus.pdf" target="_blank">Паспорт преобразователя частоты</a></li>-->
                    </ul>
                </div>
            </div>
            <jsp:useBean id="taList" class="java.util.ArrayList" />
            <div class="portlet">
                <h3><span>Запасные пары</span></h3>
                <div class="content description">
                    <ul class="vertical-d-ul">
                        <c:forEach var="dp" items="${dependantPrices}" varStatus="status">
                            <c:choose>
                                <c:when test="${dp.product.shortName ne 'ta-1' and dp.product.shortName ne 'ta-2'  and dp.product.shortName ne 'ta-2m'}">
                                    <li <c:if test="${status.first}">class="first"</c:if>>
                                        <c:set var="path">
                                            <c:choose>
                                                <c:when test="${dp.product.partsFlag}">parts</c:when>
                                                <c:otherwise>clippers</c:otherwise>
                                            </c:choose>
                                        </c:set>
                                        <a href="<%=request.getContextPath()%>/${path}/${dp.product.shortName}">
                                            <p style="text-align: center; margin-bottom: 0;">
                                                <img src="<%=request.getContextPath()%>${dp.product.smallImagePath}"
                                                     alt="${dp.product.name}" border="0" class="png" width="100"/>
                                            </p>
                                            <h4 class="name">${dp.product.name}</h4>
                                            <h4 class="price">
                                                <c:choose>
                                                    <c:when test="${country}">
                                                        <c:choose>
                                                            <c:when test="${dp.discount gt 0 and dp.discountDueDate.time ge now.time}">
                                                                <span class="old-price-s" style="font-size: 10pt; color: #808080;"><fmt:formatNumber value="${dp.foreignPrice}"/></span>
                                                                <fmt:formatNumber value="${dp.foreignPrice - dp.foreignDiscount}"/> руб.
                                                            </c:when>
                                                            <c:otherwise>
                                                                <fmt:formatNumber value="${dp.foreignPrice}"/> руб.
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:choose>
                                                            <c:when test="${dp.discount gt 0 and dp.discountDueDate.time ge now.time}">
                                                                <span class="old-price-s" style="font-size: 10pt; color: #808080;"><fmt:formatNumber value="${dp.price}"/></span>
                                                                <fmt:formatNumber value="${dp.price - dp.discount}"/> руб.
                                                            </c:when>
                                                            <c:otherwise>
                                                                <fmt:formatNumber value="${dp.price}"/> руб.
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:otherwise>
                                                </c:choose>
                                            </h4>
                                        </a>
                                        <%--<c:choose>--%>
                                            <%--<c:when test="${dp.product.newFlag}">--%>
                                                <%--<div class="corner-en">--%>
                                                    <%--<img src="<%=request.getContextPath()%>/images/new-s.png" alt="Новинка" border="0"/>--%>
                                                <%--</div>--%>
                                            <%--</c:when>--%>
                                            <%--<c:when test="${dp.discount gt 0}">--%>
                                                <%--<div class="corner-en">--%>
                                                    <%--<img src="<%=request.getContextPath()%>/images/discount-s.png"--%>
                                                         <%--alt="Скидка до <fmt:formatDate value="${dp.discountDueDate}" pattern="dd MMM" />"--%>
                                                         <%--border="0"/>--%>
                                                <%--</div>--%>
                                            <%--</c:when>--%>
                                        <%--</c:choose>--%>
                                    </li>
                                </c:when>
                                <c:otherwise><% taList.add(pageContext.getAttribute("dp")); %></c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <c:if test="${not empty taList}">
                <div class="portlet">
                    <h3>Заточка режущих пар</h3>
                    <div class="content description">
                        <ul class="vertical-d-ul">
                            <c:forEach items="${taList}" var="ta" varStatus="status">
                                <li <c:if test="${status.first}">class="first"</c:if>>
                                    <a href="<%=request.getContextPath()%>/parts/${ta.product.shortName}">
                                        <p style="text-align: center; margin-bottom: 0;">
                                            <img src="<%=request.getContextPath()%>${ta.product.smallImagePath}"
                                                 alt="${ta.product.name}" border="0" class="png" width="100" height="103"/>
                                        </p>
                                        <h4 class="name">${ta.product.name}</h4>
                                        <h4 class="price">
                                            <c:choose>
                                                <c:when test="${country}">
                                                    <c:choose>
                                                        <c:when test="${ta.discount gt 0 and ta.discountDueDate.time ge now.time}">
                                                            <span class="old-price-s" style="font-size: 10pt; color: #808080;"><fmt:formatNumber value="${ta.foreignPrice}"/></span>
                                                            <fmt:formatNumber value="${ta.foreignPrice - ta.foreignDiscount}"/> руб.
                                                        </c:when>
                                                        <c:otherwise>
                                                            <fmt:formatNumber value="${ta.foreignPrice}"/> руб.
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:choose>
                                                        <c:when test="${ta.discount gt 0 and ta.discountDueDate.time ge now.time}">
                                                            <span class="old-price-s" style="font-size: 10pt; color: #808080;"><fmt:formatNumber value="${ta.price}"/></span>
                                                            <fmt:formatNumber value="${ta.price - ta.discount}"/> руб.
                                                        </c:when>
                                                        <c:otherwise>
                                                            <fmt:formatNumber value="${ta.price}"/> руб.
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:otherwise>
                                            </c:choose>
                                        </h4>
                                    </a>
                                        <%--<c:choose>--%>
                                        <%--<c:when test="${ta.product.newFlag}">--%>
                                        <%--<div class="corner-en">--%>
                                        <%--<img src="<%=request.getContextPath()%>/images/new-s.png" alt="Новинка" border="0"/>--%>
                                        <%--</div>--%>
                                        <%--</c:when>--%>
                                        <%--<c:when test="${ta.discount gt 0}">--%>
                                        <%--<div class="corner-en">--%>
                                        <%--<img src="<%=request.getContextPath()%>/images/discount-s.png"--%>
                                        <%--alt="Скидка до <fmt:formatDate value="${ta.discountDueDate}" pattern="dd MMM" />"--%>
                                        <%--border="0"/>--%>
                                        <%--</div>--%>
                                        <%--</c:when>--%>
                                        <%--</c:choose>--%>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </c:if>
        </div>
	</div>
	<jsp:include page="../footer.jsp" />
</div>
<jsp:include page="../error-msg.jsp" />
</body>
</html>
