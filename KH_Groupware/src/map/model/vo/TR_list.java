package map.model.vo;

import java.io.Serializable;

public class TR_list implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1190847547095041812L;
	private int trNo;
	private String trName;
	private String trMemo;
	private String trLatLng;
	private String status;
	private int userNo;

	public TR_list() {
	}

	public TR_list(int trNo, String trName, String trMemo, String trLatLng, String status, int userNo) {
		this.trNo = trNo;
		this.trName = trName;
		this.trMemo = trMemo;
		this.trLatLng = trLatLng;
		this.status = status;
		this.userNo = userNo;
	}

	
	public TR_list(String trName2, String trMemo2, String trLatLng2) {
		// TODO Auto-generated constructor stub
	}

	public int getTrNo() {
		return trNo;
	}

	public void setTrNo(int trNo) {
		this.trNo = trNo;
	}

	public String getTrName() {
		return trName;
	}

	public void setTrName(String trName) {
		this.trName = trName;
	}

	public String getTrMemo() {
		return trMemo;
	}

	public void setTrMemo(String trMemo) {
		this.trMemo = trMemo;
	}

	public String getTrLatLng() {
		return trLatLng;
	}

	public void setTrLatLng(String trLatLng) {
		this.trLatLng = trLatLng;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	
	@Override
	public String toString() {
		return "TR_list [trNo=" + trNo + ", trName=" + trName + ", trMemo=" + trMemo + ", trLatLng=" + trLatLng
				+ ", status=" + status + ", userNo=" + userNo + "]";
	}
}
