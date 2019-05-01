package servlet;

import mysql.GetDb;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet(name = "rmHwServlet")
public class rmHwServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String stuName = request.getParameter("stuName").trim();
        String fileName = request.getParameter("fileName").trim();
        ServletContext sc = request.getServletContext();
        GetDb db = new GetDb();
        String id = "";
        try {
            PreparedStatement ps = db.conn.prepareStatement("delete from stuhw where id=(select id from users where name = ?) and hw_file = ?");
            ps.setString(1,stuName);
            ps.setString(2,fileName);

            PreparedStatement p2 = db.conn.prepareStatement("select id from users where name = ?");
            p2.setString(1,stuName);
            ResultSet rs = p2.executeQuery();
            if(rs.next()){
                id = rs.getString(1);
            }

            int i = ps.executeUpdate();
            if(i!=0){
                String delUrl = sc.getRealPath("StudentHw/"+id+"/"+fileName);
                System.out.println(delUrl);
                Path url = Paths.get(delUrl);
                Files.deleteIfExists(url);
                System.out.println("删除成功！");

                response.sendRedirect("teacher-shw.jsp");
            }
            else {

            }
            rs.close();p2.close();ps.close();db.CloseAll();
        }
        catch (Exception e){
            e.printStackTrace();
        }



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
