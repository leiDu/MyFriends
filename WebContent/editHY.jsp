<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
	request.setCharacterEncoding("GB2312");
%>
<!-- ����JAVA�� -->
<%@page import="friend.model.Friend"%>
<%@page import="friend.xml.ParseFriendXml"%>
<%
	boolean testOK = false;
	String stringid = "";
	try {

		// ��14������º��ѵ���Ϣ,����װ��Friend������
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

		
		// ��ȡ�ύ������ID���
		friend.setID(request.getParameter("editid"));

		//ָ��Ҫд��XML�ĵ�·��
		String xmlfile = application.getRealPath("/")
				+ "XML_DATA\\friends.xml";
		// �����޸ĺ��Ѳ���
		ParseFriendXml opxml = new ParseFriendXml();
		testOK = opxml.editFriend(xmlfile, friend);

	} catch (Exception e) {
		testOK = false;
		System.err.println(e.getMessage());
		e.printStackTrace();
	}

    // ����޸Ľ�����в�ͬ����ʾ
	if (testOK) {
		out.print("<script>alert('OK!�޸ĺ��ѳɹ�!');document.location='index.jsp';</script>");
	} else {
		out.print("<script>alert('Error!�޸ĺ���ʧ��!');</script>");
	}
%>




