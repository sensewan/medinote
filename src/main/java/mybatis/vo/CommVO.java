package mybatis.vo;

public class CommVO {
	
	private String idx,         // 댓글 고유 번호
					p_no,       // 원글의 번호 (FK)
					writer,     // 댓글작성자의 닉네임
					content,    // 댓글 내용
					del_fl,     // 0:등록,  1:삭제
					ip,
					create_dt,
					update_dt,
					u_nk;        // 조인한닉네임 사용하기 위해 만듦
	
	
	

	public String getU_nk() {
		return u_nk;
	}

	public void setU_nk(String u_nk) {
		this.u_nk = u_nk;
	}

	public String getIdx() {
		return idx;
	}

	public void setIdx(String idx) {
		this.idx = idx;
	}

	public String getP_no() {
		return p_no;
	}

	public void setP_no(String p_no) {
		this.p_no = p_no;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDel_fl() {
		return del_fl;
	}

	public void setDel_fl(String del_fl) {
		this.del_fl = del_fl;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getCreate_dt() {
		return create_dt;
	}

	public void setCreate_dt(String create_dt) {
		this.create_dt = create_dt;
	}

	public String getUpdate_dt() {
		return update_dt;
	}

	public void setUpdate_dt(String update_dt) {
		this.update_dt = update_dt;
	}
	
	

}
