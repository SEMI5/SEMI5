package board.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Answer implements Serializable {

  /**
	 * 
	 */
	private static final long serialVersionUID = 949127867003969640L;
	
	
	private int aid; 
  private String acontent; 
  private int rid; 
  private String awriter; 
  private String userName; 
  private Date createDate; 
  private Date modifyDate; 
  private String status;

  
  


public Answer() {
	super();
  }


	public Answer(int aid, String acontent, int rid, String awriter, String userName, Date createDate, Date modifyDate, String status) {
		super();
		this.aid = aid;
		this.acontent = acontent;
		this.rid = rid;
		this.awriter = awriter;
		this.userName = userName;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.status = status;
	}
	
	  public String getUserName() {
			return userName;
		}


		public void setUserName(String userName) {
			this.userName = userName;
		}


		public static long getSerialversionuid() {
			return serialVersionUID;
		}

	
	public int getAid() {
		return aid;
	}


	public void setAid(int aid) {
		this.aid = aid;
	}


	public String getAcontent() {
		return acontent;
	}


	public void setAcontent(String acontent) {
		this.acontent = acontent;
	}


	public int getRid() {
		return rid;
	}


	public void setRid(int rid) {
		this.rid = rid;
	}


	public String getAwriter() {
		return awriter;
	}


	public void setAwriter(String awriter) {
		this.awriter = awriter;
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


	@Override
	public String toString() {
		return "Answer [aid=" + aid + ", acontent=" + acontent + ", rid=" + rid + ", awriter=" + awriter + ", userName="
				+ userName + ", createDate=" + createDate + ", modifyDate=" + modifyDate + ", status=" + status + "]";
	}



}
