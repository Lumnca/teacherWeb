package servlet;

import mysql.GetDb;
import userInfor.TalkInfor;
import userInfor.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "talkServlet")
public class talkServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
            String text = request.getParameter("text").trim();
            String id = request.getParameter("id").trim();
            String name = request.getParameter("name").trim();
            String rename = request.getParameter("rename").trim();

            Date now=new Date();
            SimpleDateFormat f=new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
            String date = f.format(now);

            GetDb db = new GetDb();
            try {
                PreparedStatement ps = db.conn.prepareStatement("insert into talkInfor values(?,?,?,?,0,1,?)");
                ps.setString(1,id);
                ps.setString(2,name);
                ps.setString(3,text);
                ps.setString(4,date);
                ps.setString(5,rename);

                ps.executeUpdate();
                ps.close();db.CloseAll();
            }
            catch (Exception e){
                e.printStackTrace();
            }

            if(user.sfn.equals("Teacher")){
                response.sendRedirect("teacher-talk.jsp");
            }
            else if(user.sfn.equals("Student")) {
                response.sendRedirect("student-talk.jsp");
            }
            else {
                response.sendRedirect("index.jsp");
            }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
