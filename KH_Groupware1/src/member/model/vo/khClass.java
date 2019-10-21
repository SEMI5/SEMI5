package member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class khClass implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5853584211723792332L;
	
	private int cId;		// 반번호 
	private String cName;	// 반이름 
	private int tId;		// 담당강사
	private int personnel;	// 인원수 
	private Date strDate;	// 개강일 
	private Date endDate;	// 수료일 
	private String status;	// 삭제여부
	
	public khClass() {}
	
	
	public khClass(int cId, String cName, int tId, int personnel, Date strDate, Date endDate, String status) {
		super();
		this.cId = cId;
		this.cName = cName;
		this.tId = tId;
		this.personnel = personnel;
		this.strDate = strDate;
		this.endDate = endDate;
		this.status = status;
	}


	public int getcId() {
		return cId;
	}


	public void setcId(int cId) {
		this.cId = cId;
	}


	public String getcName() {
		return cName;
	}


	public void setcName(String cName) {
		this.cName = cName;
	}


	public int gettId() {
		return tId;
	}


	public void settId(int tId) {
		this.tId = tId;
	}


	public int getPersonnel() {
		return personnel;
	}


	public void setPersonnel(int personnel) {
		this.personnel = personnel;
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
		return "khClass [cId=" + cId + ", cName=" + cName + ", tId=" + tId + ", personnel=" + personnel + ", strDate="
				+ strDate + ", endDate=" + endDate + ", status=" + status + "]";
	}
	
	
}
