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

@WebServlet(name = "courseServlet")
public class courseServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        ServletContext sc = request.getServletContext();
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");

        String cno = request.getParameter("cno");
        String cname = request.getParameter("cname");

        GetDb db = new GetDb();
        try {
            db.GetPreparedStatement("insert into tea_course values(?,?,?,?,default,default)");
            db.preStatement.setString(1,user.Name);
            db.preStatement.setString(2,user.ID);
            db.preStatement.setString(3,cname);
            db.preStatement.setString(4,cno);

            int r =  db.preStatement.executeUpdate();
            if(r!=0){
                System.out.println("添加成功！");
                sc.setAttribute("message",cname+"课程添加成功！");
            }

            db.CloseAll();
        }
        catch (Exception e){
            sc.setAttribute("message","课程添加失败！错误原因:"+e.getMessage());
            e.printStackTrace();
        }

        sc.setAttribute("flag",true);
        response.sendRedirect("ResServlet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
