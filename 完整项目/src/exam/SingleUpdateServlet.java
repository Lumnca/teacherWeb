package exam;

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
import java.sql.PreparedStatement;

@WebServlet(name = "SingleUpdateServlet")
public class SingleUpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();

        User user = (User)session.getAttribute("user");
        String sno = request.getParameter("sno").trim();
        String title  = request.getParameter("title").trim();
        String op_A = request.getParameter("op_A").trim();
        String op_B = request.getParameter("op_B").trim();
        String op_C = request.getParameter("op_C").trim();
        String op_D = request.getParameter("op_D").trim();
        String answer = request.getParameter("single").trim();
        String id = session.getAttribute("id").toString();
        String stype = request.getParameter("select1").trim();

        GetDb db = new GetDb();

        if(stype.equals("0")){
            try {
                PreparedStatement ps = db.conn.prepareStatement("update single set title_info=?, op_A = ?,op_B = ?,op_C = ?,op_D = ?,answer=?,num=? where num = ? and  id = ?");
                ps.setString(1,title);
                ps.setString(2,op_A);
                ps.setString(4,op_C);
                ps.setString(5,op_D);
                ps.setString(3,op_B);
                ps.setString(6,answer);
                ps.setString(7,sno);
                ps.setString(8,sno);
                ps.setString(9,user.ID);

                ps.executeUpdate();
                response.sendRedirect("teacher-exammessage.jsp");

                ps.close();db.CloseAll();

            }
            catch (Exception e){
                e.printStackTrace();
            }
        }
        else {
            try {
                PreparedStatement ps2 = db.conn.prepareStatement("insert into single values(?,?,?,?,?,?,?,?,?)");
                ps2.setString(1,user.ID);
                ps2.setString(2,id);

                ps2.setString(3,title);

                ps2.setString(6,op_C);
                ps2.setString(7,op_D);
                ps2.setString(4,op_A);
                ps2.setString(5,op_B);
                ps2.setString(8,answer);
                ps2.setString(9,sno);

                ps2.executeUpdate();
                ps2.close();db.CloseAll();

                session.removeAttribute("id");
                response.sendRedirect("teacher-exammessage.jsp");
            }
            catch (Exception e){
                e.printStackTrace();
            }


        }




    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
