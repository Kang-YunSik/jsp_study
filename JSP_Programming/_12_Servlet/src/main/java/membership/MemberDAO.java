package membership;

import common.JDBConnect;

public class MemberDAO extends JDBConnect {
    // 명시한 데이터베이스로의 연결이 완료된 MemberDAO 객체 생성 (상속 처리)
    public MemberDAO(String driver, String url, String id, String pwd) {
        super(driver, url, id, pwd);    // 부모 클래스의 생성자
    }

    // 아이디/패스워드와 일치하는 회원 정보를 찾아 MemberDTO 타입으로 반환
    public MemberDTO getMemberDTO(String uid, String upass) {
        MemberDTO dto = new MemberDTO();    // 회원 정보 DTO 객체 생성
        String query = "SELECT * FROM member WHERE id=? AND pass=?";    // 쿼리문(동일한 id, pass 검색)

        try {
            // 쿼리 실행
            psmt= con.prepareStatement(query);      //동적 쿼리문 준비(PreparedStatement 객체 생성)
            psmt.setString(1, uid);     // 쿼리문의 첫 번째 인파라미터에 값 설정
            psmt.setString(2, upass);   // 쿼리문의 두 번째 인파라미터에 값 설정
            rs = psmt.executeQuery();               // 쿼리문 실행(ResultSet 객체 생성)

            // 결과 처리 (getter, setter 사용)
            if (rs.next()) {    // next()로 다음 레코드가 존재하는지 확인. 존재하면 true, 존재하지 않으면 false
                                // 즉, 로그인한 회원정보가 있으면 수행, 아니면 미수행
                // 쿼리 결과로 얻은 회원 정보를 DTO 객체에 저장
                dto.setId(rs.getString("id"));  // getString()으로 레코드의 값을 가져옴
                                                            // 매개변수로는 컬럼명 혹은 인덱스
                dto.setPass(rs.getString("pass"));  // 매개변수로 컬렴명
                dto.setName(rs.getString(3));   // 매개변수로 인덱스
                dto.setRegister(rs.getString(4));
            }

        }catch (Exception e){
            e.printStackTrace();
        }

        return dto; // dto 객체 반환
    }
}
