package com.inn.admin;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.common.common.AbstractDAO;
//DB에 접속하여 데이터를 조회하는 역할만 수행하는 클래스



@Repository("adminQnaDAO")
public class AdminQnaDAO extends AbstractDAO{
	
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	//글목록
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> qnaBoardList(Map<String, Object> map) throws Exception{
        return (List<Map<String, Object>>)selectList("admin.qnaBoardList", map);
		//return sqlSessionTemplate.selectList("admin.qnaBoardList", map); 
    }
	
	//제목으로 검색
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> search0(Map<String, Object> map) {
		return (List<Map<String,Object>>)selectList("admin.search0", map);
	}
	
	//내용으로 검색
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> search1(Map<String, Object> map) {
		return (List<Map<String,Object>>)selectList("admin.search1", map);
	}
	
	//작성자로 검색 
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> search2(Map<String, Object> map) {
		return (List<Map<String,Object>>)selectList("admin.search2", map);
	}
	
	
	
	
	//글쓰기
	public void adminQnaInsertPro(Map<String, Object> map) throws Exception{
	    insert("admin.adminQnaInsertPro", map);
	}
	
	
	//상세보기
	@SuppressWarnings("unchecked")
	public Map<String, Object> adminQnaSelectDetail(Map<String, Object> map) throws Exception{
	    return (Map<String, Object>) selectOne("admin.adminQnaSelectDetail", map);
	}
	
		//조회수 증가
		public void updateQnaReadCount(Map<String, Object> map) throws Exception{
			
		    update("admin.updateQnaReadCount", map);
		   
		    
		}
		
		//댓글목록
		@SuppressWarnings("unchecked")
		public List<Map<String, Object>> qnaCommList(Map<String, Object> map) throws Exception{
			
			return (List<Map<String, Object>>)selectList("admin.qnaCommList",map);
		}
		
		
		//댓글쓰기
		public void qnaCommWrite(Map<String, Object> map) throws Exception{
			
		    insert("admin.qnaCommWrite", map);
		    
		}
		
		//댓글삭제
		public void qnaCommDelete(Map<String, Object> map) throws Exception{
			System.out.println(3);
			System.out.println(map);
			delete("admin.qnaCommDelete", map);
			System.out.println(4);
			System.out.println(map);
		}
		
		
	//수정하기
	public void adminQnaUpdatePro(Map<String, Object> map) throws Exception{

	    update("admin.adminQnaUpdatePro", map);

	}
	
	//삭제하기
	public void adminQnaDelete(Map<String, Object> map) throws Exception{
		System.out.println(3);
		System.out.println(map);
		
	    delete("admin.adminQnaDelete", map);
	    
	    System.out.println(6);
	    System.out.println(map);
	}
	
}