package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("*.one")
public class FrontController extends HelloServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uri = req.getRequestURI();
        int lastSlash = uri.lastIndexOf("/");
        String commanandStr = uri.substring(lastSlash);

        if (commanandStr.equals("/regist.one"))
            registFunc(req);
        else if (commanandStr.equals("/login.one"))
            loginFunc(req);
        else if (commanandStr.equals("/freeboard.one"))
            freeboardFunc(req);

        req.setAttribute("uri", uri);
        req.setAttribute("commanandStr", commanandStr);
        req.getRequestDispatcher("/1205_webxml_Mapping/FrontController.jsp")
                .forward(req, resp);
    }


    // 페이지별 처리 메소드
    void registFunc(HttpServletRequest req) {
        req.setAttribute("resultValue", "<h4>회원가입<h4>");
    }

    void loginFunc(HttpServletRequest req) {
        req.setAttribute("resultValue", "<h4>로그인<h4>");
    }

    void freeboardFunc(HttpServletRequest req) {
        req.setAttribute("resultValue", "<h4>자유게시판<h4>");
    }
}
