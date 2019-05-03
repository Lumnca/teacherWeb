package exam;

import mysql.GetDb;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.PreparedStatement;

@WebServlet(name = "DeleteServlet")
public class DeleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String delid = request.getParameter("delid").trim();
        String delno = request.getParameter("delno").trim();
        String delTab = request.getParameter("deltype").trim();

        GetDb db = new GetDb();
        PreparedStatement ps=null;
        try {


            if(delTab.equals("single")){
                ps = db.conn.prepareStatement(" delete from single where sid = ? and num = ? ");
                ps.setString(1,delid);
                ps.setString(2,delno);
                ps.executeUpdate();
            }
            else  if(delTab.equals("judge")){
                ps = db.conn.prepareStatement(" delete from judge where jid = ? and num = ? ");
                ps.setString(1,delid);
                ps.setString(2,delno);
                ps.executeUpdate();

            }
            else if(delTab.equals("app")){
                ps = db.conn.prepareStatement(" delete from app where aid = ? and num = ? ");
                ps.setString(1,delid);
                ps.setString(2,delno);
                ps.executeUpdate();
            }
            else {

            }

            ps.close();db.CloseAll();
            response.sendRedirect("teacher-exammessage.jsp");
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
