package model1.board;

import model1.common.JDBConnect;

import javax.servlet.ServletContext;
import java.util.List;
import java.util.Map;
import java.util.Vector;


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

        // 쿼리문 실행
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

    // 게시물 목록을 가져오는 메소드
    public List<BoardDTO> selectList(Map<String, Object> map) {
        List<BoardDTO> bbs = new Vector<BoardDTO>();    // 결과(게시물 목록)를 담을 변수

        // 게시물 목록을 가져오는 쿼리문 작성
        String query = "SELECT * FROM board ";
        // selectCount()와 같은 원리
        if (map.get("searchWord") != null) {
            query += " WHERE " + map.get("searchField") + " "
                    + " LIKE '%" + map.get("searchWord") + "%'";
            query += " ORDER BY num DESC "; // 최근 게시물을 상단에 표시
        }

        try {
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()) { // 결과를 순회하며 더 이상 행이 존재하지 않을 때까지 수행

                BoardDTO dto = new BoardDTO();  // dto 객체 초기화 ???
                // 쿼리문 결과(게시글 1개)의 내용을 DTO의 값으로 저장
                dto.setNum(rs.getString("num"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setPostdate(rs.getDate("postdate"));
                dto.setId(rs.getString("id"));
                dto.setVisitcount(rs.getString("visitcount"));

                bbs.add(dto);   // 결과(게시물 1개)를 dto에 저장
            }

        } catch (Exception e) {
            System.out.println("게시물 조회 중 예외 발생");
            e.printStackTrace();
        }

        return bbs; // JSP로 반환할 값
    }
}
