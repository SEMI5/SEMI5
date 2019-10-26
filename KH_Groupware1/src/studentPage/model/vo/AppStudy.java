package studentPage.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class AppStudy implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -6129846211469133707L;
	
	private int userNo;
	private int stNo;
	private Date appDate;
	private String userName;
	private String phone;
	private String address;

	
	public AppStudy() {}


	public AppStudy(int userNo, int stNo, Date appDate, String userName, String phone, String address) {
		super();
		this.userNo = userNo;
		this.stNo = stNo;
		this.appDate = appDate;
		this.userName = userName;
		this.phone = phone;
		this.address = address;
	}


	public AppStudy(int userNo, int stNo, Date appDate) {
		super();
		this.userNo = userNo;
		this.stNo = stNo;
		this.appDate = appDate;
	}


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public int getStNo() {
		return stNo;
	}


	public void setStNo(int stNo) {
		this.stNo = stNo;
	}


	public Date getAppDate() {
		return appDate;
	}


	public void setAppDate(Date appDate) {
		this.appDate = appDate;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	@Override
	public String toString() {
		return "AppStudy [userNo=" + userNo + ", stNo=" + stNo + ", appDate=" + appDate + ", userName=" + userName
				+ ", phone=" + phone + ", address=" + address + "]";
	}
	
	
	
}

