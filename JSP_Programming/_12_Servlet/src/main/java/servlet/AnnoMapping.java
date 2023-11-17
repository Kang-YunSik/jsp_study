package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

// 해당 Servlet이 요청명 "/1205_webxml_Mapping/AnnoMapping.do"를 처리한다는 의미
@WebServlet("/1205_webxml_Mapping/AnnoMapping.do")
public class AnnoMapping extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // jsp 파일로 보내줄 변수
        req.setAttribute("message", "@WebServlet으로 매핑");
        // jsp 파일로 가라는 명령
        // jsp파일의 경로를 정의한다.
        req.getRequestDispatcher("/1205_webxml_Mapping/AnnoMapping.jsp")
                .forward(req, resp);
    }
}
