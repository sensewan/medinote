package mybatis.dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;
import java.util.TreeSet;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mybatis.vo.HomeVO;

@Repository
public class HomeDAO {

	@Autowired
	private SqlSessionTemplate sst;

	@Autowired
	HttpSession session;

	public List<HomeVO> bodySymptom(String b_cd) {
		StringBuffer sb = new StringBuffer();

		String[] bcd = b_cd.split(",");

		List<String> slist = new ArrayList<String>(Arrays.asList(bcd));

		List<HomeVO> list = sst.selectList("home.bodySymptom", slist);

		return list;
	}

	public List<HomeVO> sympDisease(String[] s_cdar) {
		List<HomeVO> list = sst.selectList("home.sympDisease", s_cdar);
		return list;
	}

	public boolean addHist(String[] s_cdar) {
		boolean res = false;
		String u_id = (String) session.getAttribute("loginId");

		for (String s_cd : s_cdar) {
			Map<String, String> map = new HashMap<String, String>();

			map.put("u_id", u_id);
			map.put("srch_tag", s_cd);
			int cnt = sst.insert("home.addHist", map);

			if (cnt > 0)
				res = true;
		}

		return res;
	}

	public boolean addUserSrch(String[] s_cdar) {
		boolean res = false;
		String u_id = (String) session.getAttribute("loginId");

		List<String> list = sst.selectList("home.getUserSrch", u_id);
		Collections.sort(list); // 정렬

		// 기존 리스트에서 추가 된 증상 비교
		int cnt = 0;

		// USER_SRCH_TAG 테이블에 등록 된 사용자
		if (list.size() > 0) {

			// 데이터가 null일 경우 list에서 null 삭제
			if (list.get(0) == null)
				list.remove(0);

			for (String s_cd : s_cdar) {
				if (!list.contains(s_cd)) {
					list.add(s_cd);
					cnt++;
				}
			}

			// 증상 추가
			if (cnt > 0) {
				StringBuffer bf = new StringBuffer();
				for (int i = 0; i < list.size(); i++) {
					if (i != 0)
						bf.append(".");

					bf.append(list.get(i));
				}

				Map<String, String> map = new HashMap<String, String>();

				map.put("u_id", u_id);
				map.put("srch_tag", bf.toString());

				sst.update("home.updUserSrch", map);
			}
		} else {
			// USER_SRCH_TAG 테이블에 등록되지 않은 사용자
			StringBuffer bf = new StringBuffer();
			for (int i = 0; i < s_cdar.length; i++) {
				if (i != 0)
					bf.append(".");

				bf.append(s_cdar[i]);
			}

			Map<String, String> map = new HashMap<String, String>();

			map.put("u_id", u_id);
			map.put("srch_tag", bf.toString());

			sst.update("home.insUserSrch", map);
		}

		return res;

	}

	public List<String> srchS_NM(String[] s_cdar) {
		List<String> s_nm = sst.selectList("home.srchS_NM", s_cdar);
		return s_nm;
	}

}
