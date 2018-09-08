<%@page import="java.io.FileOutputStream"%>
<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
	request.setCharacterEncoding("GB2312");
%>
<!-- 加载JAVA包 -->
<%@page import="friend.model.Friend"%>
<%@page import="friend.xml.ParseFriendXml"%>


<%
    // 用于判断执行结果
	boolean testOK = false;
	
	try {
		//（1）获得新好友的信息,并封装在Friend对象中
		Friend friend = new Friend();
		//friend.setID(request.getParameter("id"));
		friend.setName(request.getParameter("txt_name"));
		friend.setEnglishName(request.getParameter("txt_Ename"));
		friend.setHeadName(request.getParameter("txt_headimg"));
		friend.setSex(request.getParameter("txt_sex"));
		friend.setBirthday(request.getParameter("txt_sr"));
		friend.setFriendship(request.getParameter("txt_yhd"));
		friend.setTel(request.getParameter("txt_tel"));
		friend.setQQ(request.getParameter("txt_qq"));
		friend.setEmail(request.getParameter("txt_email"));
		friend.setAddress(request.getParameter("txt_address"));
		friend.setNotes(request.getParameter("txt_notes"));
		//指定要写的XML文档路径
		String xmlfile = application.getRealPath("/")
				+ "XML_DATA\\friends.xml";

        // （2）进行添加好友操作
		ParseFriendXml opxml = new ParseFriendXml();
		testOK = opxml.addFriends(xmlfile,friend);

		
	} catch (Exception e) {
		testOK = false;         
		System.err.println(e.getMessage());
		e.printStackTrace();
	}

    // 判断添加结果
	if (testOK) {
		out.print("<script>alert('OK!添加新好友成功!');document.location='index.jsp';</script>");
	} else {
		out.print("<script>alert('Error!添加新好友失败!');</script>");
	}
%>




