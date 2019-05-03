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
import java.sql.PseudoColumnUsage;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "findExamServlet")
public class findExamServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        String id = request.getParameter("findExam").trim();
        List<Single> singles = new ArrayList<>();
        List<Judge> judges = new ArrayList<>();
        List<App> apps= new ArrayList<>();
        List<String> singleAnswer = new ArrayList<>();
        List<Integer> judgeAnswer = new ArrayList<>();
        GetDb db = new  GetDb();
        try {
            PreparedStatement ps = db.conn.prepareStatement("select * from single where sid = ?");
            ps.setString(1,id);

            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                singleAnswer.add(rs.getString(8));
                singles.add(new Single(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),
                        rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getInt(9)));
            }
            rs.close();ps.close();

            PreparedStatement ps2 = db.conn.prepareStatement("select * from judge where jid = ?");
            ps2.setString(1,id);
            ResultSet rs2 = ps2.executeQuery();

            while (rs2.next()){
                judgeAnswer.add(rs2.getInt(6));
                judges.add(new Judge(rs2.getString(1),rs2.getString(2),rs2.getString(3),rs2.getString(4),
                        rs2.getString(5),rs2.getInt(6),rs2.getInt(7)));
            }
            rs2.close();ps2.close();

            PreparedStatement ps3 = db.conn.prepareStatement("select * from app where aid = ?");
            ps3.setString(1,id);
            ResultSet rs3 = ps3.executeQuery();

            while (rs3.next()){
                apps.add(new App(rs3.getString(1),rs3.getString(2),rs3.getString(3),
                        rs3.getString(4),rs3.getInt(5)));
            }

            rs3.close();ps3.close();
            PreparedStatement ps4 = db.conn.prepareStatement("select test_name from test where  test_id = ?");
            ps4.setString(1,id);
            ResultSet rs4 = ps4.executeQuery();
            if(rs4.next()){
                session.setAttribute("test",rs4.getString(1));
                System.out.println(rs4.getString(1));
            }

            rs4.close();ps4.close();
            db.CloseAll();

            session.setAttribute("judges",judges);
            session.setAttribute("singles",singles);
            session.setAttribute("apps",apps);
            session.setAttribute("singleAnswer",singleAnswer);
            session.setAttribute("judgeAnswer",judgeAnswer);

            response.sendRedirect("studnet-examruning.jsp");

        }
        catch (Exception e){
            e.printStackTrace();
        }
    }
}
