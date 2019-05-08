package servlet;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import mysql.GetDb;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import userInfor.User;

@WebServlet(name = "teaHwServlet")
public class teaHwServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // 上传文件存储目录
    private static final String UPLOAD_DIRECTORY = "TeacherHw";

    // 上传配置因为所用单位都是B，所以换算到MB
    private static final int MEMORY_THRESHOLD   = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE      = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 50; // 50MB
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");


        String name = "";
        String cname = "";
        String file = "";
        String date = "";

        if (!ServletFileUpload.isMultipartContent(request)) {
            // 如果不是则停止
            PrintWriter writer = response.getWriter();
            writer.println("没有选择文件，或者文件错误！");
            writer.flush();
            return;
        }

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        // 配置上传参数
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // 设置内存临界值 - 超过后将产生临时文件并存储于临时目录中
        factory.setSizeThreshold(MEMORY_THRESHOLD);
        ServletContext sc = request.getServletContext();
        // 设置临时存储目录（根目录old）
        factory.setRepository(new File("old"));

        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setFileSizeMax(MAX_FILE_SIZE);

        upload.setSizeMax(MAX_REQUEST_SIZE);


        // 构造临时路径来存储上传的文件
        // 这个路径相对当前应用的目录
        String uploadPath = request.getServletContext().getRealPath("./") + File.separator + "TeacherHw/"+user.ID;
        System.out.println(uploadPath);
        upload.setHeaderEncoding("UTF-8");

        // 如果目录不存在则创建
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        try {
            // 解析请求的内容提取文件数据
            @SuppressWarnings("unchecked")
            List<FileItem> formItems = upload.parseRequest(request);

            if (formItems != null && formItems.size() > 0) {
                // 迭代表单数据
                int i = 0;
                for (FileItem item : formItems) {
                    // 处理不在表单中的字段
                    if (!item.isFormField()) {
                        String fileName = new File(item.getName()).getName();
                        String filePath = uploadPath + File.separator + fileName;
                        file = fileName;
                        File storeFile = new File(filePath);
                        // 在控制台输出文件的上传路径

                        // 保存文件到硬盘
                        item.write(storeFile);
                        sc.setAttribute("message",
                                "文件上传成功!");
                    }
                    else {
                        if(i==0){
                            name = item.getString();
                            name = new String(name.getBytes("ISO8859_1"), "UTF-8");
                        }
                        else if(i==1) {
                            cname = item.getString();
                            cname = new String(cname.getBytes("ISO8859_1"), "UTF-8");
                        }
                        else  if(i==2){
                            date = item.getString();
                            date = new String(date.getBytes("ISO8859_1"), "UTF-8");
                        }
                        else{

                        }
                        i++;
                    }
                }
            }
        } catch (Exception ex) {
            //设置全局变量，可在jsp界面访问
            sc.setAttribute("message",
                    "错误信息: " + ex.getMessage());
        }

        sc.setAttribute("flag",true);

        GetDb db = new GetDb();
        try {
            PreparedStatement ps1 = db.conn.prepareStatement("insert into hw value(?,?,?,?,default,?)");

            ps1.setString(1,name);
            ps1.setString(2,user.ID);
            ps1.setString(3,cname);
            ps1.setString(4,file);
            ps1.setString(5,date);

            System.out.println(name+":"+cname);
            ps1.executeUpdate();
            ps1.close();
            db.CloseAll();
        }
        catch (Exception e){
            System.out.println("错误信息："+e.getMessage());
            e.printStackTrace();
        }

        response.sendRedirect("ResServlet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doPost(request, response);
    }
}
