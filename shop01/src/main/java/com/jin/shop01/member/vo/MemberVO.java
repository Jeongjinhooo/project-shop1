package com.jin.shop01.member.vo;

import java.io.Serializable;
import java.util.Date;

public class MemberVO implements Serializable{


	private static final long serialVersionUID = 1L;
	private String userid;
	private String userpw;
	private String username;
	private String useraddress;
	private String email;
	private int tel;
	private String birthDate;
	private String regDate;
	
	public MemberVO() {
		// TODO Auto-generated constructor stub
	}

	public MemberVO(String userid, String userpw, String username, 
           String useradderss, String email, int tel, String birthDate, String regDate) { 
		super();
		this.userid = userid;
		this.userpw = userpw;
		this.username = username;
		this.useraddress = useraddress;
		this.email = email;
		this.tel = tel;
		this.birthDate = birthDate;
		this.regDate = regDate;
	}

    /* getters and setters */
	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUserpw() {
		return userpw;
	}

	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUseradderss() {
		return useraddress;
	}

	public void setUseraddress(String useraddress) {
		this.useraddress = useraddress;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getTel() {
		return tel;
	}

	public void setTel(int tel) {
		this.tel = tel;
	}

	public String getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}
	
	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}



	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((userid == null) ? 0 : userid.hashCode());
		result = prime * result + ((userpw == null) ? 0 : userpw.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MemberVO other = (MemberVO) obj;
		if (userid == null) {
			if (other.userid != null)
				return false;
		} else if (!userid.equals(other.userid))
			return false;
		if (userpw == null) {
			if (other.userpw != null)
				return false;
		} else if (!userpw.equals(other.userpw))
			return false;
		return true;
	}
}