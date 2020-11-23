package mybatis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import mybatis.vo.BbsVO;

@Component
public class BbsDAO {
	
	@Autowired
	private SqlSessionTemplate sst;
	
	// 페이징을 위한 목록 생성기능
		public BbsVO[] getList(int begin, int end) {
			
			Map<String, String> map = new HashMap<String, String>();
			
			map.put("begin", String.valueOf(begin));
			map.put("end", String.valueOf(end));
			
			List<BbsVO> list = sst.selectList("bbs.list", map); 
			
			//받은 list를 배열로 전환하기
			BbsVO[] ar = null;
			
			if(list != null && list.size() > 0) {
				ar = new BbsVO[list.size()];
				
				list.toArray(ar);
			}

			return ar;
			
		}
		
		
		// 총게시물 수 구하기
		public int totalCount() {
			
			int cnt = sst.selectOne("bbs.totalCount");
			
			return cnt;
		}
		
		
		
		// 게시판 원글 저장하기 (vo로 받아서 하는 것임) ★★스프링이라 가능하다!!★★
		public void add(BbsVO vo) {
			
			sst.insert("bbs.add", vo);
			
		}

		// 글 클릭했을 때 보기 기능
		public BbsVO getBbs(String b_idx) {
			
			BbsVO vo = sst.selectOne("bbs.getBbs", b_idx);
			
			return vo;
		}
		
		
		// 글 수정하기
		public boolean editBbs(BbsVO vo) {
			
			boolean value = false;
			
			
			int cnt = sst.update("bbs.edit", vo);
			
			if (cnt > 0) {
				value = true;
			}
			
			return value;
			
		}
		
		
		// 글 삭제하기(status 변경))
		public int delBbs(String b_idx) {
			
			int cnt = sst.update("bbs.del", b_idx);
			
			return cnt;
			
		}
		
		
		
		// 조회수 증가하기
		public boolean updateHit(String b_idx) {
			int cnt = sst.update("bbs.update_hit", b_idx);
			
			if (cnt > 0) {
				return true;
			}else {
				return false;
			}
		}
		

}
