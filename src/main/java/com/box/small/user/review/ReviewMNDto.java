package com.box.small.user.review;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Timestamp;


@Getter
@Setter

public class ReviewMNDto {

    private String mo_name;
    private int mo_no;
    private String mem_id;
    private int rev_no;
    private String rev_content;
    private int rev_rating;
    private Timestamp rev_createdAt;
	public String getMo_name() {
		return mo_name;
	}
	public void setMo_name(String mo_name) {
		this.mo_name = mo_name;
	}
	public int getMo_no() {
		return mo_no;
	}
	public void setMo_no(int mo_no) {
		this.mo_no = mo_no;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getRev_no() {
		return rev_no;
	}
	public void setRev_no(int rev_no) {
		this.rev_no = rev_no;
	}
	public String getRev_content() {
		return rev_content;
	}
	public void setRev_content(String rev_content) {
		this.rev_content = rev_content;
	}
	public int getRev_rating() {
		return rev_rating;
	}
	public void setRev_rating(int rev_rating) {
		this.rev_rating = rev_rating;
	}
	public Timestamp getRev_createdAt() {
		return rev_createdAt;
	}
	public void setRev_createdAt(Timestamp rev_createdAt) {
		this.rev_createdAt = rev_createdAt;
	}
	public ReviewMNDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReviewMNDto(String mo_name, int mo_no, String mem_id, int rev_no, String rev_content, int rev_rating,
			Timestamp rev_createdAt) {
		super();
		this.mo_name = mo_name;
		this.mo_no = mo_no;
		this.mem_id = mem_id;
		this.rev_no = rev_no;
		this.rev_content = rev_content;
		this.rev_rating = rev_rating;
		this.rev_createdAt = rev_createdAt;
	}
	@Override
	public String toString() {
		return "ReviewMNDto [mo_name=" + mo_name + ", mo_no=" + mo_no + ", mem_id=" + mem_id + ", rev_no=" + rev_no
				+ ", rev_content=" + rev_content + ", rev_rating=" + rev_rating + ", rev_createdAt=" + rev_createdAt
				+ "]";
	}

    
	
}
