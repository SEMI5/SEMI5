package studentPage.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Study implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 2189351002328206926L;
	
	private int stNo; 
    private int userNo;
    private String stName;
    private String location;
    private String time;
    private Date openDate;
    private String status;
    private String userName;
    
    public Study() {}
    
    
    
    
    public Study(int stNo, int userNo, String stName, String location, String time, Date openDate, String status,
			String userName) {
		super();
		this.stNo = stNo;
		this.userNo = userNo;
		this.stName = stName;
		this.location = location;
		this.time = time;
		this.openDate = openDate;
		this.status = status;
		this.userName = userName;
	}




	public Study(int stNo, int userNo, String stName, String location, String time, Date openDate, String status) {
    	super();
    	this.stNo = stNo;
    	this.userNo = userNo;
    	this.stName = stName;
    	this.location = location;
    	this.time = time;
    	this.openDate = openDate;
    	this.status = status;
    }
    
    

	public Study(int userNo, String stName, String location, String time, Date openDate) {
		super();
		this.userNo = userNo;
		this.stName = stName;
		this.location = location;
		this.time = time;
		this.openDate = openDate;
	}

	
	
	
	public Study(int stNo, String stName, String location, String time) {
		super();
		this.stNo = stNo;
		this.stName = stName;
		this.location = location;
		this.time = time;
	}




	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getStNo() {
		return stNo;
	}

	public void setStNo(int stNo) {
		this.stNo = stNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getStName() {
		return stName;
	}

	public void setStName(String stName) {
		this.stName = stName;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public Date getOpenDate() {
		return openDate;
	}

	public void setOpenDate(Date openDate) {
		this.openDate = openDate;
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
		return "Study [stNo=" + stNo + ", userNo=" + userNo + ", stName=" + stName + ", location=" + location
				+ ", time=" + time + ", openDate=" + openDate + ", status=" + status + "]";
	}

    
    
}
