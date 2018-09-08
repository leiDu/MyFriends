package friend.xml;

import org.jdom.*;
import org.jdom.input.*;
import org.jdom.output.*;
import org.jdom.xpath.*;
import java.io.*;
import java.util.ArrayList;
import java.util.List;
import friend.model.Friend;

/**
 * @ClassName:ParseFriendXml
 * @Description: TODO
 * @Auther:Lei Du
 * @Version:
 * @Date:Create in 2017年11月28日 上午9:39:57
 * @Modified By:
 */

public class ParseFriendXml {
	
	// 加载所有好友信息
	public List<Friend> loadFriend(String xmlfile) {
		// 创建用于存放好友的封装集合对象
		List<Friend> friends = new ArrayList<Friend>();
		// 定义一个好友对象
		Friend hyobject;
		// 开始解析XML，并封装到好友集合对象中
		try {
			// 建立JDOM解析器
			SAXBuilder sb = new SAXBuilder();
			// 构建document对象，读入xml的文件内容
			Document doc = sb.build(new FileInputStream(xmlfile));
			// 得到根元素
			Element root = doc.getRootElement();
			// 获取所有好友
			List hys = XPath.selectNodes(root, "//好友"); // 采用XPath技术
			// 循环所有好友
			Element hy;
			for (int i = 0, m = hys.size(); i < m; i++) {
				// 循环定位在每一个好友元素上
				hy = (Element) hys.get(i);
				// 创建（实例化）好友对象
				hyobject = new Friend();
				// 解析XML并将对应的数据封装到好友对象中
				hyobject.setID(hy.getAttributeValue("ID"));
				hyobject.setName(hy.getChildText("姓名"));
				hyobject.setEnglishName(hy.getChildText("英文名"));
				hyobject.setHeadName(hy.getChildText("头像"));
				hyobject.setSex(hy.getChildText("性别"));
				hyobject.setBirthday(hy.getChildText("出生日期"));
				hyobject.setFriendship(hy.getChildText("友好度"));
				hyobject.setTel(hy.getChild("联系方式").getChildText("电话"));
				hyobject.setQQ(hy.getChild("联系方式").getChildText("QQ"));
				hyobject.setEmail(hy.getChild("联系方式").getChildText("Email"));
				hyobject.setAddress(hy.getChildText("地址"));
				hyobject.setNotes(hy.getChildText("备注"));
				// 将好友对象添加到好友对象集合中
				friends.add(hyobject);
			}
		} catch (Exception e) {
		}
		return friends;
	}

	// 添加一个好友
	// xmlfile：要操作的XML的路径
	// friend：一个好友的封装对象
	public boolean addFriends(String xmlfile, Friend friend) {
		boolean results = false;
		try {
			// 判断XML文件是否存在
			File file = new File(xmlfile);
			if (file.exists()) {
				// 建立JDOM解析器
				SAXBuilder sab = new SAXBuilder();
				// 构建document对象，读入xml文件内容
				Document doc = sab.build(new FileInputStream(xmlfile));
				// 得到根元素
				Element root = doc.getRootElement();
				// 获得根元素的所有子元素集合
				List sub = root.getChildren();

				// 处理ID值
				String stringid = "1";
				// 测试根元素是否有子元素
				if (sub.size() != 0) {
					// 定位在最后一个好友元素上
					Element lasthy = (Element) XPath.selectSingleNode(root, "好友[last()]");
					// 获取最后一个好友的ID属性值
					stringid = lasthy.getAttributeValue("ID");
					int intid = Integer.parseInt(stringid); // 将得到的id值转换成数值型数据
					int id = intid + 1; // id的值加1
					stringid = Integer.toString(id); // 再将id转换成字符型数据
				}
				// 创建新好友并为该好友写入相应的数据
				Element newhy = new Element("好友");
				newhy.setAttribute("ID", stringid);
				newhy.addContent(new Element("姓名").addContent(friend.getName()));
				newhy.addContent(new Element("英文名").addContent(friend.getEnglishName()));
				newhy.addContent(new Element("头像").addContent(friend.getHeadName()));
				newhy.addContent(new Element("性别").addContent(friend.getSex()));
				newhy.addContent(new Element("出生日期").addContent(friend.getBirthday()));
				newhy.addContent(new Element("友好度").addContent(friend.getFriendship()));
				Element lxfs = new Element("联系方式");
				lxfs.addContent(new Element("电话").addContent(friend.getTel()));
				lxfs.addContent(new Element("QQ").addContent(friend.getQQ()));
				lxfs.addContent(new Element("E_Mail").addContent(friend.getEmail()));
				newhy.addContent(lxfs);
				newhy.addContent(new Element("地址").addContent(friend.getAddress()));
				newhy.addContent(new Element("备注").addContent(friend.getNotes()));
				root.addContent(newhy);

				// 设置文件输出格式d
				Format format = Format.getPrettyFormat();
				format.setIndent("  ");
				format.setEncoding("GB2312");
				// 将数据 保存到XML文档中
				XMLOutputter outputter = new XMLOutputter();
				outputter.setFormat(format); // 引用定义的输出格式
				outputter.output(doc, new FileOutputStream(xmlfile)); // 将数据写入到XML文档中
				results = true;
			} else {
				// 如果XML文档不存在
				Element hylb = new Element("好友列表");
				// 创建新好友并为该好友写入相应的数据
				Element newhy = new Element("好友");
				newhy.setAttribute("ID", "1");
				
				newhy.addContent(new Element("姓名").addContent(friend.getName()));
				newhy.addContent(new Element("英文名").addContent(friend.getEnglishName()));
				newhy.addContent(new Element("头像").addContent(friend.getHeadName()));
				newhy.addContent(new Element("性别").addContent(friend.getSex()));
				newhy.addContent(new Element("出生日期").addContent(friend.getBirthday()));
				newhy.addContent(new Element("友好度").addContent(friend.getFriendship()));
				Element lxfs = new Element("联系方式");
				lxfs.addContent(new Element("电话").addContent(friend.getTel()));
				lxfs.addContent(new Element("QQ").addContent(friend.getQQ()));
				lxfs.addContent(new Element("E_Mail").addContent(friend.getEmail()));
				newhy.addContent(lxfs);
				newhy.addContent(new Element("地址").addContent(friend.getAddress()));
				newhy.addContent(new Element("备注").addContent(friend.getNotes()));
				// 把新添加的好友添加到根元素的最后一个元素
				hylb.addContent(newhy);
				// 设定XML文档的输出模式
				Format format = Format.getPrettyFormat();
				format.setIndent("  ");
				format.setEncoding("GB2312"); // 设定输出的字符编码

				Document doc = new Document(hylb); // 以根元素建立文档
				XMLOutputter out = new XMLOutputter(); // 建立输出流
				out.setFormat(format); // 引用定义的输出格式
				out.output(doc, new FileOutputStream(xmlfile));
				results = true;
			}
		} catch (Exception e) {
			e.getMessage();
			results = false;
		}
		return results;
	}

	// 获取某一个好友的信息
	// xmlfile:xml文件的路径
	// id:某一个好友的编号
	public Friend loadOneFriend(String xmlfile, String id) {
		// 定义一个好友对象
		Friend hyobject = new Friend();
		// 开始解析XML,并封装到好友集合对象中
		try {
			// 建立JDOM解析器
			SAXBuilder sb = new SAXBuilder();
			// 构造Document对象,读入xml文件的内容
			Document doc = sb.build(new FileInputStream(xmlfile));
			// 得到根元素
			Element root = doc.getRootElement();
			// 定位到要修改的那个好友上
			Element edithy = (Element) XPath.selectSingleNode(root, "//好友[@ID='" + id + "']");
			// 解析XML并将对应的数据封装到好友对象中
			hyobject.setID(edithy.getAttributeValue("ID"));   //获取属性值
			hyobject.setName(edithy.getChildText("姓名"));     //获得子节点
			hyobject.setEnglishName(edithy.getChildText("英文名"));
			hyobject.setHeadName(edithy.getChildText("头像"));
			hyobject.setSex(edithy.getChildText("性别"));
			hyobject.setBirthday(edithy.getChildText("出生日期"));
			hyobject.setFriendship(edithy.getChildText("好感度"));
			hyobject.setTel(edithy.getChild("联系方式").getChildText("电话"));
			hyobject.setQQ(edithy.getChild("联系方式").getChildText("QQ"));
			hyobject.setEmail(edithy.getChild("联系方式").getChildText("E_Mail"));
			hyobject.setAddress(edithy.getChildText("地址"));
			hyobject.setNotes(edithy.getChildText("备注"));
		} catch (Exception e) {

		}
		return hyobject;
	}

	// 修改一个好友
	// xmlfile:要操作XML的路径
	// friend:一个好友的封装对象
	public boolean editFriend(String xmlfile, Friend friend) {
		boolean results = false;
		try {
			// 建立解析器
			SAXBuilder sb = new SAXBuilder();
			// 构造一个Document,读入xml文件的内容
			Document doc = sb.build(new FileInputStream(xmlfile));
			// 得到根元素
			Element root = doc.getRootElement();
			// 定位到要修改的好友元素
			Element edithy = (Element) XPath.selectSingleNode(root, "//好友[@ID='" + friend.getID() + "']");
			// 修改好友相应的数据
			edithy.getChild("姓名").setText(friend.getName());
			edithy.getChild("英文名").setText(friend.getEnglishName());
			edithy.getChild("头像").setText(friend.getHeadName());
			edithy.getChild("性别").setText(friend.getSex());
			edithy.getChild("出生日期").setText(friend.getBirthday());
			edithy.getChild("友好度").setText(friend.getFriendship());
			edithy.getChild("地址").setText(friend.getAddress());
			edithy.getChild("备注").setText(friend.getNotes());
			// 定位到联系方式元素上
			Element lxfs = edithy.getChild("联系方式");
			lxfs.getChild("电话").setText(friend.getTel());
			lxfs.getChild("QQ").setText(friend.getQQ());
			lxfs.getChild("E_Mail").setText(friend.getEmail());

			// 设置文件输出格式d
			Format format = Format.getCompactFormat();
			format.setIndent("  ");
			format.setEncoding("GB2312");
			// 将文件保存到XML文档中
			XMLOutputter outter = new XMLOutputter();
			outter.setFormat(format);    //我的错误：少写这句代码，出现文件输出格式不能对应
			outter.output(doc, new FileOutputStream(xmlfile));
			results = true;
		} catch (Exception e) {
			e.getMessage();
			results = false;
		}
		return results;
	}

	// 删除一个好友
	// xmlfile:要操作XML的路径
	// friend:一个好友的封装对象
	public boolean delFriend(String xmlfile, Friend friend) {
		boolean results = false;
		try {
			// 建立解析器
			SAXBuilder sb = new SAXBuilder();
			// 构造一个Document,读入xml文件的内容
			Document doc = sb.build(new FileInputStream(xmlfile));
			// 得到根元素
			Element root = doc.getRootElement();
			// 定位到要修改的好友元素
			Element edithy = (Element) XPath.selectSingleNode(root, "//好友[@ID='" + friend.getID() + "']");
			//删除定位的好友信息
			root.removeContent(edithy);

			// 设置文件输出格式d
			Format format = Format.getCompactFormat();
			format.setIndent("  ");
			format.setEncoding("GB2312");
			// 将文件保存到XML文档中
			XMLOutputter outter = new XMLOutputter();
			outter.setFormat(format);   //我的错误:少写这句代码，出现文件输出格式不能对应
			outter.output(doc, new FileOutputStream(xmlfile));
			results = true;
		} catch (Exception e) {
			e.getMessage();
			results = false;
		}
		return results;
	}
}
