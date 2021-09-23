<%@page import="java.text.DecimalFormat"%>
<%@page import="shop.shopprodBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

     <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/checked.js"></script>
        <jsp:useBean id="mallcart" class="shop.cartBean" scope="session"/>
        
        <%
        String oqty = request.getParameter("oqty");
        ArrayList<shopprodBean> cAllList = mallcart.getAllProduct(); 
        int cartTotalPrice =0;
        int cartTotalPoint =0;
        DecimalFormat df = new DecimalFormat("###,###");
        %>
        
        <%@include file="../top.jsp"%>
			<td colspan=2>
		<h3 align="center">장바구니</h3>
		<br><br>
		<table border="1" align="center" width="100%">
		 <tr class="m1">
    			<th width="10%">번호</th>
    			<th width="20%">상품명</th>
    			<th width="20%">수량</th>
    			<th width="20%">단가</th>
    			<th width="20%">금액</th>
    			<th width="10%">삭제</th>
    		</tr>
    		<%
    		   if(cAllList.size()==0){
    		%>
    		<tr>
    			<td colspan="6" align="center">장부구니에 담은 상품이 없습니다.</td>
    		</tr>
    		<%}else{
    			for(shopprodBean pd : cAllList){
    				String pimage = pd.getPimage();
    				String imgPath = request.getContextPath()+"/shopimg/"+pimage;
    			%>
    			<tr>
    				<td algin="center"><%=pd.getPnum()%></td>
    				<td>
    					<img src="<%=imgPath %>" width="40" height="40"><br>
    					<b><%=pd.getPname()%></b>
    				</td>
    				<td algin="center">
    				<form action="cartEdit.jsp" method ="post" onsubmit="return chk_cart()">
    				
    				
    					<input type="text" name="oqty" value="<%=pd.getPqty()%>" size="2">개
    					<input type="hidden" name="pnum" value="<%=pd.getPnum() %>">
    					<input type="submit" value="수정"></form></td>
    				<td align="right"><%=pd.getPrice()%> <br>
    					[<%=pd.getPoint()%>]point<br>
    				</td>
    				<td align="right"><%=df.format(pd.getTotalprice()) %> <br>
    					[<%=df.format(pd.getTotalpoint()) %>]point<br>
    				</td>
    				<td><a href="cartDelete.jsp?pnum=<%=pd.getPnum()%>">삭제</a></td>
    				
    			</tr>	
    		<%
    		 cartTotalPrice += pd.getTotalprice();
    		 cartTotalPoint +=  pd.getTotalpoint();
    		}
    		
    		%>
    			<tr>
    				<td colspan="4">
    					장바구니 총액 :<%=cartTotalPrice %> <br>
    					총 적립 포인트 : <%=cartTotalPoint %> 
    					</td>
    			   <td colspan="2"><a href="order.jsp">[주문하기]</a> <a href="list.jsp">[계속 쇼핑]</a></td>	
    			</tr>
    	
   <%} %>
    		
		 </table>
		 </td>
		 <%@include file="../bottom.jsp"%>