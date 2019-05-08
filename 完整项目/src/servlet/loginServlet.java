package servlet;

import mysql.GetDb;
import userInfor.*;

import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "loginServlet")
public class loginServlet extends HttpServlet {
    public GetDb db;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        request.removeAttribute("message");

        String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        HttpSession session = request.getSession();
        ServletContext servletContext = request.getServletContext();

        User user = null;
        GetDb db = new GetDb();
        try {
            //登录查询
             PreparedStatement ps = db.conn.prepareStatement("select count(*),name,id,sex,iden,tel,school,per_message,pw from users where id=? and pw =?");
             ps.setString(1,id);
             ps.setString(2,pw);

             ResultSet rs = ps.executeQuery();
             int loginFlag = 0;
             while(rs.next())
             {
                 loginFlag = rs.getInt(1);
                 //用户存在
             }
            if(loginFlag==1)
            {
                PreparedStatement ps1 = db.conn.prepareStatement("select count(*),name,id,sex,iden,tel,school,per_message,pw from users where id=? and pw =?");

                ps1.setString(2,pw);
                ps1.setString(1,id);

                ResultSet rs1 = ps.executeQuery();

                while(rs1.next()){
                    //填装用户数据
                    user = new User(rs1.getString(3),rs1.getString(2),rs1.getString(9), rs1.getString(5));
                    user.infor = rs1.getString(8);
                    user.school = rs1.getString(7);
                    user.sex = rs1.getString(4);
                    user.tel = rs1.getString(6);
                }
                ps.close();ps1.close();
                //不同用户登录
                /*
                 *教师身份
                 *
                 */
                if(user.sfn.equals("Teacher")){
                    System.out.println(user.sfn+"身份登录");
                    //--------------各项数据-------------
                    PreparedStatement p2 = db.conn.prepareStatement("select * from tea_data where id = ?");
                    p2.setString(1,user.ID);
                    ResultSet r2 = p2.executeQuery();
                    teacherData td = new teacherData();
                    td.GetInfor(r2);

                    r2.close();p2.close();

                    //---------更新选课数----------------
                    PreparedStatement p3 = db.conn.prepareStatement("select count(*) from tea_course where id = ?");
                    p3.setString(1,user.ID);
                    ResultSet r3 = p3.executeQuery();
                    int curnum = 0;
                    while (r3.next()){
                        td.classNum = r3.getInt(1);
                        curnum = td.classNum;
                    }
                    r3.close();p3.close();

                    //---------------更新选课人数---------------
                    PreparedStatement p5 = db.conn.prepareStatement("select count(*) from stu_course,tea_course where ( tea_course.cno =  stu_course.cno) and ( tea_course.cno in (select cno from tea_course where id = ? ) )");
                    p5.setString(1,user.ID);
                    ResultSet r5 = p5.executeQuery();
                    while (r5.next()){
                        td.stuNum = r5.getInt(1);
                    }
                    r5.close();p5.close();
                    //--------------------------------------

                    //数据装载user
                    user.data =  td;
                        /*
                        教师课程信息
                         */
                    TeacherCur tcur = new TeacherCur(user.ID,user.Name,curnum);
                    PreparedStatement p4 = db.conn.prepareStatement("select * from  tea_course where id = ?");
                    p4.setString(1,user.ID);
                    ResultSet r4 = p4.executeQuery();

                    //信息装载
                    tcur.GetInfro(r4);
                    user.cur = tcur;


                    //-----------------写入Session-------------------
                    db.CloseAll();
                    session.setAttribute("user",user);
                    response.sendRedirect("teacher-index.jsp");
                }


                //学生信息
                else if(user.sfn.equals("Student")){
                    System.out.println(user.sfn+"身份登录");

                    //-----学生各项信息
                    PreparedStatement sp1 = db.conn.prepareStatement("select * from stu_data where id = ?");
                    sp1.setString(1,user.ID);
                    ResultSet sr1 = sp1.executeQuery();
                    studentData stu_data = new studentData();
                    //数据装载
                    stu_data.GetInfor(sr1);
                    sr1.close();sp1.close();

                    //选课数
                    PreparedStatement sp2 = db.conn.prepareStatement("select count(*) from stu_course where id = ?");
                    sp2.setString(1,id);
                    ResultSet sr2 = sp2.executeQuery();
                    if(sr2.next()){
                        stu_data.classNum = sr2.getInt(1);
                    }
                    sr2.close();sp2.close();

                    //作业提交数：
                    PreparedStatement p3 = db.conn.prepareStatement("select count(*) from stuhw where id =? ");
                    p3.setString(1,user.ID);
                    ResultSet rs3 = p3.executeQuery();
                    if(rs3.next()){
                        stu_data.workNum = rs3.getInt(1);
                    }
                    rs3.close();p3.close();

                    user.data = stu_data;

                        /*
                        学生选课
                         */

                    PreparedStatement sp3 = db.conn.prepareStatement("select users.name,cname,stu_course.cno,sex,school from  stu_course,tea_course,users where tea_course.cno = stu_course.cno and tea_course.id = users.id and stu_course.id = ?");
                    sp3.setString(1,user.ID);
                    ResultSet sr3 = sp3.executeQuery();

                    StudentCur scur = new StudentCur();
                    scur.GetStuCurList(sr3);
                    user.cur = scur;
                    sr3.close();sp3.close();

                    //写入session
                    session.setAttribute("user",user);
                    db.CloseAll();
                    response.sendRedirect("student-index.jsp");
                }


                else {
                    System.out.println("不明身份登录！");
                }
            }
            else {
                //错误信息提示
                servletContext.setAttribute("message","用户名或密码错误！");
                servletContext.setAttribute("flag","visible");
                db.CloseAll();
                response.sendRedirect("index.jsp");

            }

        }
        catch (Exception e){
            System.out.println("错误信息:"+e.getMessage());
            e.printStackTrace();
        }
    }
    public void destroy(HttpServletRequest request, HttpServletResponse response)throws SQLException, NamingException {
        System.out.println("数据库关闭！");
    }
}
