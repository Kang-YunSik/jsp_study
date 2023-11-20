package servlet;

import membership.MemberDAO;
import membership.MemberDTO;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;


public class MemberAuth extends HttpServlet {
    MemberDAO dao;

    @Override
    public void init() throws ServletException {
        // application 내장 객체 얻기
        ServletContext application = this.getServletContext();

        String driver = application.getInitParameter("Driver");
        String connectUrl = application.getInitParameter("DriverURL");
        String id = application.getInitParameter("DriverId");
        String pw = application.getInitParameter("DriverPw");

        dao = new MemberDAO(driver, connectUrl, id, pw);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String admin_id = this.getInitParameter("admin_id");

        String id = req.getParameter("id");
        String pass = req.getParameter("pass");

        MemberDTO memberDTO = dao.getMemberDTO(id, pass);
        String memberName = memberDTO.getName();
        if (memberName != null) {
            req.setAttribute("authMessage", memberName + " 회원님 방가방가^^*");
        }
        else {
            if (admin_id.equals(id)) {
                req.setAttribute("authMessage", admin_id + "는 최고 관리자입니다.");
            }
            else {
                req.setAttribute("authMessage", "귀하는 회원이 아닙니다.");
            }
        }
        req.getRequestDispatcher("/1206_MemberAuth/MemberAuth.jsp").forward(req, resp);
    }

//    @Override
//    protected void service(HttpServletRequest req, HttpServletResponse resp)
//            throws ServletException, IOException {
//        String admin_id = this.getInitParameter("admin_id");
//
//        String id = req.getParameter("id");
//        String pass = req.getParameter("pass");
//
//        MemberDTO memberDTO = dao.getMemberDTO(id, pass);
//        String memberName = memberDTO.getName();
//        if (memberName != null) {
//            req.setAttribute("authMessage", memberName + " 회원님 방가방가^^*");
//        }
//        else {
//            if (admin_id.equals(id)) {
//                req.setAttribute("authMessage", admin_id + "는 최고 관리자입니다.");
//            }
//            else {
//                req.setAttribute("authMessage", "귀하는 회원이 아닙니다.");
//            }
//        }
//        req.getRequestDispatcher("/1206_MemberAuth/MemberAuth.jsp").forward(req, resp);
//    }

    @Override
    public void destroy() {
        dao.close();
    }
}