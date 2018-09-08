package friend.model;

/**
 * @ClassName:Friend 
 * @Description: 实现好友信息的封装
 * @Auther:Lei Du
 * @Version:
 * @Date:Create in 2017年11月28日 上午9:18:39
 * @Modified By:
 */

public class Friend {
	private String _id;  //ID编号
	private String _name;  //姓名
	private String _englishname;  //英文名
	private String _headname;  //头像
	private String _sex;  //性别
	private String _birthday;  //出生日期
	private String _friendship;  //友好度
	private String _tel;  //电话
	private String _qq;  //qq
	private String _email;  //E_Mail
	private String _address;  //地址
	private String _notes;  //备注
	
	public String getID() {
		return _id;
	}
	public void setID(String _id) {
		this._id = _id;
	}
	//获取姓名
	public String getName() {
		return _name;
	}
	//设置姓名
	public void setName(String _name) {
		this._name = _name;
	}
	//获得英文名
	public String getEnglishName() {
		return _englishname;
	}
	//设置英文名
	public void setEnglishName(String _englishname) {
		this._englishname = _englishname;
	}
	//获取头像
	public String getHeadName() {
		return _headname;
	}
	//设置头像
	public void setHeadName(String _headname) {
		this._headname = _headname;
	}
	//获取性别
	public String getSex() {
		return _sex;
	}
	//设置性别
	public void setSex(String _sex) {
		this._sex = _sex;
	}
	//获取生日
	public String getBirthday() {
		return _birthday;
	}
	//设置生日
	public void setBirthday(String _birthday) {
		this._birthday = _birthday;
	}
	//获取好感度
	public String getFriendship() {
		return _friendship;
	}
	//设置好好感度
	public void setFriendship(String _friendship) {
		this._friendship = _friendship;
	}
	//获取电话
	public String getTel() {
		return _tel;
	}
	//设置电话
	public void setTel(String _tel) {
		this._tel = _tel;
	}
	//取得QQ
	public String getQQ() {
		return _qq;
	}
	//设置QQ
	public void setQQ(String _qq) {
		this._qq = _qq;
	}
	//获取Email
	public String getEmail() {
		return _email;
	}
	//设置Email
	public void setEmail(String _email) {
		this._email = _email;
	}
	//获取地址
	public String getAddress() {
		return _address;
	}
	//设置地址
	public void setAddress(String _address) {
		this._address = _address;
	}
	//获取备注
	public String getNotes() {
		return _notes;
	}
	//设置备注
	public void setNotes(String _notes) {
		this._notes = _notes;
	}
}
