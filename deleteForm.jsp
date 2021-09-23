<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
      <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
	  <script type="text/javascript" src="<%=request.getContextPath() %>/checked.js"></script>

 <%
int no = Integer.parseInt(request.getParameter("no"));
int pageNum = Integer.parseInt(request.getParameter("pageNum"));

%>
<%@include file="../top.jsp"%>
 <td colspan="2" valign="top">
<form method="post" name="delForm" action="deleteProc.jsp">
	<table align="center" width="350">
	<tr>
		<input type="hidden" name="no" value="<%=no%>">
		<input type="hidden" name="pageNum" value="<%=pageNum %>">
		<td align="center" bgcolor="lightgreen"><b>비밀번호를 입력하세요</b></td>
	</tr>
	<tr>
		<td align="center" >
		비밀번호 : <input type="password" name="password" maxlength="12" size="4">
		</td>
	</tr>
	<tr>
		<td align="center" bgcolor="orange">
			<input type="submit" value="글삭제" onClick="return deleteSave()">	
			<input type="button" value="글목록" onclick="location.href ='list.jsp'">	
		</td>
	</tr>		
	</table>

</form>
<%@include file="../bottom.jsp"%>
