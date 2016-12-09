package com.inn.house;

import java.util.List;
import java.util.Map; //DB �Ķ���Ͱ� �� ���·� ó��

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository; //DAO Ŭ���� ��� ������̼�


@Repository("houseDAO") // DAO 
public class HouseDAO {
	/*
	 * ㅇㅇㅇ움ㅇ누마아가나다
	1. all : ��� ��� ����
	2. cast : ĳ��Ʈ ������ ���� ��� ����
	3. dep-ann : ������� ���ƾ� �� �ּ� ���� ��� ����
	4. deprecation : ������� ���ƾ� �� �޼ҵ� ���� ��� ����
	5. fallthrough : switch�������� break ���� ���� ��� ����
	6. finally : ��ȯ���� �ʴ� finally �� ���� ��� ����
	7. null : null �м� ���� ��� ����
	8. rawtypes : ���׸��� ����ϴ� Ŭ���� �Ű� ������ ��Ư���� ���� ��� ����
	9. unchecked : �������� ���� ������ ���� ��� ����
	10. unused : ������� �ʴ� �ڵ� ���� ��� ����
	*/
	
//	sql �غ���
	private SqlSessionTemplate sqlSession;
	
	@SuppressWarnings("unchecked")//��� ���� ������̼�
	public List<Map<String,Object>> selectHouseList(Map<String,Object> map){
		return (List<Map<String,Object>>)selectList("house.selectHouseList",map);
	}
	
	public List selectList(String id, Object params){
		return sqlSession.
	}
}
