package servlet;

import mysql.GetDb;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Arrays;

@WebServlet(name = "addStuServlet")
public class addStuServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        ServletContext session = request.getServletContext();

        if(request.getParameter("stuid")==null){
            String cid = request.getParameter("cid").trim();
            GetDb db = new GetDb();
            try {
                PreparedStatement ps = db.conn.prepareStatement("select name,id from users where id = ?");
                ps.setString(1,cid);
                ResultSet rs = ps.executeQuery();

                String[] stu = new String[2];
                while (rs.next()){
                    stu[0] = rs.getString(1);
                    stu[1] = rs.getString(2);
                }
                rs.close();ps.close();db.CloseAll();
                session.setAttribute("stu",stu);

                response.sendRedirect("teacher-info.jsp");
            }
            catch (Exception e){
                e.printStackTrace();
            }
        }
        else {
            GetDb db2 = new GetDb();

            String stucno = request.getParameter("stucno").trim();
            String stuid = request.getParameter("stuid").trim();
            try {

                PreparedStatement ps1 = db2.conn.prepareStatement("insert into stu_course values(?,?,'')");
                ps1.setString(2,stucno);
                ps1.setString(1,stuid);
                int sk = ps1.executeUpdate();
                session.setAttribute("message","添加该学生成功！");
                ps1.close();db2.CloseAll();
                session.setAttribute("flag",true);
                response.sendRedirect("ResServlet");
            }
            catch (Exception e){
                session.setAttribute("message","添加该学生失败！错误原因："+e.getMessage());
                session.setAttribute("flag",true);
                response.sendRedirect("ResServlet");
                e.printStackTrace();
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
