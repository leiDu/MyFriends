<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
	request.setCharacterEncoding("GB2312");
%>
<!-- ����JAVA�� -->
<%@ page import="friend.model.Friend"%>
<%@ page import="friend.xml.ParseFriendXml"%>

<%
	//���Ҫ�޸ĵĺ��ѵ�ID��
	String id = (String)request.getParameter("id");

	//ָ��Ҫд��XML�ĵ�·��
	String xmlfile = application.getRealPath("/")
			+ "XML_DATA\\friends.xml";
			
	// ��1����ȡĳһ�����ѵ�������Ϣ����id��Ϊ��ţ�
			ParseFriendXml opxml = new ParseFriendXml();
	       Friend edithy = opxml.loadOneFriend(xmlfile,id);
		
		
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>�ҵĺ���-�޸ĺ���</title>
<link href="css/index.css" rel="stylesheet" type="text/css" />
<link href="css/new.css" rel="stylesheet" type="text/css" />
<script src="js/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
</head>

<body>
	<div id="contentbox">
		<form name="form1" method="post" action="editHY.jsp">
			<!--����-->
			<div id="top">
				<!--logo-->
				<div id="logo">
					<img src="img/logo.png" width="300" height="57" />
				</div>
				<!--logo end-->
				<div id="addnewfriend">
					<a href="add.jsp">����º���</a>
				</div>
				<!--searchfriend-->
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
								width="55" height="24" /></td>
						</tr>
					</table>
				</div>
				<!--searchfriend-->
			</div>
			<!--����end-->
			<!--����-->
			<div id="content">
				<div class="divtitle">
					<b>&nbsp;�޸ĺ���</b>
				</div>
				<div id="friendcontent">
					<div class="dqwz">
						<font>��</font>��ǰλ�ã���ҳ >> �޸ĺ�����Ϣ
					</div>
					<div class="detail_list">
						<span class="title"></span>
					</div>
					<!-- ���¿�ʼ��Ϊ��ʾ�޸�ǰ�ľ���Ϣ  -->
					<div class="search1">
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							class="infowrite">
							<tr>
								<td width="22%" height="30" align="right" class="name">������</td>
								<td width="45%">
								<!-- ��2����ʾ������ֵ -->
								<input type="text" name="txt_name"
									value='<%= edithy.getName()       %>' />
								</td>
								<td width="33%">
									<!-- ��3�� ע�⣺����Ҫ�����ύID��ţ���Ȼ��֪���Ƕ��ĸ����ѽ����޸ģ� --> 
									<input type="hidden"
									name="editid" value='<%= edithy.getID()   %>' />
								</td>
							</tr>
							<tr>
								<td height="30" align="right" class="name">Ӣ����</td>
								<td>
								<!-- ��4����ʾӢ����ֵ -->
								<input type="text" name="txt_Ename"
									value='<%=  edithy.getEnglishName()         %>' />
								</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td height="30" align="right" class="name">�Ա�</td>
								<td><label> 
								<!-- ��5����ʾ�Ա��ֵ -->
								<select name="txt_sex" id="txt_sex"
										value='<%=    edithy.getSex()       %>'>
											<option selected="selected">��</option>
											<option>Ů</option>
									</select> </label>
								</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td height="30" align="right" class="name">�������ڣ�</td>
								<td>
								<!-- ��6����ʾ�������ڵ�ֵ --><input type="text"
									value='<%=  edithy.getBirthday()       %>'
									onfocus="WdatePicker({isShowClear:false,readOnly:true});"
									name="txt_sr" />
								</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td height="30" align="right" class="name">�Ѻöȣ�</td>
								<td><label> 
								<!--��7�� ��ʾ�Ѻöȵ�ֵ -->
								<select name="txt_yhd" id="txt_yhd"
										value='<%=edithy.getFriendship()%>'>
											<option selected="selected">������</option>
											<option>֪��</option>
											<option>����</option>
											<option>һ��</option>
									</select> </label>
								</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td height="30" align="right" class="name">�ֻ���</td>
								<td><label> 
								<!-- ��8�� ��ʾ�绰��ֵ --><input type="text" name="txt_tel"
										id="txt_tel"
										value='<%=   edithy.getTel()        %>' /> </label>
								</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td height="30" align="right" class="name">QQ��</td>
								<td><label> 
								<!-- ��9����ʾQQ��ֵ -->
								<input type="text" name="txt_qq"
										id="txt_qq"
										value='<%=    edithy.getQQ()         %>' /> </label>
								</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td height="30" align="right" class="name">E_Mail��</td>
								<td><label> 
								<!-- ��10����ʾemailֵ -->
								<input type="text" name="txt_email"
										id="txt_email"
										value='<%=    edithy.getEmail()         %>' />
								</label>
								</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td height="30" align="right" class="name">��ַ��</td>
								<td><label> 
								<!-- ��11����ʾ��ַ��ֵ -->
								<input type="text" name="txt_address"
										id="txt_address" value='<%=  edithy.getAddress()      %>' /> </label>
								</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td height="30" align="right" class="name">��ע��</td>
								<td><label>
								<!-- ��12����ʾ��ע��ֵ --> 
								<input type="text" name="txt_notes"
										id="txt_notes" value='<%=  edithy.getNotes()%>' /> </label>
								</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td height="30" align="right" class="name">ͷ��</td>
								<td><label> 
								<!-- ��13����ʾͷ���ֵ -->
								<select name="txt_headimg"
										id="txt_headimg" value='<%=edithy.getHeadName() %>'>
											<option selected="selected">1.jpg</option>
											<option>2.jpg</option>
											<option>3.jpg</option>
											<option>4.jpg</option>
									</select> </label>
								</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td height="30" align="right" class="name">&nbsp;</td>
								<td><label> <input type="submit" name="add"
										id="add" value="�ύ" class="button1" /> &nbsp;&nbsp;&nbsp;<a
										href="index.jsp">ȡ������</a> </label>
								</td>
								<td>&nbsp;</td>
							</tr>
						</table>

					</div>
				</div>

			</div>
		</form>
	</div>
</body>
</html>
