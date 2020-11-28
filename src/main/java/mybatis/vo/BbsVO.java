package mybatis.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class BbsVO {

	private String idx,          // 고유번호
					title,       // 게시글 제목
					content,     // 내용
					srch_tag,    // 증상선택한 태그
					writer,      // 작성자
					del_fl,      // 0:등록,  1:삭제
					ip,          // 사용자ip
					create_dt,   // 등록일자
					update_dt,   // 수정일자
					file_name,   // 파일첨부했을 경우 파일이름(따로 파일첨부 안하므로 필요없을 듯)
					hit,         // 조회수
					bname;       //게시판 이름
	
	
	private MultipartFile file;
	
	private int cPage;
	
	// ↱ 원글에 댓글이 여러게 작성 할수 있으므로 list로 만들어 놓는다. (1:N 관계) 댓글을 보는 것이므로 댓글vo인 CommVO를 사용
	// ⎥ (bbs.xml의 commList에서 올거임) (mybatis에서 list로 주므로 반환형을 List로 해야함)
	private List<CommVO> c_list;  // mapper에서 resultmap을 사용해서 갖고올거임		
	
	
	

	public String getIdx() {
		return idx;
	}

	public void setIdx(String idx) {
		this.idx = idx;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getSrch_tag() {
		return srch_tag;
	}

	public void setSrch_tag(String srch_tag) {
		this.srch_tag = srch_tag;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
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

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public String getHit() {
		return hit;
	}

	public void setHit(String hit) {
		this.hit = hit;
	}

	public String getBname() {
		return bname;
	}

	public void setBname(String bname) {
		this.bname = bname;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public int getcPage() {
		return cPage;
	}

	public void setcPage(int cPage) {
		this.cPage = cPage;
	}

	public List<CommVO> getC_list() {
		return c_list;
	}

	public void setC_list(List<CommVO> c_list) {
		this.c_list = c_list;
	}

	
	
}
