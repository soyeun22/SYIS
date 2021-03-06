<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="syis.bms.basket.service.BasketService"%>
<%@ page import="syis.bms.basket.service.BasketServiceImpl"%>
<%@ page import="syis.bms.config.Configuration"%>
<%@ page import="syis.bms.basket.dao.BasketDao"%>
<%@ page import="syis.bms.basket.dao.BasketDaoImpl"%>
<%@ page import="syis.bms.basket.dao.mapper.BasketMapper"%>
<%@ page import="syis.bms.basket.domain.Basket"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<%
String id = (String)session.getAttribute("login");
	if(id == null || id.equals("")) {
		response.sendRedirect("../../shop/login/login.jsp");
	}else {
%>
<%
	BasketMapper basketMapper = Configuration.getMapper(BasketMapper.class);
	BasketDao basketDao = new BasketDaoImpl(basketMapper);
	BasketService basketService = new BasketServiceImpl(basketDao);
	
	List<Basket> listBasket= basketService.listBaskets(id);
	request.setAttribute("listBasket", listBasket);
%>
 	<jsp:forward page="Basket.jsp"/>
 <%
 }
 %>