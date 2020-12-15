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

		// System.out.println(b_cd);
		String[] bcd = b_cd.split(",");
		// System.out.println(bcd);
		List<String> slist = new ArrayList<String>(Arrays.asList(bcd));

		// System.out.println(b_code);
		List<HomeVO> list = sst.selectList("home.bodySymptom", slist);
		// System.out.println(list.size());

		return list;
	}

	public List<HomeVO> sympDisease(String[] s_cdar) {
		List<HomeVO> list = sst.selectList("home.sympDisease", s_cdar);
		System.out.println(list.size());
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
		Collections.sort(list);	//정렬

		// 기존 리스트에서 추가 된 증상 비교
		int cnt = 0;
		for (String s_cd : s_cdar) {
			if (!list.contains(s_cd)) {
				list.add(s_cd);
				cnt++;
			}
		}

		//증상 추가
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
		}else
			System.out.println("cnt : 0");
		
		return res;

	}

}
