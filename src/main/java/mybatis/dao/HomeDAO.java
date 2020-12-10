package mybatis.dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mybatis.vo.HomeVO;

@Repository
public class HomeDAO {
	
	@Autowired 
	private SqlSessionTemplate sst;
	
	public List<HomeVO> bodySymptom(String b_cd){
		StringBuffer sb = new StringBuffer();
		
		//System.out.println(b_cd);
		String[] bcd = b_cd.split(",");
		//System.out.println(bcd);
		List<String> slist = new ArrayList<String>(Arrays.asList(bcd));
		
		//System.out.println(b_code);
		List<HomeVO> list = sst.selectList("home.bodySymptom", slist);
		System.out.println(list.size());
		
		return null;
	}
}
