package servlet;

import mysql.GetDb;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet(name = "rmTeaHwServlet")
public class rmTeaHwServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        ServletContext sc = request.getServletContext();
        String id = request.getParameter("id").trim();
        String fileName = request.getParameter("fileName").trim();

        GetDb db = new GetDb();

        try {
            PreparedStatement ps = db.conn.prepareStatement("delete from hw where id=? and hw_file = ?");
            ps.setString(1,id);
            ps.setString(2,fileName);

            int i = ps.executeUpdate();
            if(i!=0){
                String delUrl = sc.getRealPath("TeacherHw/"+id+"/"+fileName);
                System.out.println(delUrl);
                Path url = Paths.get(delUrl);
                Files.deleteIfExists(url);
                System.out.println("删除成功！");

                response.sendRedirect("teacher-shif.jsp");
            }
            else {

            }
           ps.close();db.CloseAll();
        }
        catch (Exception e){
            e.printStackTrace();
        }



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
