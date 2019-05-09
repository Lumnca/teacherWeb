package servlet;

import mysql.GetDb;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;

@WebServlet(name = "stuHwInforServlet")
public class stuHwInforServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String name = request.getParameter("rename").trim();
        String file = request.getParameter("refile").trim();
        String infor = request.getParameter("reinfor").trim();

        GetDb db = new GetDb();
        try {
            PreparedStatement ps= db.conn.prepareStatement("update stuhw set  infor = ?  where id=(select id from users where name = ?) and hw_file = ? ");
            ps.setString(1,infor);
            ps.setString(2,name);
            ps.setString(3,file);

            int i = ps.executeUpdate();
            if(i==0){
                System.out.println("失败！");
            }
            ps.close();db.CloseAll();
            response.sendRedirect("teacher-shw.jsp");
        }
        catch (Exception e){
            e.printStackTrace();
            response.sendRedirect("teacher-shw.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
