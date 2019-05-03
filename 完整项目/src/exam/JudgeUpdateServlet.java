package exam;

import mysql.GetDb;
import org.apache.poi.poifs.crypt.EcmaDecryptor;
import userInfor.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.PreparedStatement;

@WebServlet(name = "JudgeUpdateServlet")
public class JudgeUpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();

        String jno = request.getParameter("jno").trim();
        String text = request.getParameter("jtitle").trim();
        String one = request.getParameter("op_one").trim();
        String two = request.getParameter("op_two").trim();
        String answer = request.getParameter("judge").trim();
        String stype = request.getParameter("select2").trim();

        User user = (User)session.getAttribute("user");
        String id = session.getAttribute("id").toString();

        GetDb db = new GetDb();

        if(stype.equals("0"))
        {
            try {
                PreparedStatement ps = db.conn.prepareStatement("update judge set title_info=?,op_one=?,op_two=?,answer=?,num=? where id =? and num = ?");
                ps.setString(1,text);
                ps.setString(2,one);
                ps.setString(3,two);

                ps.setString(6,user.ID);
                ps.setString(7,jno);
                ps.setString(5,jno);
                ps.setString(4,answer);


                ps.executeUpdate();
                ps.close();db.CloseAll();

                response.sendRedirect("teacher-exammessage.jsp");
            }
            catch (Exception e){
                e.printStackTrace();
            }
        }
        else {
            try {
                PreparedStatement ps2 = db.conn.prepareStatement("insert into judge  values(?,?,?,?,?,?,?);");
                ps2.setString(1,user.ID);
                ps2.setString(2,id);
                ps2.setString(4,one);
                ps2.setString(6,answer);
                ps2.setString(7,jno);

                ps2.setString(3,text);
                ps2.setString(5,two);


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
        doPost(request, response);
    }
}
