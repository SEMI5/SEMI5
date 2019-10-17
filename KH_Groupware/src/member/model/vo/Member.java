package member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Member implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8442194589208953779L;
	
	private int userNo;	//학생번호     
	private int cId;		//클래스번호    
	private String userId;  //아이디      
	private String userPwd;  //비밀번호     
	private String userName;  //이름       
	private String RRN;  //주민등록번호   
	private String phone;  //핸드폰      
	private String eMail;  //이메일      
	private String address;  //주소       
	private Date enrollDate;  //가입일      
	private Date modifyDate;  //수정일      
	private String status;  //탈퇴여부     
	private String stdLv;  //학생의 수준   
	private String major;  //전공유무     
	private String smoking;  //흡연여부     
	private String seat;  //자리       
	private String exp;  //실무경험     
	private String consult;  //상담내용     
	private String approve;  //승인여부 

	public Member() {}

	// 로그인
	public Member(String userId, String userPwd) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
	}

	// 회원가입
	public Member(int cId, String userId, String userPwd, String userName, String rRN, String phone, String eMail,
			String address) {
		super();
		this.cId = cId;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		RRN = rRN;
		this.phone = phone;
		this.eMail = eMail;
		this.address = address;
	}

	// 정보 수정
	public Member(String userId, String userPwd, String phone, String eMail, String address) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.phone = phone;
		this.eMail = eMail;
		this.address = address;
	}
	
	// 상담일지 기록
	public Member(int userNo, String stdLv, String major, String smoking, String exp, String consult) {
		super();
		this.userNo = userNo;
		this.stdLv = stdLv;
		this.major = major;
		this.smoking = smoking;
		this.exp = exp;
		this.consult = consult;
	}
	
	// 모든 정보
	public Member(int userNo, int cId, String userId, String userPwd, String userName, String rRN, String phone,
			String eMail, String address, Date enrollDate, Date modifyDate, String status, String stdLv,
			String major, String smoking, String seat, String exp, String consult, String approve) {
		super();
		this.userNo = userNo;
		this.cId = cId;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		RRN = rRN;
		this.phone = phone;
		this.eMail = eMail;
		this.address = address;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.status = status;
		this.stdLv = stdLv;
		this.major = major;
		this.smoking = smoking;
		this.seat = seat;
		this.exp = exp;
		this.consult = consult;
		this.approve = approve;
	}



	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getcId() {
		return cId;
	}

	public void setcId(int cId) {
		this.cId = cId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getRRN() {
		return RRN;
	}

	public void setRRN(String rRN) {
		RRN = rRN;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String geteMail() {
		return eMail;
	}

	public void seteMail(String eMail) {
		this.eMail = eMail;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getStdLv() {
		return stdLv;
	}

	public void setStdLv(String stdLv) {
		this.stdLv = stdLv;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getSmoking() {
		return smoking;
	}

	public void setSmoking(String smoking) {
		this.smoking = smoking;
	}

	public String getSeat() {
		return seat;
	}

	public void setSeat(String seat) {
		this.seat = seat;
	}

	public String getExp() {
		return exp;
	}

	public void setExp(String exp) {
		this.exp = exp;
	}

	public String getConsult() {
		return consult;
	}

	public void setConsult(String consult) {
		this.consult = consult;
	}

	public String getApprove() {
		return approve;
	}

	public void setApprove(String approve) {
		this.approve = approve;
	}

	@Override
	public String toString() {
		return "Member [userNo=" + userNo + ", cId=" + cId + ", userId=" + userId + ", userPwd=" + userPwd
				+ ", userName=" + userName + ", RRN=" + RRN + ", phone=" + phone + ", eMail=" + eMail + ", address="
				+ address + ", enrollDate=" + enrollDate + ", modifyDate=" + modifyDate + ", status=" + status
				+ ", stdLv=" + stdLv + ", major=" + major + ", smoking=" + smoking + ", seat=" + seat + ", exp=" + exp
				+ ", consult=" + consult + ", approve=" + approve + "]";
	}
	
	
	
	
	
}
