<%@page import="java.io.FileOutputStream"%>
<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
	request.setCharacterEncoding("GB2312");
%>
<!-- ����JAVA�� -->
<%@page import="friend.model.Friend"%>
<%@page import="friend.xml.ParseFriendXml"%>


<%
    // �����ж�ִ�н��
	boolean testOK = false;
	
	try {
		//��1������º��ѵ���Ϣ,����װ��Friend������
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
		//ָ��Ҫд��XML�ĵ�·��
		String xmlfile = application.getRealPath("/")
				+ "XML_DATA\\friends.xml";

        // ��2��������Ӻ��Ѳ���
		ParseFriendXml opxml = new ParseFriendXml();
		testOK = opxml.addFriends(xmlfile,friend);

		
	} catch (Exception e) {
		testOK = false;         
		System.err.println(e.getMessage());
		e.printStackTrace();
	}

    // �ж���ӽ��
	if (testOK) {
		out.print("<script>alert('OK!����º��ѳɹ�!');document.location='index.jsp';</script>");
	} else {
		out.print("<script>alert('Error!����º���ʧ��!');</script>");
	}
%>




