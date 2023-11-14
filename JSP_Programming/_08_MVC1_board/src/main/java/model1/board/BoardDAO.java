package model1.board;

import model1.common.JDBConnect;

import javax.servlet.ServletContext;


public class BoardDAO extends JDBConnect {
    public BoardDAO(ServletContext application) {   // DB 연결(application 방법)
        super(application);
    }
}
