package friend.model;

/**
 * @ClassName:Friend 
 * @Description: ʵ�ֺ�����Ϣ�ķ�װ
 * @Auther:Lei Du
 * @Version:
 * @Date:Create in 2017��11��28�� ����9:18:39
 * @Modified By:
 */

public class Friend {
	private String _id;  //ID���
	private String _name;  //����
	private String _englishname;  //Ӣ����
	private String _headname;  //ͷ��
	private String _sex;  //�Ա�
	private String _birthday;  //��������
	private String _friendship;  //�Ѻö�
	private String _tel;  //�绰
	private String _qq;  //qq
	private String _email;  //E_Mail
	private String _address;  //��ַ
	private String _notes;  //��ע
	
	public String getID() {
		return _id;
	}
	public void setID(String _id) {
		this._id = _id;
	}
	//��ȡ����
	public String getName() {
		return _name;
	}
	//��������
	public void setName(String _name) {
		this._name = _name;
	}
	//���Ӣ����
	public String getEnglishName() {
		return _englishname;
	}
	//����Ӣ����
	public void setEnglishName(String _englishname) {
		this._englishname = _englishname;
	}
	//��ȡͷ��
	public String getHeadName() {
		return _headname;
	}
	//����ͷ��
	public void setHeadName(String _headname) {
		this._headname = _headname;
	}
	//��ȡ�Ա�
	public String getSex() {
		return _sex;
	}
	//�����Ա�
	public void setSex(String _sex) {
		this._sex = _sex;
	}
	//��ȡ����
	public String getBirthday() {
		return _birthday;
	}
	//��������
	public void setBirthday(String _birthday) {
		this._birthday = _birthday;
	}
	//��ȡ�øж�
	public String getFriendship() {
		return _friendship;
	}
	//���úúøж�
	public void setFriendship(String _friendship) {
		this._friendship = _friendship;
	}
	//��ȡ�绰
	public String getTel() {
		return _tel;
	}
	//���õ绰
	public void setTel(String _tel) {
		this._tel = _tel;
	}
	//ȡ��QQ
	public String getQQ() {
		return _qq;
	}
	//����QQ
	public void setQQ(String _qq) {
		this._qq = _qq;
	}
	//��ȡEmail
	public String getEmail() {
		return _email;
	}
	//����Email
	public void setEmail(String _email) {
		this._email = _email;
	}
	//��ȡ��ַ
	public String getAddress() {
		return _address;
	}
	//���õ�ַ
	public void setAddress(String _address) {
		this._address = _address;
	}
	//��ȡ��ע
	public String getNotes() {
		return _notes;
	}
	//���ñ�ע
	public void setNotes(String _notes) {
		this._notes = _notes;
	}
}
