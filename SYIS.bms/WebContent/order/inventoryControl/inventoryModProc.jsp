<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="syis.bms.bookmanagement.service.BookService"%>
<%@ page import="syis.bms.bookmanagement.service.BookServiceImpl"%>
<%@ page import="syis.bms.config.Configuration"%>
<%@ page import="syis.bms.bookmanagement.dao.BookDao"%>
<%@ page import="syis.bms.bookmanagement.dao.BookDaoImpl"%>
<%@ page import="syis.bms.bookmanagement.dao.mapper.BookMapper"%>
<%@ page import="syis.bms.bookmanagement.domain.Book"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<%
	BookMapper bookMapper = Configuration.getMapper(BookMapper.class);
	BookDao bookDao = new BookDaoImpl(bookMapper);
	BookService bookService = new BookServiceImpl(bookDao);
	
	int inventory = Integer.parseInt(request.getParameter("inventory"));
	String bookCode = request.getParameter("bookCode");
	Book modBook = bookService.findBook(bookCode);
	modBook.setInventory(inventory);
	bookService.modifyBook(modBook);
%>
	<jsp:include page="bookList.jsp"/>
	