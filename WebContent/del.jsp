<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
	request.setCharacterEncoding("GB2312");
%>
<!-- 加载JAVA包 -->
<%@page import="friend.model.Friend"%>
<%@page import="friend.xml.ParseFriendXml"%>

<%
	boolean testOK = false;
	try {
		//获得要修改的好友的ID号,并封装到Friend对象中
		Friend objF = new Friend();
		objF.setID(request.getParameter("id"));
		//指定要写的XML文档路径
		String xmlfile = application.getRealPath("/")
				+ "XML_DATA\\friends.xml";

		// 进行添加好友操作
		ParseFriendXml opxml = new ParseFriendXml();
		testOK = opxml.delFriend(xmlfile, objF);

	} catch (Exception e) {
		testOK = false;
		System.err.println(e.getMessage());
		e.printStackTrace();
	}

	if (testOK) {
		out.print("<script>alert('OK!删除好友成功!');document.location='index.jsp';</script>");
	} else {
		out.print("<script>alert('Error!删除好友失败!');</script>");
	}
%>
