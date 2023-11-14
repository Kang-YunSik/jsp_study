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
        }
        query += " ORDER BY num DESC "; // 최근 게시물을 상단에 표시

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

    // 게시글 작성 메소드
    public int insertWrite(BoardDTO dto) {
        int result = 0;

        try {
            // INSERT 쿼리문 작성
            String query = "INSERT INTO board " +
                    "(title, content, id, visitcount) " +
                    "VALUES (?, ?, ?, DEFAULT) ";

            psmt = con.prepareStatement(query); // 동적 쿼리
            // 사용자 입력값을 dto에 대입
            psmt.setString(1, dto.getTitle());
            psmt.setString(2, dto.getContent());
            psmt.setString(3, dto.getId());

            result = psmt.executeUpdate();  // 쿼리가 성공하면 추가한 행의 개수를 반환
        }catch (Exception e) {
            System.out.println("게시물 입력 중 예외 발생");
            e.printStackTrace();
        }
        return result;  // JSP로 반환할 값
    }

    // 게시글 읽기 메소드
    public BoardDTO selectView(String num) {
        BoardDTO dto = new BoardDTO();

        // 쿼리문 준비
        String query = "SELECT B.*, M.name " +
                "FROM member M INNER JOIN board B " +
                "ON M.id=B.id WHERE num=?";

        try{
            psmt = con.prepareStatement(query);
            psmt.setString(1, num); // 인파라미터를 num으로 설정
            rs = psmt.executeQuery();   // 쿼리 실행

            // 결과 처리
            if (rs.next()) {
                dto.setNum(rs.getString(1));
                dto.setTitle(rs.getString(2));
                dto.setContent(rs.getString("content"));
                dto.setPostdate(rs.getDate("postdate"));
                dto.setId(rs.getString("id"));
                dto.setVisitcount(rs.getString(6));
                dto.setName(rs.getString("name"));
            }
        }catch (Exception e) {
            System.out.println("게시물 상세보기 중 예외 발생");
            e.printStackTrace();
        }

        return dto;
    }

    // 게시물의 조회수를 1증가시키는 메소드
    public void updateVisitCount(String num) {
        String query = "UPDATE board " +
                "SET visitcount = visitcount+1 " +
                "WHERE num=?";

        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, num); // 인파라미터를 num으로 설정
            psmt.executeQuery();   // 쿼리 실행
                                    // 기존 행에 영향을 주는 쿼리문은 executeUpdate() 메소드를 사용하지만
                                    // UPDATE가 적용된 행의 개수를 알 필요가 없다면 executeQuery() 메소드를 사용해도 무방하다.
        }catch (Exception e) {
            System.out.println("게시물 조회수 증가 중 예외 발생");
            e.printStackTrace();
        }
    }

    // 게시물 수정 메소드
    public int updateEdit(BoardDTO dto) {
        int result = 0;

        try {
            String query = "UPDATE board " +
                    "SET title=?, content=? " +
                    "WHERE num=?";

            psmt = con.prepareStatement(query);
            psmt.setString(1, dto.getTitle());
            psmt.setString(2, dto.getContent());
            psmt.setString(3, dto.getNum());

            result = psmt.executeUpdate();
        }catch (Exception e) {
            System.out.println("게시물 수정 중 예외 발생");
            e.printStackTrace();
        }

        return result;
    }

    // 게시글 삭제 메소드
    public int deletePost(BoardDTO dto) {
        int result = 0;

        try{
            String query = "DELETE FROM board WHERE num=?";

            psmt = con.prepareStatement(query);
            psmt.setString(1, dto.getNum());

            result = psmt.executeUpdate();
        }catch (Exception e) {
            System.out.println("게시물 삭제 중 예외 발생");
            e.printStackTrace();
        }

        return result;
    }
}
