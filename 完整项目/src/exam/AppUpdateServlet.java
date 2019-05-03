package exam;

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

@WebServlet(name = "AppUpdateServlet")
public class AppUpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");

        String ano = request.getParameter("ano").trim();
        String text = request.getParameter("apptext").trim();
        String mark = request.getParameter("mark").trim();
        String types =  request.getParameter("select3").trim();
        String id =(String)session.getAttribute("id");

        System.out.println(id);
        GetDb db = new GetDb();

        if(types.equals("0")){
            try {
                System.out.println("更新操作");
                PreparedStatement ps = db.conn.prepareStatement("update app set title_info = ?,remark=?,num=? where id=? and num=?");
                ps.setString(1,text);
                ps.setString(2,mark);
                ps.setString(4,user.ID);
                ps.setString(5,ano);
                ps.setString(3,ano);

                ps.executeUpdate();
                ps.close();
                db.CloseAll();

                response.sendRedirect("teacher-exammessage.jsp");
            }
            catch (Exception e){
                e.printStackTrace();
            }
        }
        else {
            try {
                System.out.println("插入操作");
                PreparedStatement ps2 = db.conn.prepareStatement("insert into app values(?,?,?,?,?)");
                ps2.setString(1,user.ID);
                ps2.setString(2,id);
                ps2.setString(3,text);
                ps2.setString(4,mark);
                ps2.setString(5,ano);

                ps2.executeUpdate();
                session.removeAttribute("id");
                ps2.close();db.CloseAll();

                response.sendRedirect("teacher-exammessage.jsp");
            }
            catch (Exception e){
                e.printStackTrace();
            }


        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doPost(request, response);
    }
}
