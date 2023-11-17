package servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class DirectServletPrint extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // Servlet에서 바로 응답을 출력을 하면 아래와 같이 코드가 더러워지지만
        // 비동기 방식으로 통신할 때 XML이나 JSON을 사용하는 경우가 있으며,
        // 이와 같이 순수 데이터만 출력해야 하는 경우에는 서블릿에서 직접 출력하는게 편하다.
        resp.setContentType("text/html; charset=UTF-8");
        PrintWriter writer = resp.getWriter();
        writer.println("<html>");
        writer.println("<head><title>DirectServletPrint</title></head>");
        writer.println("<body>");
        writer.println("<h2>서블릿에서 직접 출력합니다.</h2>");
        writer.println("<p>jsp로 포워드하지 않습니다.</p>");
        writer.println("</body>");
        writer.println("</html>");
        writer.close();
    }
}
