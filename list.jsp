<%@page import="newsBoard.newsBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="newsBoard.newsDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
 body{
 	align:center;
 	text-align: center;
 }
</style>
    <%@include file="../top.jsp"%>   
    
     <%
     int pageSize = 10;
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    String pageNum = request.getParameter("pageNum");
    if(pageNum==null){
    	pageNum = "1";
    }
    int currentPage = Integer.parseInt(pageNum);
    int startRow = (currentPage-1) * pageSize +1;
    int endRow = currentPage * pageSize;
    int count = 0;
    int number =0;
    newsDao ndao = newsDao.getInstance();
    ArrayList<newsBean> lists = null;
    
    count = ndao.getCount(); 
    System.out.print(count);
    if(count>0){
    	lists = ndao.getArticle(startRow,endRow);   
    }
   number = count-(currentPage-1) * pageSize;
      
   String mid = (String)session.getAttribute("mid");
   if(mid==null){
	   mid ="";
   }
    %>
    <td colspan="2">
      <table border="1" width="700" valign="top">
    	<tr>
    		<%if (mid.equals("admin") ){ %>
    		<td align="right" bgcolor="lightblue"><a href="writeForm.jsp">글쓰기</a></td>
    		<%} else{ %>
    		<td align="center" bgcolor="lightblue"><a href="writeForm.jsp">News 목록</a></td>
    		<%} %>
    	</tr>
    </table>
    
    <%
    	if(count ==0){
    		
    %>
    <table border="1" width="700">
    	<tr>
    		<td align="center">게시판에 저장된 글이 없습니다</td>
    	</tr>
    </table>
    <%
    	}
    	else{
    	
    %>
     <table border="1" width="700" valign="top">
    	<tr bgcolor="lightblue" align="center">
    		<td>번호</td>
    		<td>제목</td>
    		<td>작성자</td>
    		<td>작성일</td>
    		<td>조회수</td>
    	</tr>
    	<%
    		for(int i=0;i<lists.size();i++){
    			newsBean article = lists.get(i);
    			%>
    			<tr>
    		<td><%= number-- %></td>  
    		<td>
    		<a href="content.jsp?no=<%=article.getNo()%>&pagenum=<%=currentPage%>"><%=article.getSubject() %></a>
		 	</td> 
    		<td align="center"><%= article.getWriter() %></td>
    		<td align="center"><%= article.getReg_date() %></td>
    		<td align="center"><%= article.getReadcount() %></td>
    		</tr>
    	<%} %>
    </table>
    
    <%} %>
  
    <%
    	if(count>0){
    		int pageCount = count/pageSize +(count%pageSize == 0? 0:1);  
    		int pageBlock = 10;     
    		
    		int startPage = ((currentPage-1)/ pageBlock*pageBlock)+1;   
    		int endPage = startPage + pageBlock-1;
    		
    		if(endPage>pageCount)
    			endPage = pageCount;     
    		if(startPage>10)	{	
    	
    %>
    			<a href ="list.jsp?pageNum=<%=startPage -10 %>">[이전]</a>
    <%
    		}
    		for(int i=startPage;i<=endPage;i++){
    			%>
    			<a href ="list.jsp?pageNum=<%=i%>">[<%=i %>]</a>
    			<%
    		}
    		if(endPage<pageCount){
    			%>
    			<a href ="list.jsp?pageNum=<%=startPage +10 %>">[다음]</a>
    			<% 
    		}
    }
    %>
    

    
    <%@include file="../bottom.jsp"%>