<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
	request.setCharacterEncoding("GB2312");
%>
<!-- ����JAVA�� -->
<%@page import="friend.model.Friend"%>
<%@page import="friend.xml.ParseFriendXml"%>

<%
	boolean testOK = false;
	try {
		//���Ҫ�޸ĵĺ��ѵ�ID��,����װ��Friend������
		Friend objF = new Friend();
		objF.setID(request.getParameter("id"));
		//ָ��Ҫд��XML�ĵ�·��
		String xmlfile = application.getRealPath("/")
				+ "XML_DATA\\friends.xml";

		// ������Ӻ��Ѳ���
		ParseFriendXml opxml = new ParseFriendXml();
		testOK = opxml.delFriend(xmlfile, objF);

	} catch (Exception e) {
		testOK = false;
		System.err.println(e.getMessage());
		e.printStackTrace();
	}

	if (testOK) {
		out.print("<script>alert('OK!ɾ�����ѳɹ�!');document.location='index.jsp';</script>");
	} else {
		out.print("<script>alert('Error!ɾ������ʧ��!');</script>");
	}
%>
