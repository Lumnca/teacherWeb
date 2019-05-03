package exam;

import mysql.GetDb;
import userInfor.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.PreparedStatement;

@WebServlet(name = "ExamServlet")
public class ExamServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");

        String name = request.getParameter("ename").trim();
        String id = request.getParameter("eid").trim();
        String date = request.getParameter("edate").trim();



        GetDb db = new GetDb();
        try{
            PreparedStatement ps = db.conn.prepareStatement("insert into test values(?,?,?,?)");
            ps.setString(1,user.ID);
            ps.setString(2,name);
            ps.setString(3,date);
            ps.setString(4,id);

            ps.executeUpdate();
            ps.close();
            db.CloseAll();
            response.sendRedirect("teacher-examinfor.jsp");
        }
        catch (Exception e){

        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
