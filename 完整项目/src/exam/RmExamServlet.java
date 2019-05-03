package exam;

import mysql.GetDb;
import sun.plugin2.message.GetAppletMessage;

import javax.naming.ldap.PagedResultsControl;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;

@WebServlet(name = "RmExamServlet")
public class RmExamServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String id = request.getParameter("name").trim();
        String date = request.getParameter("date").trim();
        System.out.println(date+id);

        GetDb db = new GetDb();
        try{
            PreparedStatement ps = db.conn.prepareStatement("delete from stu_test where test_name = ? and d_date = ?");
            ps.setString(1,id);
            ps.setString(2,date);

            ps.executeUpdate();

            ps.close();db.CloseAll();
            response.sendRedirect("teacher-examinfor.jsp");
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
