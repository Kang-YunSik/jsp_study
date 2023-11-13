package common;

import javax.servlet.ServletContext;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class JDBConnect {
    public Connection con;
    public Statement stmt;
    public PreparedStatement psmt;
    public ResultSet rs;

    // 기본 생성자
    public JDBConnect() {
        try {
            // JDBC 드라이버 로드
            Class.forName("org.mariadb.jdbc.Driver"); // DBMS(mariadb, oracle) 확인

            // DB에 연결
            String url = "jdbc:mariadb://localhost:3306/musthave"; // DBMS(mariadb, oracle), DB 이름 확인
            String id = "root";
            String pwd = "12345";
            con = DriverManager.getConnection(url, id, pwd);

            System.out.println("DB 연결 성공(기본 생성자)");
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 연결 해제(자원 반납)
    public void close() {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (psmt != null) psmt.close();
            if (con != null) con.close();

            System.out.println("JDBC 자원 해제");
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 두 번째 생성자. web.xml에서 값을 받아서 JDBC 연결
    public JDBConnect(String driver, String url, String id, String pwd){
        try {
            Class.forName(driver);
            con = DriverManager.getConnection(url, id, pwd);

            System.out.println("DB 연결 성공(인수 생성자1)");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 세 번째 생성자. context 매개변수를 생성자에서 직접 가져오기
    public JDBConnect(ServletContext application) {
        try {
            // JDBC 드라이버 로드
            String driver = application.getInitParameter("Driver");
            Class.forName(driver);

            // DB에 연결
            String url = application.getInitParameter("DriverURL");
            String id = application.getInitParameter("DriverId");
            String pw = application.getInitParameter("DriverPw");
            con = DriverManager.getConnection(url, id, pw);

            System.out.println("DB 연결 성공(인수 생성자 2)");
        }catch (Exception e) {
            e.printStackTrace();
        }

    }
}