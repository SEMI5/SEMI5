package teacherPage.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Schedule implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 6262860156673558263L;
	private int scdNum;
	private int calssNum;
	private int userNum;
	private String scdName;
	private Date strDate;
	private Date endDate;
	private String status;
	
	
	public Schedule () {}


	public Schedule( int scdNum, int calssNum, int userNum, String scdName, Date strDate, Date endDate, String status) {
		super();
		this.scdNum = scdNum;
		this.calssNum = calssNum;
		this.userNum = userNum;
		this.scdName = scdName;
		this.strDate = strDate;
		this.endDate = endDate;
		this.status = status;
	}


	
	public Schedule(int calssNum, int userNum, String scdName, Date strDate, Date endDate) {
		super();
		this.calssNum = calssNum;
		this.userNum = userNum;
		this.scdName = scdName;
		this.strDate = strDate;
		this.endDate = endDate;
	}

	
	

	public Schedule(int scdNum, Date strDate, Date endDate) {
		super();
		this.scdNum = scdNum;
		this.strDate = strDate;
		this.endDate = endDate;
	}


	public int getUserNum() {
		return userNum;
	}


	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}


	public int getCalssNum() {
		return calssNum;
	}


	public void setCalssNum(int calssNum) {
		this.calssNum = calssNum;
	}


	public int getScdNum() {
		return scdNum;
	}


	public void setScdNum(int scdNum) {
		this.scdNum = scdNum;
	}


	public String getScdName() {
		return scdName;
	}


	public void setScdName(String scdName) {
		this.scdName = scdName;
	}


	public Date getStrDate() {
		return strDate;
	}


	public void setStrDate(Date strDate) {
		this.strDate = strDate;
	}


	public Date getEndDate() {
		return endDate;
	}


	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	@Override
	public String toString() {
		return "Schedule [userNum=" + userNum + ", calssNum=" + calssNum + ", scdNum=" + scdNum + ", scdName=" + scdName
				+ ", strDate=" + strDate + ", endDate=" + endDate + ", status=" + status + "]";
	}
	
	
	
}
