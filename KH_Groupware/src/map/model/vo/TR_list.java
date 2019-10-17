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
	private String trStarPoint;
	private String stId;

	public TR_list() {
	}

	public TR_list(int trNo, String trName, String trMemo, String trLatLng, String trStarPoint, String stId) {
		this.trNo = trNo;
		this.trName = trName;
		this.trMemo = trMemo;
		this.trLatLng = trLatLng;
		this.trStarPoint = trStarPoint;
		this.stId = stId;
	}

	public TR_list(String trName, String trMemo, String trLatLng) {
	this.trName = trName;
	this.trMemo = trMemo;
	this.trLatLng = trLatLng;
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

	public String getTrStarPoint() {
		return trStarPoint;
	}

	public void setTrStarPoint(String trStarPoint) {
		this.trStarPoint = trStarPoint;
	}

	public String getStId() {
		return stId;
	}

	public void setStId(String stId) {
		this.stId = stId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "TR_list [trNo=" + trNo + ", trName=" + trName + ", trMemo=" + trMemo + ", trLatLng=" + trLatLng
				+ ", trStarPoint=" + trStarPoint + ", stId=" + stId + "]";
	}

	
}
