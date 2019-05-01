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
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "shareServlet")
public class shareServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();

        String text = request.getParameter("stext").trim();
        String id = request.getParameter("sid").trim();
        String name = request.getParameter("sname").trim();
        String type = request.getParameter("stype").trim();

        Date now = new Date();
        User user = (User)session.getAttribute("user");
        SimpleDateFormat f2=new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
        String date = f2.format(now);

        GetDb db = new GetDb();
        try {
            if(type.equals("问题答疑")){
                PreparedStatement ps = db.conn.prepareStatement("insert into talkInfor values(?,?,?,?,0,0,'')");
                ps.setString(1,id);
                ps.setString(3,text);
                ps.setString(4,date);
                ps.setString(2,name);
                ps.executeUpdate();
                ps.close();db.CloseAll();
            }
            else  if(type.equals("分享交流")){
                PreparedStatement ps2 = db.conn.prepareStatement("insert into shareInfor values(?,?,?,?,0)");
                ps2.setString(1,id);
                ps2.setString(3,text);
                ps2.setString(2,name);
                ps2.setString(4,date);
                ps2.executeUpdate();
                ps2.close();db.CloseAll();
            }
            else {
                response.sendRedirect("index.jsp");
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }

        if(user.sfn.equals("Student")){
            System.out.println(user.sfn);
            response.sendRedirect("student-talk.jsp");
        }
        else if(user.sfn.equals("Teacher")) {
            System.out.println(user.sfn);
            response.sendRedirect("teacher-talk.jsp");
        }
        else {
            response.sendRedirect("index.jsp");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
