package exam;

import mysql.GetDb;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "StuExamServlet")
public class StuExamServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String tname = request.getParameter("tname").trim();
        String id = request.getParameter("cid").trim();
        String grade = request.getParameter("grade").trim();
        String tid = request.getParameter("tid").trim();
        HttpSession session = request.getSession();
        GetDb db = new GetDb();
        try {
            Date now=new Date();
            SimpleDateFormat f=new SimpleDateFormat("yyyy/MM/dd-hh:MM:ss");
            String date = f.format(now);
            PreparedStatement ps = db.conn.prepareStatement("insert into stu_test values(?,?,?,?,?)");
            ps.setString(1,id);
            ps.setString(2,tname);
            ps.setString(3,date);
            ps.setString(5,tid);
            ps.setString(4,grade);


            int r = ps.executeUpdate();
            if(r!=0){
                System.out.println("修改成功！");
            }
            session.removeAttribute("judges");
            session.removeAttribute("singles");
            session.removeAttribute("apps");
            session.removeAttribute("singleAnswer");
            session.removeAttribute("judgeAnswer");
            response.sendRedirect("student-examinfor.jsp");

        }
        catch (Exception e){
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
