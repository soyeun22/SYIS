<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.util.*" %>
<%@ page import="syis.bms.config.Configuration"%>
<%@ page import="syis.bms.query.dao.mapper.QueryMapper" %>
<%@ page import="syis.bms.query.dao.QueryDao" %>
<%@ page import="syis.bms.query.dao.QueryDaoImpl" %>
<%@ page import="syis.bms.query.domain.Query" %>
<%@ page import="syis.bms.query.service.QueryService" %>
<%@ page import="syis.bms.query.service.QueryServiceImpl" %>
<%
QueryMapper queryMapper = Configuration.getMapper(QueryMapper.class);
QueryDao queryDao = new QueryDaoImpl(queryMapper);
QueryService queryService = new QueryServiceImpl(queryDao);


String title=request.getParameter("title");
String content=request.getParameter("content");
String separation=request.getParameter("separation");
String id=(String)session.getAttribute("login");

if(title!=null&&!title.equals("")&&content!=null&&!content.equals("")&&separation!=null&&!separation.equals("")){
Query query= new Query();
query.setContent(content);//
query.setTitle(title);//
query.setSeparation(separation);//
query.setUserId(id);//

queryService.addQuery(query);
request.setAttribute("id",id);
}

request.setAttribute("id",id);

%>
<jsp:forward page="queryList.jsp"/>
