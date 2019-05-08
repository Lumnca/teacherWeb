package servlet;

import mysql.GetDb;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet(name = "addCourseServlet")
public class addCourseServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        ServletContext sc = request.getServletContext();

        String addID = request.getParameter("addcur").trim();
        String stuID = request.getParameter("sname2").trim();

        GetDb db = new GetDb();
        try {
            PreparedStatement p1 = db.conn.prepareStatement("select count(*) from tea_course where cno = ?");

            p1.setString(1,addID);
            ResultSet rs = p1.executeQuery();
            int isexit = 0;
            while (rs.next()){
                isexit = rs.getInt(1);
            }
            if(isexit==0){
                sc.setAttribute("message","课程添加失败！课程编号不存在！");
            }
            else {
                PreparedStatement p2 = db.conn.prepareStatement("insert into stu_course values(?,?,'')");
                p2.setString(1,stuID);
                p2.setString(2,addID);

                int r =p2.executeUpdate();
                if(r!=0){
                    sc.setAttribute("message","课程添加成功!");
                }
                if(p1!=null){p1.close();} if(p2!=null){p2.close();}

            }
            db.CloseAll();
        }
        catch (Exception e){
            System.out.println("错误信息:"+e.getMessage());
            e.printStackTrace();
        }

        sc.setAttribute("flag",true);
        response.sendRedirect("ResServlet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);

    }
}
