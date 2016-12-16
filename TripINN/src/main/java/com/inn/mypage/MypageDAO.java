package com.inn.mypage;

import org.springframework.stereotype.Repository;
import com.common.common.AbstractDAO;

@Repository("mypageDAO")
public class MypageDAO extends AbstractDAO {
	/*
	@SuppressWarnings
	1. all : 모든 경고를 억제
	2. cast : 캐스트 연산자 관련 경고 억제
	3. dep-ann : 사용하지 말아야 할 주석 관련 경고 억제
	4. deprecation : 사용하지 말아야 할 메소드 관련 경고 억제
	5. fallthrough : switch문에서의 break 누락 관련 경고 억제
	6. finally : 반환하지 않는 finally 블럭 관련 경고 억제
	7. null : null 분석 관련 경고 억제
	8. rawtypes : 제네릭을 사용하는 클래스 매개 변수가 불특정일 때의 경고 억제
	9. unchecked : 검증되지 않은 연산자 관련 경고 억제
	10. unused : 사용하지 않는 코드 관련 경고 억제
	*/
}
