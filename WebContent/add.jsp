<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
  <title>我的好友-添加好友</title>
  <link href="css/index.css" rel="stylesheet" type="text/css" />
  <link href="css/new.css" rel="stylesheet" type="text/css" />
  <script src="js/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
</head>

<body>
  <div id="contentbox">
    <form name="form1" method="post" action="addHY.jsp">
      <!--顶部-->
      <div id="top"> 
       <!--logo-->     
       <div id="logo">
        <img src="img/logo.png" width="300" height="57" />          
      </div>
      <!--logo end-->  
      <div id="addnewfriend"><a href="add.jsp">添加新好友</a></div>
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
            <td align="center"><input type="text" class="searchText" /></td>
            <td align="center"><img src="img/in_r12_c57_s1.jpg" alt="" width="55" height="24" />
            </td>
          </tr>
        </table>
      </div>
      <!--searchfriend-->
    </div>
    <!--顶部end-->
    <!--内容-->
    <div id="content">        
      <div class="divtitle"><b>&nbsp;添加新好友</b></div>   
      <div id="friendcontent">
        <div class="dqwz"><font>●</font>当前位置：首页 >>  添加新好友</div>
        <div class="detail_list"><span class="title"></span> </div>
        <div class="search1">
          <table width="100%" border="0" cellspacing="0" cellpadding="0" class="infowrite">
            <tr>
              <td width="22%" height="30" align="right" class="name">姓名：</td>
              <td width="45%"><input type="text" name="txt_name"/></td>
              <td width="33%">&nbsp;</td>
            </tr>
            <tr>
              <td height="30" align="right" class="name">英文名</td>
              <td><input type="text" name="txt_Ename"/></td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td height="30" align="right" class="name">性别：</td>
              <td><label>
                <select name="txt_sex" id="txt_sex">
                  <option selected="selected">男</option>
                  <option>女</option>
                </select>
              </label></td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td height="30" align="right" class="name">出生日期：</td>
              <td><input type="text" onfocus="WdatePicker({isShowClear:false,readOnly:true});" name="txt_sr"/></td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td height="30" align="right" class="name">友好度：</td>
              <td><label>
                <select name="txt_yhd" id="txt_yhd">
                  <option selected="selected">铁哥们</option>
                  <option>知己</option>
                  <option>闺密</option>
                  <option>一般</option>
                </select>
              </label></td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td height="30" align="right" class="name">电话：</td>
              <td><label>
                <input type="text" name="txt_tel" id="txt_tel" />
              </label></td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td height="30" align="right" class="name">QQ：</td>
              <td><label>
                <input type="text" name="txt_qq" id="txt_qq" />
              </label></td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td height="30" align="right" class="name">E_Mail：</td>
              <td><label>
                <input type="text" name="txt_email" id="txt_email" />
              </label></td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td height="30" align="right" class="name">地址：</td>
              <td><label>
                <input type="text" name="txt_address" id="txt_address" />
              </label></td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td height="30" align="right" class="name">备注：</td>
              <td><label>
                <input type="text" name="txt_notes" id="txt_notes" />
              </label></td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td height="30" align="right" class="name">头像：</td>
              <td><label>
                <select name="txt_headimg" id="txt_headimg">
                  <option selected="selected">1.jpg</option>
                  <option>2.jpg</option>
                  <option>3.jpg</option>
                  <option>4.jpg</option>
                </select>
              </label></td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td height="30" align="right" class="name">&nbsp;</td>
              <td><label>
                <input type="submit" name="add" id="add" value="提交" class="button1"/>
               &nbsp;&nbsp;&nbsp;<a href="index.jsp">取消返回</a>
              </label></td>
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

