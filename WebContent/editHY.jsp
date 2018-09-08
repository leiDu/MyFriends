<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
	request.setCharacterEncoding("GB2312");
%>
<!-- 加载JAVA包 -->
<%@page import="friend.model.Friend"%>
<%@page import="friend.xml.ParseFriendXml"%>
<%
	boolean testOK = false;
	String stringid = "";
	try {

		// （14）获得新好友的信息,并封装在Friend对象中
		Friend friend = new Friend();
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

		
		// 获取提交过来的ID编号
		friend.setID(request.getParameter("editid"));

		//指定要写的XML文档路径
		String xmlfile = application.getRealPath("/")
				+ "XML_DATA\\friends.xml";
		// 进行修改好友操作
		ParseFriendXml opxml = new ParseFriendXml();
		testOK = opxml.editFriend(xmlfile, friend);

	} catch (Exception e) {
		testOK = false;
		System.err.println(e.getMessage());
		e.printStackTrace();
	}

    // 结果修改结果进行不同的显示
	if (testOK) {
		out.print("<script>alert('OK!修改好友成功!');document.location='index.jsp';</script>");
	} else {
		out.print("<script>alert('Error!修改好友失败!');</script>");
	}
%>




