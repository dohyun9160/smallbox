package com.box.small.user.comment;

public class CommentDto {
	private int com_no;
	private String mem_id;
	private int bo_no;
	private String com_content;
	private String com_creatdeAt;
	private String com_updatedAt;
	private int com_status;
	private String com_reComid;
	
	public CommentDto() {}

	public CommentDto(String mem_id, int bo_no, String com_content, String com_creatdeAt, String com_updatedAt,
			int com_status, String com_reComid) {
		super();
		this.mem_id = mem_id;
		this.bo_no = bo_no;
		this.com_content = com_content;
		this.com_creatdeAt = com_creatdeAt;
		this.com_updatedAt = com_updatedAt;
		this.com_status = com_status;
		this.com_reComid = com_reComid;
	}

	public CommentDto(int com_no, String mem_id, int bo_no, String com_content, String com_creatdeAt,
			String com_updatedAt, int com_status, String com_reComid) {
		super();
		this.com_no = com_no;
		this.mem_id = mem_id;
		this.bo_no = bo_no;
		this.com_content = com_content;
		this.com_creatdeAt = com_creatdeAt;
		this.com_updatedAt = com_updatedAt;
		this.com_status = com_status;
		this.com_reComid = com_reComid;
	}

	public int getCom_no() {
		return com_no;
	}

	public void setCom_no(int com_no) {
		this.com_no = com_no;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public int getBo_no() {
		return bo_no;
	}

	public void setBo_no(int bo_no) {
		this.bo_no = bo_no;
	}

	public String getCom_content() {
		return com_content;
	}

	public void setCom_content(String com_content) {
		this.com_content = com_content;
	}

	public String getCom_creatdeAt() {
		return com_creatdeAt;
	}

	public void setCom_creatdeAt(String com_creatdeAt) {
		this.com_creatdeAt = com_creatdeAt;
	}

	public String getCom_updatedAt() {
		return com_updatedAt;
	}

	public void setCom_updatedAt(String com_updatedAt) {
		this.com_updatedAt = com_updatedAt;
	}

	public int getCom_status() {
		return com_status;
	}

	public void setCom_status(int com_status) {
		this.com_status = com_status;
	}

	public String getCom_reComid() {
		return com_reComid;
	}

	public void setCom_reComid(String com_reComid) {
		this.com_reComid = com_reComid;
	}

	@Override
	public String toString() {
		return "CommentDto [com_no=" + com_no + ", mem_id=" + mem_id + ", bo_no=" + bo_no + ", com_content="
				+ com_content + ", com_creatdeAt=" + com_creatdeAt + ", com_updatedAt=" + com_updatedAt
				+ ", com_status=" + com_status + ", com_reComid=" + com_reComid + "]";
	}
	
	
	
}