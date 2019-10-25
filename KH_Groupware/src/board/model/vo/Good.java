package board.model.vo;

import java.io.Serializable;

public class Good implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 5365184214492791829L;
	
	private int gId; 
	private int rId; 
	private int userNo; 
	private String status; 
	private int refBid; 
	
	public Good() {}

	public Good(int gId, int rId, int userNo, String status, int refBid) {
		super();
		this.gId = gId;
		this.rId = rId;
		this.userNo = userNo;
		this.status = status;
		this.refBid = refBid;
	}

	public Good(int gId, int rId, int userNo, String status) {
		this.gId = gId;
		this.rId = rId;
		this.userNo = userNo;
		this.status = status;
	}
	

	public int getRefBid() {
		return refBid;
	}

	public void setRefBid(int refBid) {
		this.refBid = refBid;
	}

	public int getgId() {
		return gId;
	}

	public void setgId(int gId) {
		this.gId = gId;
	}

	public int getrId() {
		return rId;
	}

	public void setrId(int rId) {
		this.rId = rId;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
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
		return "Good [gId=" + gId + ", rId=" + rId + ", userNo=" + userNo + ", status=" + status + ", refBid=" + refBid
				+ "]";
	}


}
