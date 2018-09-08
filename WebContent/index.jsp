<%@page import="org.eclipse.jdt.internal.compiler.ast.ThisReference"%>
<%@ page language="java" import="java.util.*" pageEncoding="GBK"%><!--指定本页文字编码为GBK-->
<%
	request.setCharacterEncoding("GB2312");
%>
<!--   （1） 加载JDOM解析包及其它JAVA包 -->
<%@ page import="org.jdom.*" %>
<%@ page import="friend.model.Friend"%>
<%@ page import="friend.xml.ParseFriendXml"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>我的好友-主界面</title>
<link href="css/index.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div id="contentbox">
		<!--顶部-->
		<div id="top">
			<div id="logo">
				<img src="img/logo.png" width="300" height="57" />
			</div>
			<div id="addnewfriend">
				<a href="add.jsp">添加新好友</a>
			</div>
			<div id="searchfriend">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="11%" height="12"></td>
						<td width="70%"></td>
						<td width="19%"></td>
					</tr>
					<tr>
						<td height="28">&nbsp;</td>
						<td align="center"><input type="text" class="searchText" />
						</td>
						<td align="center"><img src="img/in_r12_c57_s1.jpg" alt=""
							width="55" height="24" />
						</td>
					</tr>
				</table>
			</div>
		</div>
		<!--顶部end-->
		<!--内容-->
		<div id="content">
			<div class="divtitle">
				<b>&nbsp;我的好友</b>
			</div>
			<div id="friendcontent">
				
				<!--好友列表-->
				<%
				    // 定义XML文档的路径
					String xmlfile = application.getRealPath("/")
							+ "XML_DATA\\friends.xml";

                    
                    //（2） 接下来调用loadFriend（）方法获取所有好友并显示的功能
                    List<Friend> flist = new ParseFriendXml().loadFriend(xmlfile);  //先获取好友信息，在调用该方法
                    //ParseFriendXml flist = new ParseFriendXml().loadFriend(xmlfile);  报错，从List<Friend>不能加载new Par...
                    Friend f = new Friend();
                    for(int i=0,m=flist.size();i<m;i++){
                    	f=flist.get(i);  //定义一个对象取得循环集合值，并通过集合值获得以下需要的属性值
                    
					
					
				%>
				<div class="friend" onmouseout="this.style.backgroundColor=''"
					onmouseover="this.style.backgroundColor='#ffffcc'">
					<table width="100" border="0" cellspacing="0" cellpadding="0"
						style="margin-top:8px;">
						<tr>
							<td height="52" align="center" valign="middle">
								<!-- （3）这里获取头像 --> 
								<img src="headimg/<%= f.getHeadName()%>" width="64" height="64" />
							</td>
						</tr>
						<tr>
							<td height="20" align="center">
							<span class="name"> 
							     <!-- （4）这里获取姓名 -->
									<%= f.getName()%> 
							</span>
							</td>
						</tr>
						<tr>
							<td align="center">
							<span class="sr"> 
							   <!--  （5）这里获取出生日期 -->
									<%= f.getBirthday() %> 
							</span>
							</td>
						</tr>
						<tr>
							<td align="center" class="hytext1">
								<!--  （6）这里获取好友的ID编号，以参数形式请求于修改和删除页面中 --> 
								<a href="edit.jsp?id=<%=f.getID()%>">修改</a>| 
								<a href="del.jsp?id=<%=f.getID()%>" onclick="return confirm('你确定要删除吗？')">删除</a></td>
						</tr>
					</table>
				</div>
				<%
                    }
					// 循环结束
				%>
				<!--好友列表end-->
			</div>
			<div id="page"></div>
		</div>
	</div>
</body>
</html>


<!-- confirm函数,显示显示给定的message信息，提供可选择的函数"ok"或"cancel",等待客户选择其中的一个，"ok"返回true,"concel"返回false -->