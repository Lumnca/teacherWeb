package servlet;

import mysql.GetDb;
import userInfor.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "teacherUserServlet")
public class teacherUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        request.removeAttribute("message");

        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");

        String tel = request.getParameter("tel");
        String school = request.getParameter("school");
        String infor = request.getParameter("infor").trim();
        String name = request.getParameter("name");
        String sex = request.getParameter("sex");


        GetDb db = new GetDb();
        db.GetPreparedStatement("update users set name=?,sex=?,tel=?,school=?,per_message=? where id = ?");
        try{
            db.preStatement.setString(4,school);
            db.preStatement.setString(5,infor);
            db.preStatement.setString(6,user.ID);
            db.preStatement.setString(1,name);
            db.preStatement.setString(2,sex);
            db.preStatement.setString(3,tel);



            int r =db.preStatement.executeUpdate();
            if(r==0){
                System.out.println("存在操作错误！！！");
            }
            db.CloseAll();
        }
        catch(Exception e){
            e.printStackTrace();
        }
        response.sendRedirect("teacher-index.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);

    }
}
