package servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class HelloServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // jsp 파일로 보내줄 변수
        req.setAttribute("message", "HelloServlet..!!");
        // jsp 파일로 가라는 명령
        // jsp파일의 경로를 정의한다.
        req.getRequestDispatcher("/1205_webxml_Mapping/HelloServlet.jsp")
                .forward(req, resp);
    }
}
