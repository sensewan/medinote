package mybatis.dao;

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
		for (int i = 0; i < bcd.length; i++) {
			if(i!=0)
				sb.append(",");
		
			sb.append(String.format("'%s'", bcd[i]));
		}
		
		String b_code = sb.toString();
		//System.out.println(b_code);
		List<HomeVO> list = sst.selectList("home.bodySymptom", b_code);
		System.out.println(list.size());
		
		return null;
	}
}
