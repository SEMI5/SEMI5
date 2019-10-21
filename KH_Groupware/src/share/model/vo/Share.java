package share.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Share implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8209039453237695965L;
	
	private int bId;			//NUMBER 
	private int cId;  		 	// 해당 게시판 소속 
	private String bTitle; 		//게시판 제목 
	private String btype; 		//게시판 타입(1.일반게시판, 2.사진게시판 .3자료실) 
	private String bContent; 	//게시판 내용 
	private int bCount; 		//게시판 조회수
	private String bWriter; 	//게시판 작성자    // 조인 view 에서 멤버 이름을 받아올거라서 STRING 
	private Date createDate; 	//게시판 작성일
	private Date modifyDate; 	//게시판 수정일
	private String status; 		//게시판 상태(Y,N)
	
	
	public Share() {
	}
	

	public Share(String bTitle, String bWriter, Date createDate, String bContent) {
		this.bTitle = bTitle;
		this.bWriter = bWriter;
		this.createDate = createDate;
		this.bContent = bContent;
	}


	public Share(int bId, int cId, String bTitle, String btype, String bContent, int bCount, String bWriter,
			Date createDate, Date modifyDate, String status) {
		this.bId = bId;
		this.cId = cId;
		this.bTitle = bTitle;
		this.btype = btype;
		this.bContent = bContent;
		this.bCount = bCount;
		this.bWriter = bWriter;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.status = status;
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


	public int getbCount() {
		return bCount;
	}


	public void setbCount(int bCount) {
		this.bCount = bCount;
	}


	public String getbWriter() {
		return bWriter;
	}


	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
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


	@Override
	public String toString() {
		return "Share [bId=" + bId + ", cId=" + cId + ", bTitle=" + bTitle + ", btype=" + btype + ", bContent="
				+ bContent + ", bCount=" + bCount + ", bWriter=" + bWriter + ", createDate=" + createDate
				+ ", modifyDate=" + modifyDate + ", status=" + status + "]";
	}
	

	
	
	
}
