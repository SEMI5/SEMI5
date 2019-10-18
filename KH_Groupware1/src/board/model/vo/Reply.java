package board.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Reply implements Serializable{

	private static final long serialVersionUID = -1509329356743407904L;

	private int rId;
	private String rContent; 
	private int refBid; 
	private String rWriter; 
	private Date createDate; 
	private Date modifyDate;
	private String Status;
	
	// int rWriter가 아니고 String rWriter로 하자! 조인결과 값을 가져올 꺼라서...(조인 결과를 담을 vo 객체를 찍어낼 class기 때문에 ) 


	public Reply() {
	}

	public Reply(int rId, String rContent, int refBid, String rWriter, Date createDate, Date modifyDate,
			String status) {
		super();
		this.rId = rId;
		this.rContent = rContent;
		this.refBid = refBid;
		this.rWriter = rWriter;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		Status = status;
	}

	public int getrId() {
		return rId;
	}

	public void setrId(int rId) {
		this.rId = rId;
	}

	public String getrContent() {
		return rContent;
	}

	public void setrContent(String rContent) {
		this.rContent = rContent;
	}

	public int getRefBid() {
		return refBid;
	}

	public void setRefBid(int refBid) {
		this.refBid = refBid;
	}

	public String getrWriter() {
		return rWriter;
	}

	public void setrWriter(String rWriter) {
		this.rWriter = rWriter;
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
		return Status;
	}

	public void setStatus(String status) {
		Status = status;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	} 
	
	@Override
	public String toString() {
		return "Reply [rId=" + rId + ", rContent=" + rContent + ", refBid=" + refBid + ", rWriter=" + rWriter
				+ ", createDate=" + createDate + ", modifyDate=" + modifyDate + ", Status=" + Status + "]";
	}

	
	
}
