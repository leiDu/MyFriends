<%@page import="org.eclipse.jdt.internal.compiler.ast.ThisReference"%>
<%@ page language="java" import="java.util.*" pageEncoding="GBK"%><!--ָ����ҳ���ֱ���ΪGBK-->
<%
	request.setCharacterEncoding("GB2312");
%>
<!--   ��1�� ����JDOM������������JAVA�� -->
<%@ page import="org.jdom.*" %>
<%@ page import="friend.model.Friend"%>
<%@ page import="friend.xml.ParseFriendXml"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>�ҵĺ���-������</title>
<link href="css/index.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div id="contentbox">
		<!--����-->
		<div id="top">
			<div id="logo">
				<img src="img/logo.png" width="300" height="57" />
			</div>
			<div id="addnewfriend">
				<a href="add.jsp">����º���</a>
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
		<!--����end-->
		<!--����-->
		<div id="content">
			<div class="divtitle">
				<b>&nbsp;�ҵĺ���</b>
			</div>
			<div id="friendcontent">
				
				<!--�����б�-->
				<%
				    // ����XML�ĵ���·��
					String xmlfile = application.getRealPath("/")
							+ "XML_DATA\\friends.xml";

                    
                    //��2�� ����������loadFriend����������ȡ���к��Ѳ���ʾ�Ĺ���
                    List<Friend> flist = new ParseFriendXml().loadFriend(xmlfile);  //�Ȼ�ȡ������Ϣ���ڵ��ø÷���
                    //ParseFriendXml flist = new ParseFriendXml().loadFriend(xmlfile);  ������List<Friend>���ܼ���new Par...
                    Friend f = new Friend();
                    for(int i=0,m=flist.size();i<m;i++){
                    	f=flist.get(i);  //����һ������ȡ��ѭ������ֵ����ͨ������ֵ���������Ҫ������ֵ
                    
					
					
				%>
				<div class="friend" onmouseout="this.style.backgroundColor=''"
					onmouseover="this.style.backgroundColor='#ffffcc'">
					<table width="100" border="0" cellspacing="0" cellpadding="0"
						style="margin-top:8px;">
						<tr>
							<td height="52" align="center" valign="middle">
								<!-- ��3�������ȡͷ�� --> 
								<img src="headimg/<%= f.getHeadName()%>" width="64" height="64" />
							</td>
						</tr>
						<tr>
							<td height="20" align="center">
							<span class="name"> 
							     <!-- ��4�������ȡ���� -->
									<%= f.getName()%> 
							</span>
							</td>
						</tr>
						<tr>
							<td align="center">
							<span class="sr"> 
							   <!--  ��5�������ȡ�������� -->
									<%= f.getBirthday() %> 
							</span>
							</td>
						</tr>
						<tr>
							<td align="center" class="hytext1">
								<!--  ��6�������ȡ���ѵ�ID��ţ��Բ�����ʽ�������޸ĺ�ɾ��ҳ���� --> 
								<a href="edit.jsp?id=<%=f.getID()%>">�޸�</a>| 
								<a href="del.jsp?id=<%=f.getID()%>" onclick="return confirm('��ȷ��Ҫɾ����')">ɾ��</a></td>
						</tr>
					</table>
				</div>
				<%
                    }
					// ѭ������
				%>
				<!--�����б�end-->
			</div>
			<div id="page"></div>
		</div>
	</div>
</body>
</html>


<!-- confirm����,��ʾ��ʾ������message��Ϣ���ṩ��ѡ��ĺ���"ok"��"cancel",�ȴ��ͻ�ѡ�����е�һ����"ok"����true,"concel"����false -->