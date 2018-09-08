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
 * @Date:Create in 2017��11��28�� ����9:39:57
 * @Modified By:
 */

public class ParseFriendXml {
	
	// �������к�����Ϣ
	public List<Friend> loadFriend(String xmlfile) {
		// �������ڴ�ź��ѵķ�װ���϶���
		List<Friend> friends = new ArrayList<Friend>();
		// ����һ�����Ѷ���
		Friend hyobject;
		// ��ʼ����XML������װ�����Ѽ��϶�����
		try {
			// ����JDOM������
			SAXBuilder sb = new SAXBuilder();
			// ����document���󣬶���xml���ļ�����
			Document doc = sb.build(new FileInputStream(xmlfile));
			// �õ���Ԫ��
			Element root = doc.getRootElement();
			// ��ȡ���к���
			List hys = XPath.selectNodes(root, "//����"); // ����XPath����
			// ѭ�����к���
			Element hy;
			for (int i = 0, m = hys.size(); i < m; i++) {
				// ѭ����λ��ÿһ������Ԫ����
				hy = (Element) hys.get(i);
				// ������ʵ���������Ѷ���
				hyobject = new Friend();
				// ����XML������Ӧ�����ݷ�װ�����Ѷ�����
				hyobject.setID(hy.getAttributeValue("ID"));
				hyobject.setName(hy.getChildText("����"));
				hyobject.setEnglishName(hy.getChildText("Ӣ����"));
				hyobject.setHeadName(hy.getChildText("ͷ��"));
				hyobject.setSex(hy.getChildText("�Ա�"));
				hyobject.setBirthday(hy.getChildText("��������"));
				hyobject.setFriendship(hy.getChildText("�Ѻö�"));
				hyobject.setTel(hy.getChild("��ϵ��ʽ").getChildText("�绰"));
				hyobject.setQQ(hy.getChild("��ϵ��ʽ").getChildText("QQ"));
				hyobject.setEmail(hy.getChild("��ϵ��ʽ").getChildText("Email"));
				hyobject.setAddress(hy.getChildText("��ַ"));
				hyobject.setNotes(hy.getChildText("��ע"));
				// �����Ѷ�����ӵ����Ѷ��󼯺���
				friends.add(hyobject);
			}
		} catch (Exception e) {
		}
		return friends;
	}

	// ���һ������
	// xmlfile��Ҫ������XML��·��
	// friend��һ�����ѵķ�װ����
	public boolean addFriends(String xmlfile, Friend friend) {
		boolean results = false;
		try {
			// �ж�XML�ļ��Ƿ����
			File file = new File(xmlfile);
			if (file.exists()) {
				// ����JDOM������
				SAXBuilder sab = new SAXBuilder();
				// ����document���󣬶���xml�ļ�����
				Document doc = sab.build(new FileInputStream(xmlfile));
				// �õ���Ԫ��
				Element root = doc.getRootElement();
				// ��ø�Ԫ�ص�������Ԫ�ؼ���
				List sub = root.getChildren();

				// ����IDֵ
				String stringid = "1";
				// ���Ը�Ԫ���Ƿ�����Ԫ��
				if (sub.size() != 0) {
					// ��λ�����һ������Ԫ����
					Element lasthy = (Element) XPath.selectSingleNode(root, "����[last()]");
					// ��ȡ���һ�����ѵ�ID����ֵ
					stringid = lasthy.getAttributeValue("ID");
					int intid = Integer.parseInt(stringid); // ���õ���idֵת������ֵ������
					int id = intid + 1; // id��ֵ��1
					stringid = Integer.toString(id); // �ٽ�idת�����ַ�������
				}
				// �����º��Ѳ�Ϊ�ú���д����Ӧ������
				Element newhy = new Element("����");
				newhy.setAttribute("ID", stringid);
				newhy.addContent(new Element("����").addContent(friend.getName()));
				newhy.addContent(new Element("Ӣ����").addContent(friend.getEnglishName()));
				newhy.addContent(new Element("ͷ��").addContent(friend.getHeadName()));
				newhy.addContent(new Element("�Ա�").addContent(friend.getSex()));
				newhy.addContent(new Element("��������").addContent(friend.getBirthday()));
				newhy.addContent(new Element("�Ѻö�").addContent(friend.getFriendship()));
				Element lxfs = new Element("��ϵ��ʽ");
				lxfs.addContent(new Element("�绰").addContent(friend.getTel()));
				lxfs.addContent(new Element("QQ").addContent(friend.getQQ()));
				lxfs.addContent(new Element("E_Mail").addContent(friend.getEmail()));
				newhy.addContent(lxfs);
				newhy.addContent(new Element("��ַ").addContent(friend.getAddress()));
				newhy.addContent(new Element("��ע").addContent(friend.getNotes()));
				root.addContent(newhy);

				// �����ļ������ʽd
				Format format = Format.getPrettyFormat();
				format.setIndent("  ");
				format.setEncoding("GB2312");
				// ������ ���浽XML�ĵ���
				XMLOutputter outputter = new XMLOutputter();
				outputter.setFormat(format); // ���ö���������ʽ
				outputter.output(doc, new FileOutputStream(xmlfile)); // ������д�뵽XML�ĵ���
				results = true;
			} else {
				// ���XML�ĵ�������
				Element hylb = new Element("�����б�");
				// �����º��Ѳ�Ϊ�ú���д����Ӧ������
				Element newhy = new Element("����");
				newhy.setAttribute("ID", "1");
				
				newhy.addContent(new Element("����").addContent(friend.getName()));
				newhy.addContent(new Element("Ӣ����").addContent(friend.getEnglishName()));
				newhy.addContent(new Element("ͷ��").addContent(friend.getHeadName()));
				newhy.addContent(new Element("�Ա�").addContent(friend.getSex()));
				newhy.addContent(new Element("��������").addContent(friend.getBirthday()));
				newhy.addContent(new Element("�Ѻö�").addContent(friend.getFriendship()));
				Element lxfs = new Element("��ϵ��ʽ");
				lxfs.addContent(new Element("�绰").addContent(friend.getTel()));
				lxfs.addContent(new Element("QQ").addContent(friend.getQQ()));
				lxfs.addContent(new Element("E_Mail").addContent(friend.getEmail()));
				newhy.addContent(lxfs);
				newhy.addContent(new Element("��ַ").addContent(friend.getAddress()));
				newhy.addContent(new Element("��ע").addContent(friend.getNotes()));
				// ������ӵĺ�����ӵ���Ԫ�ص����һ��Ԫ��
				hylb.addContent(newhy);
				// �趨XML�ĵ������ģʽ
				Format format = Format.getPrettyFormat();
				format.setIndent("  ");
				format.setEncoding("GB2312"); // �趨������ַ�����

				Document doc = new Document(hylb); // �Ը�Ԫ�ؽ����ĵ�
				XMLOutputter out = new XMLOutputter(); // ���������
				out.setFormat(format); // ���ö���������ʽ
				out.output(doc, new FileOutputStream(xmlfile));
				results = true;
			}
		} catch (Exception e) {
			e.getMessage();
			results = false;
		}
		return results;
	}

	// ��ȡĳһ�����ѵ���Ϣ
	// xmlfile:xml�ļ���·��
	// id:ĳһ�����ѵı��
	public Friend loadOneFriend(String xmlfile, String id) {
		// ����һ�����Ѷ���
		Friend hyobject = new Friend();
		// ��ʼ����XML,����װ�����Ѽ��϶�����
		try {
			// ����JDOM������
			SAXBuilder sb = new SAXBuilder();
			// ����Document����,����xml�ļ�������
			Document doc = sb.build(new FileInputStream(xmlfile));
			// �õ���Ԫ��
			Element root = doc.getRootElement();
			// ��λ��Ҫ�޸ĵ��Ǹ�������
			Element edithy = (Element) XPath.selectSingleNode(root, "//����[@ID='" + id + "']");
			// ����XML������Ӧ�����ݷ�װ�����Ѷ�����
			hyobject.setID(edithy.getAttributeValue("ID"));   //��ȡ����ֵ
			hyobject.setName(edithy.getChildText("����"));     //����ӽڵ�
			hyobject.setEnglishName(edithy.getChildText("Ӣ����"));
			hyobject.setHeadName(edithy.getChildText("ͷ��"));
			hyobject.setSex(edithy.getChildText("�Ա�"));
			hyobject.setBirthday(edithy.getChildText("��������"));
			hyobject.setFriendship(edithy.getChildText("�øж�"));
			hyobject.setTel(edithy.getChild("��ϵ��ʽ").getChildText("�绰"));
			hyobject.setQQ(edithy.getChild("��ϵ��ʽ").getChildText("QQ"));
			hyobject.setEmail(edithy.getChild("��ϵ��ʽ").getChildText("E_Mail"));
			hyobject.setAddress(edithy.getChildText("��ַ"));
			hyobject.setNotes(edithy.getChildText("��ע"));
		} catch (Exception e) {

		}
		return hyobject;
	}

	// �޸�һ������
	// xmlfile:Ҫ����XML��·��
	// friend:һ�����ѵķ�װ����
	public boolean editFriend(String xmlfile, Friend friend) {
		boolean results = false;
		try {
			// ����������
			SAXBuilder sb = new SAXBuilder();
			// ����һ��Document,����xml�ļ�������
			Document doc = sb.build(new FileInputStream(xmlfile));
			// �õ���Ԫ��
			Element root = doc.getRootElement();
			// ��λ��Ҫ�޸ĵĺ���Ԫ��
			Element edithy = (Element) XPath.selectSingleNode(root, "//����[@ID='" + friend.getID() + "']");
			// �޸ĺ�����Ӧ������
			edithy.getChild("����").setText(friend.getName());
			edithy.getChild("Ӣ����").setText(friend.getEnglishName());
			edithy.getChild("ͷ��").setText(friend.getHeadName());
			edithy.getChild("�Ա�").setText(friend.getSex());
			edithy.getChild("��������").setText(friend.getBirthday());
			edithy.getChild("�Ѻö�").setText(friend.getFriendship());
			edithy.getChild("��ַ").setText(friend.getAddress());
			edithy.getChild("��ע").setText(friend.getNotes());
			// ��λ����ϵ��ʽԪ����
			Element lxfs = edithy.getChild("��ϵ��ʽ");
			lxfs.getChild("�绰").setText(friend.getTel());
			lxfs.getChild("QQ").setText(friend.getQQ());
			lxfs.getChild("E_Mail").setText(friend.getEmail());

			// �����ļ������ʽd
			Format format = Format.getCompactFormat();
			format.setIndent("  ");
			format.setEncoding("GB2312");
			// ���ļ����浽XML�ĵ���
			XMLOutputter outter = new XMLOutputter();
			outter.setFormat(format);    //�ҵĴ�����д�����룬�����ļ������ʽ���ܶ�Ӧ
			outter.output(doc, new FileOutputStream(xmlfile));
			results = true;
		} catch (Exception e) {
			e.getMessage();
			results = false;
		}
		return results;
	}

	// ɾ��һ������
	// xmlfile:Ҫ����XML��·��
	// friend:һ�����ѵķ�װ����
	public boolean delFriend(String xmlfile, Friend friend) {
		boolean results = false;
		try {
			// ����������
			SAXBuilder sb = new SAXBuilder();
			// ����һ��Document,����xml�ļ�������
			Document doc = sb.build(new FileInputStream(xmlfile));
			// �õ���Ԫ��
			Element root = doc.getRootElement();
			// ��λ��Ҫ�޸ĵĺ���Ԫ��
			Element edithy = (Element) XPath.selectSingleNode(root, "//����[@ID='" + friend.getID() + "']");
			//ɾ����λ�ĺ�����Ϣ
			root.removeContent(edithy);

			// �����ļ������ʽd
			Format format = Format.getCompactFormat();
			format.setIndent("  ");
			format.setEncoding("GB2312");
			// ���ļ����浽XML�ĵ���
			XMLOutputter outter = new XMLOutputter();
			outter.setFormat(format);   //�ҵĴ���:��д�����룬�����ļ������ʽ���ܶ�Ӧ
			outter.output(doc, new FileOutputStream(xmlfile));
			results = true;
		} catch (Exception e) {
			e.getMessage();
			results = false;
		}
		return results;
	}
}
