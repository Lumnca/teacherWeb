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

@WebServlet(name = "registerServlet")
public class registerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        request.removeAttribute("message");

        String id = request.getParameter("reid").trim();
        String pw = request.getParameter("repw").trim();
        String name = request.getParameter("rename").trim();
        String idem = request.getParameter("iden").trim();
        ServletContext servletContext = request.getServletContext();
        GetDb db = new GetDb();

        try {
            PreparedStatement ps = db.conn.prepareStatement("insert into  users values(?,?,'男',?,'1XXXXXXXXXX','无','这个人很懒没有留下任何信息',?)");
            ps.setString(1,name);
            ps.setString(2,id);
            ps.setString(3,idem);
            ps.setString(4,pw);

            int i = ps.executeUpdate();
            db.CloseAll();
            if(i==0){
                servletContext.setAttribute("message","注册失败！");
                servletContext.setAttribute("flag","visible");
                response.sendRedirect("index.jsp");
            }
            else {
                servletContext.setAttribute("message","注册成功！");
                servletContext.setAttribute("flag","visible");
                response.sendRedirect("index.jsp");
            }
        }
        catch (Exception e){
            e.printStackTrace();
            //错误信息提示
            servletContext.setAttribute("message","注册错误！"+e.getMessage());
            servletContext.setAttribute("flag","visible");
            response.sendRedirect("index.jsp");
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
           doPost(request,response);
    }
}
