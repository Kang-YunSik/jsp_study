package model1.board;

import model1.common.JDBConnect;

import javax.servlet.ServletContext;
import java.util.Map;


public class BoardDAO extends JDBConnect {
    // DB 연결 생성자
    public BoardDAO(ServletContext application) {   // DB 연결(application 방법)
        super(application);
    }

    // 게시물 개수를 알려주는 메소드
    public int selectCount(Map<String, Object> map) {
        int totalCount = 0; // 결과(게시물 수)를 담을 변수

        // 게시물 수를 얻어오는 쿼리문 작성
        String query = "SELECT COUNT(*) FROM board";
        // 검색어가 있는 경우, 즉 Map 컬렉션에 "searchWord" 키로 저장된 값이 있을 때 WHERE절 추가
        // SELECT COUNT(*) FROM board WHERE "searchField" like '%searchWord%'"
        if (map.get("searchWord") != null) {
            query += " WHERE " + map.get("searchField") + " "
                    + " LIKE '%" + map.get("searchWord") + "%'";
        }

        try{
            stmt = con.createStatement();   // 쿼리문 생성
            rs = stmt.executeQuery(query);  // 쿼리 실행
            rs.next();  // 커서를 첫 번째 행으로 이동
            totalCount = rs.getInt(1);  // 쿼리문 결과의 첫 번째 속성 값을 가져옴(개수)

        }catch (Exception e) {
            System.out.println("게시물 수를 구하는 중 예외 발생");
            e.printStackTrace();
        }
        return totalCount;  // JSP로 반환할 값
    }
}
