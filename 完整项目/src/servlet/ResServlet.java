package servlet;

import mysql.GetDb;
import userInfor.*;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet(name = "ResServlet")
public class ResServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();

        User user = (User)session.getAttribute("user");

        ServletContext servletContext = request.getServletContext();


        GetDb db = new GetDb();
        try {
            //登录查询
            PreparedStatement ps = db.conn.prepareStatement("select count(*),name,id,sex,iden,tel,school,per_message,pw from users where id=? and pw =?");
            ps.setString(1,user.ID);
            ps.setString(2,user.getPassword());

            ResultSet rs = ps.executeQuery();
            int flag = 0;
            while(rs.next())
            {
                flag = rs.getInt(1);
            }
            ps.close();
            //用户存在
            if(flag==1)
            {
                PreparedStatement ps1 = db.conn.prepareStatement("select count(*),name,id,sex,iden,tel,school,per_message,pw from users where id=? and pw =?");
                ps1.setString(1,user.ID);
                ps1.setString(2,user.getPassword());

                ResultSet rs1 = ps1.executeQuery();
                //填装用户数据
                User use = null;
                while (rs1.next()){
                    use = new User(rs1.getString(3),rs1.getString(2),rs1.getString(9), rs1.getString(5));
                    use.infor = rs1.getString(8);

                    use.tel = rs1.getString(6);
                    use.school = rs1.getString(7);
                    use.sex = rs1.getString(4);
                }

                ps1.close();
                //不同用户登录

                /*
                 *教师身份
                 *
                 */
                if(use.sfn.equals("Teacher")){
                    System.out.println(use.sfn+"身份登录");
                    PreparedStatement p2 = db.conn.prepareStatement("select * from tea_data where id = ?");

                    p2.setString(1,use.ID);

                    ResultSet r2 = p2.executeQuery();

                    teacherData td = new teacherData();
                    td.GetInfor(r2);

                    r2.close();p2.close();

                    //---------更新选课数----------------
                    PreparedStatement p3 = db.conn.prepareStatement("select count(*) from tea_course where id = ?");
                    p3.setString(1,use.ID);
                    ResultSet r3 = p3.executeQuery();
                    int curnum = 0;
                    while (r3.next()){
                        td.classNum = r3.getInt(1);
                        curnum = td.classNum;
                    }
                    r3.close();p3.close();

                    //---------------更新选课人数---------------
                    PreparedStatement p5 = db.conn.prepareStatement("select count(*) from stu_course,tea_course where ( tea_course.cno =  stu_course.cno) and ( tea_course.cno in (select cno from tea_course where id = ? ) )");
                    p5.setString(1,use.ID);
                    ResultSet r5 = p5.executeQuery();
                    while (r5.next()){
                        td.stuNum = r5.getInt(1);
                    }
                    r5.close();p5.close();
                    //--------------------------------------

                    //数据装载user
                    use.data =  td;
                        /*
                        教师课程信息
                         */
                    TeacherCur tcur = new TeacherCur(use.ID,use.Name,curnum);
                    PreparedStatement p4 = db.conn.prepareStatement("select * from  tea_course where id = ?");
                    p4.setString(1,use.ID);
                    ResultSet r4 = p4.executeQuery();

                    //信息装载
                    tcur.GetInfro(r4);
                    use.cur = tcur;


                    //-----------------写入Session-------------------
                    db.CloseAll();
                    session.setAttribute("user",use);
                    response.sendRedirect("teacher-index.jsp");
                }


                //学生信息
                else if(use.sfn.equals("Student")){
                    System.out.println(use.sfn+"身份登录");

                    //-----学生各项信息
                    PreparedStatement sp1 = db.conn.prepareStatement("select * from stu_data where id = ?");
                    sp1.setString(1,use.ID);
                    ResultSet sr1 = sp1.executeQuery();
                    studentData stu_data = new studentData();
                    //数据装载
                    stu_data.GetInfor(sr1);
                    sr1.close();sp1.close();

                    //选课数
                    PreparedStatement sp2 = db.conn.prepareStatement("select count(*) from stu_course where id = ?");
                    sp2.setString(1,use.ID);
                    ResultSet sr2 = sp2.executeQuery();
                    if(sr2.next()){
                        stu_data.classNum = sr2.getInt(1);
                    }
                    sr2.close();sp2.close();

                    //作业提交数：
                    PreparedStatement p3 = db.conn.prepareStatement("select count(*) from stuhw where id =? ");
                    p3.setString(1,use.ID);
                    ResultSet rs3 = p3.executeQuery();
                    if(rs3.next()){
                        stu_data.workNum = rs3.getInt(1);
                    }
                    rs3.close();p3.close();

                    use.data = stu_data;

                        /*
                        学生选课
                         */

                    PreparedStatement sp3 = db.conn.prepareStatement("select users.name,cname,stu_course.cno,sex,school from  stu_course,tea_course,users where tea_course.cno = stu_course.cno and tea_course.id = users.id and stu_course.id = ?");
                    sp3.setString(1,use.ID);
                    ResultSet sr3 = sp3.executeQuery();

                    StudentCur scur = new StudentCur();
                    scur.GetStuCurList(sr3);
                    use.cur = scur;
                    sr3.close();sp3.close();

                    //写入session
                    session.setAttribute("user",use);
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
                response.sendRedirect("index.jsp");

            }
            db.CloseAll();
        }
        catch (Exception e){
            System.out.println("错误信息:"+e.getMessage());
            e.printStackTrace();
        }
        finally {

        }
    }
}
