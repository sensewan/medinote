package mybatis.vo;

public class MemVO {
	
	private String u_id;	//아이디
	private String u_pw;	//비밀번호
	private String u_nm;	//이름
	private String u_nk;	//닉네임
	private String birth;	//생년월일
	private String phone;	//전화번호
	private int save_fl;	//검색내역저장 (0 : N / 1 : Y)
	private int del_fl;		//탈퇴여부	(0 : N / 1 : Y)
	
	
	private String[] arrPhone;
	private String[] arrBirth;
	
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getU_pw() {
		return u_pw;
	}
	public void setU_pw(String u_pw) {
		this.u_pw = u_pw;
	}
	public String getU_nm() {
		return u_nm;
	}
	public void setU_nm(String u_nm) {
		this.u_nm = u_nm;
	}
	public String getU_nk() {
		return u_nk;
	}
	public void setU_nk(String u_nk) {
		this.u_nk = u_nk;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getSave_fl() {
		return save_fl;
	}
	public void setSave_fl(int save_fl) {
		this.save_fl = save_fl;
	}
	public int getDel_fl() {
		return del_fl;
	}
	public void setDel_fl(int del_fl) {
		this.del_fl = del_fl;
	}
	
	
	public String[] getArrPhone() {
		return arrPhone;
	}
	public void setArrPhone(String[] arrPhone) {
		this.arrPhone = arrPhone;
		
		StringBuffer bf = new StringBuffer();
		bf.append(this.arrPhone[0]);
		bf.append(this.arrPhone[1]);
		bf.append(this.arrPhone[2]);
		
		setPhone(bf.toString());
		
	}
	public String[] getArrBirth() {
		return arrBirth;
	}

	public void setArrBirth(String[] arrBirth) {
		this.arrBirth = arrBirth;

		StringBuffer bf = new StringBuffer();
		bf.append(this.arrBirth[0]);
		if (this.arrBirth[1].length() == 1) {
			bf.append("0");
		}
		bf.append(this.arrBirth[1]);
		if (this.arrBirth[2].length() == 1) {
			bf.append("0");
		}
		bf.append(this.arrBirth[2]);

		setBirth(bf.toString());
	}
	
	@Override
	public String toString() {
		return "MemVO [u_id=" + u_id + ", u_pw=" + u_pw + ", u_nm=" + u_nm + ", u_nk=" + u_nk + ", birth=" + birth
				+ ", phone=" + phone + ", save_fl=" + save_fl + ", del_fl=" + del_fl + "]";
	}
	
	
	
	
	
	
	
	
	


}
