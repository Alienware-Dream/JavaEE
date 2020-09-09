<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<style type="text/css">
		span {
			color:red; 
		}
	
	</style>
	<script type="text/javascript">
		function getXhr() {
		   var xhr=new XMLHttpRequest();
			//alert(xhr);
			return xhr;
		
		}
		function checkUsername() {
			//获取用户输入的名
			var username = document.getElementById("username").value;
			//发送异步请求进行校验
			var xhr = getXhr();
			//设置请求信息
			xhr.open("get","checkUsername?username="+username,true);
			//发送请求
			xhr.send();
			//监听readyState的状态
			xhr.onreadystatechange=funcation(){ //匿名函数
				if(xhr.readystate == 4){  //响应处理完成
					if(xhr.status==200){ //处理正确
						//获取服务端响应回来的数据
						var msg = xhr.responseText;
						//将信息显示导用户名输入框后面
						document.getElementById("regist_span").innerHTML=msg;
						
					}
				}
				
			}
			
		}
	
	
	</script>
	<!-- 引入js -->
	<script type="text/javascript" src="scripts/jquery-1.7.2.min.js">
			$(function () {
				$("username").blur(function() {
					var username = $("#username").val();
					//发送异步请求
					$.ajax({
						url:"checkUsername",
						type:"post",
						data:"username"+username,
						success:function(data){ //会将服务器返回的数据保存到data中
							$("#resgist_span").html(data);
						}	
					});
				});
			});
	
	</script>
		

	
	
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="pink">
	<h1>欢迎注册</h1>
	<form action="regist" method="post">
		<%-- 用户名称:<input type="text" id="username" name="username" onblur="checkUsername();"/><span id="regist_span">${regist_msg }</span><br/> --%>
		用户名称:<input type="text" id="username" name="username" /><span id="regist_span">${regist_msg }</span><br/>
		用户密码:<input type="password" name="password"/><br/>
		确认密码:<input type="password" name="password"/><br/>
			   <input type="submit"  value="注册">
	</form>
	
	<input type="button" value="测试Xhr对象" onclick="getXhr();"/>
		
</body> 
</html>