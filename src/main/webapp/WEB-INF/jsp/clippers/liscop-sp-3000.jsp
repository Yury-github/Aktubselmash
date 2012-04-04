<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--@elvariable id="browserClass" type="java.lang.String"--%>
<%--@elvariable id="product" type="ru.aktubselmash.model.Product"--%>
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
	<title>Машинка для стрижки овец ${productPrice.product.name} - Актюбсельмаш</title>
	<meta content="Машинка для стрижки овец ${productPrice.product.name} - ${price} руб. Продажа по России наложенным платежом или самовывозом." name="description">
	<meta content="машинка +для стрижки овец liscop, машинки +для стрижки овец liscop, куплю машинку +для стрижки овец liscop, машинка +для стрижки овец liscop купить, машинка +для стрижки овец liscop цена, машинка +для стрижки овец германия, машинка +для стрижки овец liscop продажа" name="keywords">
	<meta content="Актюбсельмаш" name="author">

	<link href="<%=request.getContextPath()%>/favicon.ico" rel="shortcut icon"/>
	<link type="image/x-icon" href="<%=request.getContextPath()%>/favicon.ico" rel="icon"/>
	<link media="all" type="text/css" href="<%=request.getContextPath()%>/css/smoothness/jquery-ui-1.8.13.custom.css" rel="stylesheet"/>
	<link media="all" type="text/css" href="<%=request.getContextPath()%>/css/main.css" rel="stylesheet"/>

	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.6.1.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-ui-1.8.13.custom.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/main.js"></script>
    <c:if test="${fn:contains(browserClass, 'ie6')}">
        <script type="text/javascript" src="<%=request.getContextPath()%>/js/DD_belatedPNG.js"></script>
    </c:if>
    <script type="text/javascript">
        $(document).ready(function() {
            <c:if test="${fn:contains(browserClass, 'ie6')}">
                DD_belatedPNG.fix('.png, .pdf, td.top');
            </c:if>

            var cnt = 1;
            var galInterval = setInterval(function() {
                if (cnt != -1) $($('.gallery-dots span').get(cnt++ % 3)).click();
            }, 5000);

            var blur = false;
            $(window).focus(function() {
                if (blur) {
                    galInterval = setInterval(function() {
                        if (cnt != -1) $($('.gallery-dots span').get(cnt++ % 3)).click();
                    }, 5000);
                    blur = false;
                }
            }).blur(function() {
                clearInterval(galInterval);
                blur = true;
            }).focus();

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
    Liscop Super Profi 3000 предназначена для большого количества овец (до 1000 голов), работает от обычной
    розетки 220 В, имеет вес 1,6 кг и длину кабеля 5 м, запрос пишите на <a href="mailto:info@aktubselmash.ru">info@aktubselmash.ru</a>
</div>
<div id="wrapper">
    <fmt:setLocale value="RU"/>
    <c:set var="selected" value="clippers" scope="request"/>
    <c:set var="selectedLink" value="true" scope="request"/>
    <jsp:include page="../header.jsp" />
    <jsp:useBean id="now" class="java.util.Date" />
	<div id="content">
        <div class="main-content-sidebar">
            <div class="box box-container">
                <h1 style="display: none;">Машинка для стрижки овец ${productPrice.product.name}</h1>
                <h1>Машинка ${productPrice.product.name}</h1>
                <p>
                    <div class="box-heading" style="height: 433px;">
                        <div class="gallery" style="float:left; margin-left: 5px; height: 433px; width: 400px;">
                            <div class="gallery-box" style="width: 400px;">
                                <ul class="gallery-box-ul" style="width: 1240px;">
                                    <li><img src="<%=request.getContextPath()%>/images/clippers/Liscop/1b.jpg" alt="Машинка для стрижки овец ${productPrice.product.name}" border="0" width="400" height="414"/></li>
                                    <li><img src="<%=request.getContextPath()%>/images/clippers/Liscop/2b.jpg" alt="Машинка для стрижки овец ${productPrice.product.name}" border="0" width="400" height="414"/></li>
                                    <li><img src="<%=request.getContextPath()%>/images/clippers/Liscop/3b.jpg" alt="Машинка для стрижки овец ${productPrice.product.name}" border="0" width="400" height="414"/></li>
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
                                <li>— мощность двигателя 430 Вт</li>
                                <li>— вес машинки 1,6 кг</li>
                                <li>— напряжение 220 В</li>
                                <li>— гарантия на машинку 12 месяцев</li>
                                <li>— частота тока 50 Гц</li>
                                <li>— уровень шума 75 Дб(а)</li>
                                <li>— длина шнура 5 м</li>
                                <li>— вибрация меньше 2,5 м/с<sup>2</sup></li>
                                <li>— размеры машинки <br/><span style="padding-left: 1.3em;">(Ш х В х Дл.) 80х120х340 мм</span></li>
                                <li>— диаметр рукоятки 55-62 мм</li>
                            </ul>
                            <div style="text-align: center; margin-top: 2em;">
                                <h1 style="margin-left: 0;">
                                    <c:choose>
                                        <c:when test="${productPrice.discount gt 0 and productPrice.discountDueDate.time ge now.time}">
                                            <span class="old-price-s">
                                                <fmt:formatNumber value="${productPrice.price}"/></span>
                                            <fmt:formatNumber value="${productPrice.price - productPrice.discount}"/> руб.
                                        </c:when>
                                        <c:otherwise>
                                            <fmt:formatNumber value="${productPrice.price}"/> руб.
                                        </c:otherwise>
                                    </c:choose>
                                </h1>
								<span style="color: red; font-weight: bold;">+ дополнительный нож в подарок</span>
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
                        <p style="margin-top: 6px;">Для стрижки большого количества овец за сезон (от 150 до 1000 голов) рекомендуем приобретать более мощные (430 Вт) машинки Liscop Super Profi 3000, изготовленные в Германии и имеющиеся у нас в наличии.</p>
						<p>Машинка работает от обычной розетки 220 В, имеет вес 1,6 кг и длину кабеля 5 м.
						Это очень удачная разработка известного немецкого производителя, стрижет хорошо, работает надежно. Мощный 430-ваттный мотор вращается со скоростью 3000 об/мин и с вполне приемлемым тихим жужжанием.</p>
						<p>Прижатие ножей с помощью прижимной гайки осуществляется очень плавно.</p> 
						<p>Вблизи стригущей головки корпус сужен и закрыт пластмассовыми накладками, чтобы машинку удобно было держать в руке.</p>
						<p>Улучшенная модель встроенного вентилятора работает менее шумно и лучше остужает мотор и головку машинки.</p>
						<p>С целью уменьшения веса инструмента был разработан новый пластиковый термостойкий, укрепленный стекловолокном корпус для мотора.
						В машинке установлен новый конденсатор, а к щеточному узлу подсоединены дополнительные индукционные катушки. Это позволило заметно увеличить коэффициент полезной мощности двигателя машинки до 99%.</p>
						<p>В целом, это симпатичная, плавно и довольно тихо работающая машинка, ею удобно пользоваться в полевых условиях.</p>
                    </li>
                    <li>
                        <h2>Комплектация</h2>
                        <ul class="sc-case-ul">
                            <li class="first">Машинка для стрижки овец</li>
                            <li>Комплект ножей (установлены на машинку)</li>
                            <li>Гаечный ключ</li>
                            <li>Флакон специального смазочного масла (60 мл)</li>
                            <li>Инструкция по применению</li>
                            <li>Футляр для транспортировки и хранения</li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <div class="sidebar">
            <div class="portlet">
                <h3>Файлы</h3>
                <div class="content description">
                    <ul class="ul-clean ul-li-mb-1em">
                        <li class="first"><a class="pdf" href="<%=request.getContextPath()%>/files/Liscop_manual_rus.pdf">Инструкция по применению</a></li>
                        <li><a class="pdf" href="<%=request.getContextPath()%>/files/Liscop_manual_eng.pdf">Инструкция по применению (англ.) с картинками</a></li>
                    </ul>
                </div>
            </div>
            <c:set var="ta"/>
            <div class="portlet">
                <h3><span>Запасные пары</span></h3>
                <div class="content description">
                    <ul class="vertical-d-ul">
                        <c:forEach var="dp" items="${dependantPrices}" varStatus="status">
                            <c:choose>
                                <c:when test="${dp.product.shortName ne 'ta-1'}">
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
                                                    <c:when test="${dp.discount gt 0}">
                                                        <span class="old-price-s" style="font-size: 10pt; color: #808080;">
                                                            <fmt:formatNumber value="${dp.price}"/></span>
                                                        <fmt:formatNumber value="${dp.price - dp.discount}"/> руб.
                                                    </c:when>
                                                    <c:otherwise>
                                                        <fmt:formatNumber value="${dp.price}"/> руб.
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
                            <c:otherwise><c:set var="ta" value="${dp}"/></c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <c:if test="${not empty ta}">
                <div class="portlet">
                    <h3>Заточка режущих пар</h3>
                    <div class="content description">
                        <ul class="vertical-d-ul">
                            <li class="first">
                                <a href="<%=request.getContextPath()%>/parts/${ta.product.shortName}">
                                    <p style="text-align: center; margin-bottom: 0;">
                                        <img src="<%=request.getContextPath()%>${ta.product.smallImagePath}"
                                             alt="${ta.product.name}" border="0" class="png" width="100" height="103"/>
                                    </p>
                                    <h4 class="name">${ta.product.name}</h4>
                                    <h4 class="price">
                                        <c:choose>
                                            <c:when test="${ta.discount gt 0}">
                                                <span class="old-price-s" style="font-size: 10pt; color: #808080;">
                                                    <fmt:formatNumber value="${ta.price}"/></span>
                                                <fmt:formatNumber value="${ta.price - ta.discount}"/> руб.
                                            </c:when>
                                            <c:otherwise>
                                                <fmt:formatNumber value="${ta.price}"/> руб.
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