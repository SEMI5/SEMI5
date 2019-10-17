package member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Member implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -4952932019676617041L;

	private int USER_NO;		//학생번호
	private int CID;			//클래스번호
	private String USER_ID;		//아이디
	private String USER_PWD;	//비밀번호
	private String USER_NAME;	//이름
	private String PHONE;		//핸드폰
	private String EMAIL;		//이메일
	private String ADDRESS;		//주소
	private Date ENROLL_DATE;	//가입일
	private Date MODIFY_DATE;	//수정일
	private String STATUS;		//탈퇴여부
	private String LEVEL;		//학생의 수준
	private String MAJOR;		//전공유무
	private String SMOKING;		//흡연여부
	private String SEAT;		//자리
	private String EXP;			//실무경험
	private String CONSULT;		//상담내용
	private String APPROVE;		//승인여부
	
	public Member() {}

	
	
	
	// 로그인시 사용
	public Member(String uSER_ID, String uSER_PWD) {
		super();
		USER_ID = uSER_ID;
		USER_PWD = uSER_PWD;
	}


	

	// 정보 수정시 사용
	public Member(String uSER_ID, String uSER_PWD, String pHONE, String eMAIL, String aDDRESS) {
		super();
		USER_ID = uSER_ID;
		USER_PWD = uSER_PWD;
		PHONE = pHONE;
		EMAIL = eMAIL;
		ADDRESS = aDDRESS;
	}
	




	// 회원가입시 사용
	public Member(int cID, String uSER_ID, String uSER_PWD, String uSER_NAME, String pHONE, String eMAIL,
			String aDDRESS) {
		super();
		CID = cID;
		USER_ID = uSER_ID;
		USER_PWD = uSER_PWD;
		USER_NAME = uSER_NAME;
		PHONE = pHONE;
		EMAIL = eMAIL;
		ADDRESS = aDDRESS;
	}






	public Member(int uSER_NO, int cID, String uSER_ID, String uSER_PWD, String uSER_NAME, String pHONE, String eMAIL, String aDDRESS,
			Date eNROLL_DATE, Date mODIFY_DATE, String sTATUS, String lEVEL, String mAJOR, String sMOKING, String sEAT,
			String eXP, String cONSULT, String aPPROVE) {
		super();
		USER_NO = uSER_NO;
		CID = cID;
		USER_ID = uSER_ID;
		USER_PWD = uSER_PWD;
		USER_NAME = uSER_NAME;
		PHONE = pHONE;
		EMAIL = eMAIL;
		ADDRESS = aDDRESS;
		ENROLL_DATE = eNROLL_DATE;
		MODIFY_DATE = mODIFY_DATE;
		STATUS = sTATUS;
		LEVEL = lEVEL;
		MAJOR = mAJOR;
		SMOKING = sMOKING;
		SEAT = sEAT;
		EXP = eXP;
		CONSULT = cONSULT;
		APPROVE = aPPROVE;
	}


	

	public int getUSER_NO() {
		return USER_NO;
	}


	public void setUSER_NO(int uSER_NO) {
		USER_NO = uSER_NO;
	}


	public int getCID() {
		return CID;
	}


	public void setCID(int cID) {
		CID = cID;
	}


	public String getUSER_ID() {
		return USER_ID;
	}


	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}


	public String getUSER_PWD() {
		return USER_PWD;
	}


	public void setUSER_PWD(String uSER_PWD) {
		USER_PWD = uSER_PWD;
	}


	public String getUSER_NAME() {
		return USER_NAME;
	}


	public void setUSER_NAME(String uSER_NAME) {
		USER_NAME = uSER_NAME;
	}


	public String getPHONE() {
		return PHONE;
	}


	public void setPHONE(String pHONE) {
		PHONE = pHONE;
	}


	public String getEMAIL() {
		return EMAIL;
	}


	public void setEMAIL(String eMAIL) {
		EMAIL = eMAIL;
	}

	

	public String getADDRESS() {
		return ADDRESS;
	}


	public void setADDRESS(String aDDRESS) {
		ADDRESS = aDDRESS;
	}


	public Date getENROLL_DATE() {
		return ENROLL_DATE;
	}


	public void setENROLL_DATE(Date eNROLL_DATE) {
		ENROLL_DATE = eNROLL_DATE;
	}


	public Date getMODIFY_DATE() {
		return MODIFY_DATE;
	}


	public void setMODIFY_DATE(Date mODIFY_DATE) {
		MODIFY_DATE = mODIFY_DATE;
	}


	public String getSTATUS() {
		return STATUS;
	}


	public void setSTATUS(String sTATUS) {
		STATUS = sTATUS;
	}


	public String getLEVEL() {
		return LEVEL;
	}


	public void setLEVEL(String lEVEL) {
		LEVEL = lEVEL;
	}


	public String getMAJOR() {
		return MAJOR;
	}


	public void setMAJOR(String mAJOR) {
		MAJOR = mAJOR;
	}


	public String getSMOKING() {
		return SMOKING;
	}


	public void setSMOKING(String sMOKING) {
		SMOKING = sMOKING;
	}


	public String getSEAT() {
		return SEAT;
	}


	public void setSEAT(String sEAT) {
		SEAT = sEAT;
	}


	public String getEXP() {
		return EXP;
	}


	public void setEXP(String eXP) {
		EXP = eXP;
	}


	public String getCONSULT() {
		return CONSULT;
	}


	public void setCONSULT(String cONSULT) {
		CONSULT = cONSULT;
	}


	public String getAPPROVE() {
		return APPROVE;
	}


	public void setAPPROVE(String aPPROVE) {
		APPROVE = aPPROVE;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	@Override
	public String toString() {
		return "Member [USER_NO=" + USER_NO + ", CID=" + CID + ", USER_ID=" + USER_ID + ", USER_PWD=" + USER_PWD
				+ ", USER_NAME=" + USER_NAME + ", PHONE=" + PHONE + ", EMAIL=" + EMAIL + ", ADDRESS=" + ADDRESS
				+ ", ENROLL_DATE=" + ENROLL_DATE + ", MODIFY_DATE=" + MODIFY_DATE + ", STATUS=" + STATUS + ", LEVEL="
				+ LEVEL + ", MAJOR=" + MAJOR + ", SMOKING=" + SMOKING + ", SEAT=" + SEAT + ", EXP=" + EXP + ", CONSULT="
				+ CONSULT + ", APPROVE=" + APPROVE + "]";
	}


	
	
	
	

	
}
