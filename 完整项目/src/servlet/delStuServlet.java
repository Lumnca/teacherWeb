package servlet;

import mysql.GetDb;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.PreparedStatement;

@WebServlet(name = "delStuServlet")
public class delStuServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        String cid = request.getParameter("cid").trim();
        String cname  = request.getParameter("cname").trim();

        GetDb db = new GetDb();
        try {
            PreparedStatement ps = db.conn.prepareStatement("delete from stu_course where stu_course.id = ? and cno = (select cno from tea_course where cname =?)");
            ps.setString(1,cid);
            ps.setString(2,cname);

            if(ps.executeUpdate()!=0){
                System.out.println("删除成功！");

                session.setAttribute("flag","成功删除账号"+cid);
            }
            ps.close();
            db.CloseAll();
            response.sendRedirect("teacher-stu.jsp");
        }
        catch (Exception e){
            e.printStackTrace();
            session.setAttribute("flag","删除账号失败！原因："+e.getMessage());
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
