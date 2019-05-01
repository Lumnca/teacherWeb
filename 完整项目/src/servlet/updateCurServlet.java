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

@WebServlet(name = "updateCurServlet")
public class updateCurServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        ServletContext sc = request.getServletContext();

        String cname = request.getParameter("ud");
        String udcno = request.getParameter("udcno");
        String udcname = request.getParameter("udcname");

        GetDb db = new GetDb();
        try {
            db.GetPreparedStatement("update tea_course set cname =?,cno=? where name=? and cname =?");
            db.preStatement.setString(1,udcname);
            db.preStatement.setString(2,udcno);
            db.preStatement.setString(3,user.Name);
            db.preStatement.setString(4,cname);

            int i =  db.preStatement.executeUpdate();
            if(i!=0){
                sc.setAttribute("message",cname+"课程修改成功！");
                System.out.println("更新成功");
            }

            db.CloseAll();
        }
        catch (Exception e){
            sc.setAttribute("message","课程修改失败！错误原因:"+e.getMessage());
            e.printStackTrace();
        }
        sc.setAttribute("flag",true);
        response.sendRedirect("index.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
