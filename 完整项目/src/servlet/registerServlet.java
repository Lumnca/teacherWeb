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
import java.util.Random;

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
            if(i==0){
                servletContext.setAttribute("message","注册失败！");
                servletContext.setAttribute("flag","visible");
                response.sendRedirect("index.jsp");

            }
            else {
                if(idem.equals("Teacher")){
                    int no =(int)Math.floor(Math.random()*999998+1);
                    PreparedStatement ps2 = db.conn.prepareStatement("insert into single values(?,?,'初始化题目','A内容','B内容','C内容','D内容','答案',1)");
                    ps2.setString(1,id);
                    ps2.setString(2,"KS"+no);
                    ps2.executeUpdate();
                    ps2.close();

                    PreparedStatement ps3 = db.conn.prepareStatement("insert into judge  values(?,?,'初始化题目','有','没有',1,1)");
                    ps3.setString(1,id);
                    ps3.setString(2,"KS"+no);
                    ps3.executeUpdate();
                    ps3.close();

                    PreparedStatement ps4 = db.conn.prepareStatement("insert into app values(?,?,'初始化题目','',1)");
                    ps4.setString(1,id);

                    ps4.setString(2,"KS"+no);
                    ps4.executeUpdate();
                    ps4.close();

                    PreparedStatement ps5 = db.conn.prepareStatement("insert into test values(?, '第一次检测', '2019/5/1', ?);");
                    ps5.setString(1,id);

                    ps5.setString(2,"KS"+no);
                    ps5.executeUpdate();
                    ps5.close();

                }
                db.CloseAll();

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
