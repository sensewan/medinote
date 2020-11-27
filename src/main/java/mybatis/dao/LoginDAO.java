package mybatis.dao;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import mybatis.vo.MemVO;

@Component
public class LoginDAO {
	
	@Autowired
	SqlSessionTemplate sst;
	
	//회원가입
	public boolean join(MemVO vo) {
		boolean result = false;
		
		String e_pw = encryption(vo.getU_pw());
		vo.setU_pw(e_pw);
		
	 	int cnt = sst.insert("login.join", vo);
	 
	 	if(cnt > 0) {
	 		result = true;
	 	}
		
		return result;
	}
	
	
	//아이디 중복 확인
	public boolean idChk(String u_id) {

		boolean result = false;

		int cnt = sst.selectOne("login.idChk", u_id);

		if (cnt > 0) {
			result = true;
		}

		return result;

	}
	
	// ID, PW 비교
	public boolean loginChk(String u_id, String u_pw) {
		boolean result = false;

		Map<String, String> map = new HashMap<String, String>();
		map.put("u_id", u_id);
		map.put("u_pw", encryption(u_pw));

		int cnt = sst.selectOne("login.loginChk", map);

		if (cnt > 0) {
			result = true;
		}

		return result;
	}
	
	// 아이디 찾기
	public String findId(String u_nm, String phone) {
		String result = "";

		Map<String, String> map = new HashMap<String, String>();
		map.put("u_nm", u_nm);
		map.put("phone", phone);

		//System.out.println("u_nm : " + u_nm + "phone : " + phone);
		result = sst.selectOne("login.findId", map);

		//System.out.println("result : " + result);

		return result;

	}
	
	// 비밀번호 찾기
	public boolean findPw(String u_id, String u_nm, String phone) {
		boolean result = false;

		Map<String, String> map = new HashMap<String, String>();
		map.put("u_id", u_id);
		map.put("u_nm", u_nm);
		map.put("phone", phone);

		//System.out.println("u_id : " + u_id + "u_nm : " + u_nm + "phone : " + phone);
		int cnt = sst.selectOne("login.findPw", map);

		if(cnt > 0) {
			result = true;
		}
		
		//System.out.println("result : " + result);

		return result;

	}
	
	// 비밀번호 변경
	public boolean changePw(String u_id, String u_pw) {
		boolean result = false;

		Map<String, String> map = new HashMap<String, String>();
		map.put("u_id", u_id);
		map.put("u_pw", u_pw);

		//System.out.println("u_id : " + u_id + "u_pw : " + u_pw);
		int cnt = sst.update("login.changePW", map);
		if (cnt > 0) {
			result = true;
		}

		//System.out.println("result : " + result);

		return result;

	}
	
	public String encryption(String u_pw){

		String hex = "";
		
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(u_pw.getBytes());
			hex = String.format("%064x", new BigInteger(1, md.digest()));
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return hex;
	}

}
