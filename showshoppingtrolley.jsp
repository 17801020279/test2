<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>购物车</title>
</head>
<body>
<script type="text/javascript">
//全选
function checkAll(){
      var flag=document.getElementById("All").checked;
      var ids=document.getElementsByName("ids");
      for(var i=0;i<ids.length;i++){
         ids[i].checked=flag;
      }
      
}
//添加
function insertOrder(){
	
      var ids = document.getElementsByName("ids");
      //getElementsByName()里Elements 是复数,返回的是一组名字都为 ids的对象
      //所以是个数组,要通过下标（索引）进行访问.
      var str="";
      var strAmount="";
      var strAmountArr=new Array();//创建数组
      var strArr = new Array()//创建数组
      for(var i=0; i<ids.length; i++){
         if(ids[ i ].checked)
         {
        	 if(i==ids.length-1)//如果检测到的是最后一个元素
        	 {
        		 str+="id"+i+"="+ids[ i ].value
        	 }
        	 else//如果检测到的不是最后一个元素
        	 {
        		 str+="id"+i+"="+ids[ i ].value+"&"
             }
         }
         strArr[ i ]=ids[ i ].value
      }
      var i = 0
      // "amount"+i+"="+
      <c:forEach var="shoppingtrolley" items="${shoppingTrolleyList}"  varStatus="status">
    	     strAmount +="amount"+i+"="+"${shoppingtrolley.amount}"+"&"
    	     strAmountArr[i] = "${shoppingtrolley.amount}"
    	     i++
    	     
   	  </c:forEach>
    	    strAmount =strAmount.substring(0,strAmount.length-1);//提取字符串中介于两个指定下标之间的字符
      alert(strArr)
      alert(strAmountArr)
    	     
     //js 往 servlet里传数组
     window.location.href="insertOrder.action?strIdArr="+strArr+"&strAmountArr="+strAmountArr;
     
}

    function delcfm() {
	        if (!confirm("确认要删除？")) {
	            window.event.returnValue = false;
	        }
	    }
   </script>
</script>
<table> <tr><h1>我的购物车</h1>
   <div style="float:right"><a href="/shopping/showShoppingTrolley.action">我的购物车</a> >> <a href="/shopping/showOrder.action">个人订单</a>   >> 欢迎<font color="red" size="5"><%=session.getAttribute("username")%></font>登录</div>
     </tr>
     <tr><a href="/shopping/showBook.action">图书</a> >> <a href="/shopping/showFood.action">食品</a>   
     </tr>
    </table>
<hr>
<center>
<div id="shopping">
<form action="insertOrder.action" method="POST">		
<table   width="916" height="109" align="center">
                 <tr>
                 <th><input type="checkbox" id="All" onclick="checkAll()"/>全选</th>
                 <th>序号</th>
                 <th>商品名称</th>
                 <th>商品图片</th>
                 <th>单价</th>
                 <th>数量</th>
                 <th>金额</th>
                 <th>操作</th>
                 </tr>
                  
               <c:forEach var="shoppingtrolley" items="${shoppingTrolleyList}"  varStatus="status">
                  <tr align="center">
                  <td><input type="checkbox" name="ids" id="ids" value="${shoppingtrolley.id }"/></td>
                  <td>${status.index + 1}</td>
                  <td>${shoppingtrolley.name}</td>
                  <td><a href="/shopping/showDetail.action?id=${shoppingtrolley.id}"><img alt="" src="images/${shoppingtrolley.picture}" width="100" height="100"/></a></td>
                  <td>${shoppingtrolley.price}</td>
                  <td>${shoppingtrolley.amount}</td>
                  <td>${shoppingtrolley.total}元</td>
                  <td>
                  <a href="/shopping/delShoppingTrolley.action?id=${shoppingtrolley.id}" onclick="delcfm();">删除</a></td>
                  </tr>
                </c:forEach>
</table>
<br>
<div  class="total"><span id="total">总计：${total}元</span></div><br>
<button type="button "onclick="insertOrder()">结算</button>
</form>
</div>
</center>
</body>
  
</html>