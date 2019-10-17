package member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class khClass implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 5009403046305692786L;
	
	private int CID;		// 반번호
	private String C_NAME;	// 반이름
	private int TID;		// 담당강사
	private int PERSONNEL;	// 인원수
	private Date STR_DATE;	// 개강일
	private Date END_DATE;	// 수료일
	private String STATUS;	// 삭제여부
	
	public khClass () {}

	
	public khClass(int cID, String c_NAME, int tID, int pERSONNEL, Date sTR_DATE, Date eND_DATE, String sTATUS) {
		super();
		CID = cID;
		C_NAME = c_NAME;
		TID = tID;
		PERSONNEL = pERSONNEL;
		STR_DATE = sTR_DATE;
		END_DATE = eND_DATE;
		STATUS = sTATUS;
	}




	public int getCID() {
		return CID;
	}

	public void setCID(int cID) {
		CID = cID;
	}

	public String getC_NAME() {
		return C_NAME;
	}

	public void setC_NAME(String c_NAME) {
		C_NAME = c_NAME;
	}

	public int getTID() {
		return TID;
	}

	public void setTID(int tID) {
		TID = tID;
	}

	public int getPERSONNEL() {
		return PERSONNEL;
	}

	public void setPERSONNEL(int pERSONNEL) {
		PERSONNEL = pERSONNEL;
	}

	public Date getSTR_DATE() {
		return STR_DATE;
	}

	public void setSTR_DATE(Date sTR_DATE) {
		STR_DATE = sTR_DATE;
	}

	public Date getEND_DATE() {
		return END_DATE;
	}

	public void setEND_DATE(Date eND_DATE) {
		END_DATE = eND_DATE;
	}

	public String getSTATUS() {
		return STATUS;
	}

	public void setSTATUS(String sTATUS) {
		STATUS = sTATUS;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
}
