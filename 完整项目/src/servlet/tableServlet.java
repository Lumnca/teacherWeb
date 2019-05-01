package servlet;



import com.alibaba.fastjson.JSON;
import extcl.Table;
import extcl.TableData;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Workbook;
import userInfor.User;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

public class tableServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        ServletContext app = request.getServletContext();
        String createUrl = app.getRealPath("excel");
        Workbook wb = new HSSFWorkbook();
        List<TableData> data = JSON.parseArray(request.getParameter("tableData"),TableData.class);
        Table.Insert(data,wb,createUrl);
        request.setAttribute("flag","s");

        HttpSession session = request.getSession();
        User u = (User)session.getAttribute("user");


        if("studnet".equals(u.sfn)){
             response.sendRedirect("student-table.jsp");
        }
        else{
            response.sendRedirect("teacher-table.jsp");
        }


    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
    doPost(request,response);
    }

    public void destroy(HttpServletRequest request, HttpServletResponse response)throws ServletException {
        request.removeAttribute("flag");

    }
}
