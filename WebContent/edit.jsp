<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
	request.setCharacterEncoding("GB2312");
%>
<!-- 加载JAVA包 -->
<%@ page import="friend.model.Friend"%>
<%@ page import="friend.xml.ParseFriendXml"%>

<%
	//获得要修改的好友的ID号
	String id = (String)request.getParameter("id");

	//指定要写的XML文档路径
	String xmlfile = application.getRealPath("/")
			+ "XML_DATA\\friends.xml";
			
	// （1）获取某一个好友的所有信息（以id作为编号）
			ParseFriendXml opxml = new ParseFriendXml();
	       Friend edithy = opxml.loadOneFriend(xmlfile,id);
		
		
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>我的好友-修改好友</title>
<link href="css/index.css" rel="stylesheet" type="text/css" />
<link href="css/new.css" rel="stylesheet" type="text/css" />
<script src="js/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
</head>

<body>
	<div id="contentbox">
		<form name="form1" method="post" action="editHY.jsp">
			<!--顶部-->
			<div id="top">
				<!--logo-->
				<div id="logo">
					<img src="img/logo.png" width="300" height="57" />
				</div>
				<!--logo end-->
				<div id="addnewfriend">
					<a href="add.jsp">添加新好友</a>
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
			<!--顶部end-->
			<!--内容-->
			<div id="content">
				<div class="divtitle">
					<b>&nbsp;修改好友</b>
				</div>
				<div id="friendcontent">
					<div class="dqwz">
						<font>●</font>当前位置：首页 >> 修改好友信息
					</div>
					<div class="detail_list">
						<span class="title"></span>
					</div>
					<!-- 以下开始，为显示修改前的旧信息  -->
					<div class="search1">
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							class="infowrite">
							<tr>
								<td width="22%" height="30" align="right" class="name">姓名：</td>
								<td width="45%">
								<!-- （2）显示姓名的值 -->
								<input type="text" name="txt_name"
									value='<%= edithy.getName()       %>' />
								</td>
								<td width="33%">
									<!-- （3） 注意：这里要隐藏提交ID编号（不然不知道是对哪个好友进行修改） --> 
									<input type="hidden"
									name="editid" value='<%= edithy.getID()   %>' />
								</td>
							</tr>
							<tr>
								<td height="30" align="right" class="name">英文名</td>
								<td>
								<!-- （4）显示英文名值 -->
								<input type="text" name="txt_Ename"
									value='<%=  edithy.getEnglishName()         %>' />
								</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td height="30" align="right" class="name">性别：</td>
								<td><label> 
								<!-- （5）显示性别的值 -->
								<select name="txt_sex" id="txt_sex"
										value='<%=    edithy.getSex()       %>'>
											<option selected="selected">男</option>
											<option>女</option>
									</select> </label>
								</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td height="30" align="right" class="name">出生日期：</td>
								<td>
								<!-- （6）显示出生日期的值 --><input type="text"
									value='<%=  edithy.getBirthday()       %>'
									onfocus="WdatePicker({isShowClear:false,readOnly:true});"
									name="txt_sr" />
								</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td height="30" align="right" class="name">友好度：</td>
								<td><label> 
								<!--（7） 显示友好度的值 -->
								<select name="txt_yhd" id="txt_yhd"
										value='<%=edithy.getFriendship()%>'>
											<option selected="selected">铁哥们</option>
											<option>知己</option>
											<option>闺密</option>
											<option>一般</option>
									</select> </label>
								</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td height="30" align="right" class="name">手机：</td>
								<td><label> 
								<!-- （8） 显示电话的值 --><input type="text" name="txt_tel"
										id="txt_tel"
										value='<%=   edithy.getTel()        %>' /> </label>
								</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td height="30" align="right" class="name">QQ：</td>
								<td><label> 
								<!-- （9）显示QQ的值 -->
								<input type="text" name="txt_qq"
										id="txt_qq"
										value='<%=    edithy.getQQ()         %>' /> </label>
								</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td height="30" align="right" class="name">E_Mail：</td>
								<td><label> 
								<!-- （10）显示email值 -->
								<input type="text" name="txt_email"
										id="txt_email"
										value='<%=    edithy.getEmail()         %>' />
								</label>
								</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td height="30" align="right" class="name">地址：</td>
								<td><label> 
								<!-- （11）显示地址的值 -->
								<input type="text" name="txt_address"
										id="txt_address" value='<%=  edithy.getAddress()      %>' /> </label>
								</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td height="30" align="right" class="name">备注：</td>
								<td><label>
								<!-- （12）显示备注的值 --> 
								<input type="text" name="txt_notes"
										id="txt_notes" value='<%=  edithy.getNotes()%>' /> </label>
								</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td height="30" align="right" class="name">头像：</td>
								<td><label> 
								<!-- （13）显示头像的值 -->
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
										id="add" value="提交" class="button1" /> &nbsp;&nbsp;&nbsp;<a
										href="index.jsp">取消返回</a> </label>
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
