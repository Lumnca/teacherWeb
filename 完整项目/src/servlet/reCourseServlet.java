package servlet;

import mysql.GetDb;
import userInfor.User;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "reCourseServlet")
public class reCourseServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        ServletContext sc = request.getServletContext();
        User user = (User)session.getAttribute("user");

        String delID = request.getParameter("delcur").trim();
        String stuID = request.getParameter("sname").trim();
        System.out.println(delID+":"+stuID);
        GetDb db = new GetDb();
        PreparedStatement p1=null,p2=null;
        int r = 0;
        try {
            if(user.sfn.equals("Student")){
                p1 =  db.conn.prepareStatement("delete from stu_course where id=? and cno=?");
                p1.setString(1,stuID);
                p1.setString(2,delID);
                r =p1.executeUpdate();
            }
            else {
                p2 = db.conn.prepareStatement("delete from tea_course where id=? and cno=?");
                p2.setString(1,stuID);
                p2.setString(2,delID);
                r =p2.executeUpdate();

                //删除课程学生信息
                db.GetPreparedStatement("delete  from stu_course where  cno=?");
                db.preStatement.setString(1,delID);
                db.preStatement.executeUpdate();
            }

            if(r!=0){
                sc.setAttribute("message","课程删除成功！");
                System.out.println("删除成功");
            }
            else {
                sc.setAttribute("message","课程删除失败！");
            }
            if(p1!=null){
                p1.close();
            }
            if(p2!=null){
                p2.close();
            }
            db.CloseAll();
        }
        catch (Exception e){
            System.out.println("错误信息:"+e.getMessage());
            e.printStackTrace();
        }
        finally {

        }

        sc.setAttribute("flag",true);
        response.sendRedirect("index.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
