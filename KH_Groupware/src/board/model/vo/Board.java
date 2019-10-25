package board.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Board implements Serializable{

	private static final long serialVersionUID = 5468210009798086941L;

	private int bId;			//NUMBER 
	private int cId;  		 	// 해당 게시판 소속 
	private String bTitle; 		//게시판 제목 
	private String btype; 		//게시판 타입(1.  일반게시판, 2. 사진게시판) 
	private String bContent; 	//게시판 내용 
	private int userNo; 
	private String bWriter;//게시판 작성자    // 조인 view 에서 멤버 이름을 받아올거라서 STRING 
	private int bCount; 		//게시판 조회수
	private Date createDate; 	//게시판 작성일
	private Date modifyDate; 	//게시판 수정일
	private String status; 		//게시판 상태(Y,N)
	private int blevl; 			// 게시판 상단위치 우선순위
	
	public Board() {
		
	}

	


	public Board(int bId, int cId, String bTitle, String btype, String bContent, int userNo, String bWriter,  int bCount,
			Date createDate, Date modifyDate, String status, int blevl) {
		super();
		this.bId = bId;
		this.cId = cId;
		this.bTitle = bTitle;
		this.btype = btype;
		this.bContent = bContent;
		this.bWriter = bWriter;
		this.userNo = userNo;
		this.bCount = bCount;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.status = status;
		this.blevl = blevl;
	}




	public Board(int bId, int cId, String bTitle, String btype, String bContent, String bWriter, int bCount,
			Date createDate, Date modifyDate, String status, int blevl) {
		this.bId = bId;
		this.cId = cId;
		this.bTitle = bTitle;
		this.btype = btype;
		this.bContent = bContent;
		this.bWriter = bWriter;
		this.bCount = bCount;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.status = status;
		this.blevl = blevl;
	}


	public int getbId() {
		return bId;
	}

	public void setbId(int bId) {
		this.bId = bId;
	}

	public int getcId() {
		return cId;
	}

	public void setcId(int cId) {
		this.cId = cId;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getBtype() {
		return btype;
	}

	public void setBtype(String btype) {
		this.btype = btype;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public String getbWriter() {
		return bWriter;
	}

	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
	}

	public int getbCount() {
		return bCount;
	}

	public void setbCount(int bCount) {
		this.bCount = bCount;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public int getBlevl() {
		return blevl;
	}

	public void setBlevl(int blevl) {
		this.blevl = blevl;
	}

	
	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "Board [bId=" + bId + ", cId=" + cId + ", bTitle=" + bTitle + ", btype=" + btype + ", bContent="
				+ bContent + ", userNo=" + userNo + ", bWriter=" + bWriter + ", bCount=" + bCount + ", createDate="
				+ createDate + ", modifyDate=" + modifyDate + ", status=" + status + ", blevl=" + blevl + "]";
	}
	

}


