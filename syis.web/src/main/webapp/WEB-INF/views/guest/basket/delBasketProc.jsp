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
	BasketMapper basketMapper = Configuration.getMapper(BasketMapper.class);
	BasketDao basketDao = new BasketDaoImpl(basketMapper);
	BasketService basketService = new BasketServiceImpl(basketDao);
	
	String id = (String)session.getAttribute("login");
	
	
	
	String[] basketNums = request.getParameterValues("basketNum");
	if(basketNums != null) {
		for(String basketNum : basketNums) {
			int delnum = Integer.parseInt(basketNum);
			basketService.deleteBasket(delnum);
		}
	}else if(request.getParameter("basketNum")!=null) {
		int delnum = Integer.parseInt(request.getParameter("basketNum"));
			basketService.deleteBasket(delnum);
	}else {
%>
		<jsp:forward page="BasketProc.jsp?del=1"/>
<%
	}
%>
 	<jsp:include page="BasketProc.jsp"/>
