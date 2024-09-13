package com.box.small.user.member;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class MemberDto {
    private String mem_id;
    private String mem_password;
    private String mem_name;
    private String mem_ssn;
    private String mem_phoneNumber;
    private int mem_accumulatedAmount;
    private int mem_status;
    private String mem_address;

    
    
    public String getMem_id() {
		return mem_id;
	}



	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}



	public String getMem_password() {
		return mem_password;
	}



	public void setMem_password(String mem_password) {
		this.mem_password = mem_password;
	}



	public String getMem_name() {
		return mem_name;
	}



	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}



	public String getMem_ssn() {
		return mem_ssn;
	}



	public void setMem_ssn(String mem_ssn) {
		this.mem_ssn = mem_ssn;
	}



	public String getMem_phoneNumber() {
		return mem_phoneNumber;
	}



	public void setMem_phoneNumber(String mem_phoneNumber) {
		this.mem_phoneNumber = mem_phoneNumber;
	}



	public int getMem_accumulatedAmount() {
		return mem_accumulatedAmount;
	}



	public void setMem_accumulatedAmount(int mem_accumulatedAmount) {
		this.mem_accumulatedAmount = mem_accumulatedAmount;
	}



	public int getMem_status() {
		return mem_status;
	}



	public void setMem_status(int mem_status) {
		this.mem_status = mem_status;
	}



	public String getMem_address() {
		return mem_address;
	}



	public void setMem_address(String mem_address) {
		this.mem_address = mem_address;
	}

	

	



	public MemberDto(String mem_id, String mem_password){
        this.mem_id = mem_id;
        this.mem_password = mem_password;
    }

}
