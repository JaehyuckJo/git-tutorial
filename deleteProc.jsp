<%@page import="newsBoard.newsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	
	String password=request.getParameter("password");
	
	System.out.println(no+","+password);
	newsDao ndao = newsDao.getInstance();  
	int cnt = ndao.deleteArticle(no,password);
	int pageSize=10;
	if(cnt>0){
		int recodecount = ndao.getCount();
	    int pageCount = recodecount/pageSize +(recodecount%pageSize == 0? 0:1);
	    if(pageCount<pageNum){
	    	response.sendRedirect("list.jsp?pageNum="+(pageNum-1));
	    }
	    else{
		response.sendRedirect("list.jsp?pageNum="+pageNum);
	    }
	}
	else{
	%>
	<script type="text/javascript">
	alert('비번일치안함');
	history.back();
	</script>
	<%
	}
%>