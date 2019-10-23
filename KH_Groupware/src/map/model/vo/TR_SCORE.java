package map.model.vo;

import java.io.Serializable;

public class TR_SCORE implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1576052772504357000L;
	private int trNo;
	private int likeScore;
	
	public TR_SCORE() {
	}
	
	public TR_SCORE(int likeScore) {
		this.likeScore = likeScore;
	}

	public TR_SCORE(int trNo, int likeScore) {
		this.trNo = trNo;
		this.likeScore = likeScore;
	}

	public int getTrNo() {
		return trNo;
	}

	public void setTrNo(int trNo) {
		this.trNo = trNo;
	}

	public int getLikeScore() {
		return likeScore;
	}

	public void setLikeScore(int likeScore) {
		this.likeScore = likeScore;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "TR_SCORE [trNo=" + trNo + ", likeScore=" + likeScore + "]";
	}
	
}
