package servlet;

import mysql.GetDb;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import userInfor.User;

import javax.jws.soap.SOAPBinding;
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

@WebServlet(name = "stuHwServlet")
public class stuHwServlet extends HttpServlet {
    // 上传文件存储目录
    private static final String UPLOAD_DIRECTORY = "StudentHw";

    // 上传配置因为所用单位都是B，所以换算到MB
    private static final int MEMORY_THRESHOLD   = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE      = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 50; // 50MB
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String fileName = "";
        String cName = "";
        String hwName = "";
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        String id = user.ID;

        if (!ServletFileUpload.isMultipartContent(request)) {

            PrintWriter writer = response.getWriter();// 如果不是则停止

            writer.println("没有选择文件，或者文件错误！");
            System.out.println("-");
            writer.flush();

            return;
        }

        // 配置上传参数
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // 设置内存临界值 - 超过后将产生临时文件并存储于临时目录中
        factory.setSizeThreshold(MEMORY_THRESHOLD);
        System.out.println();
        ServletContext sc = request.getServletContext();
        // 设置临时存储目录（根目录old）
        System.out.println();
        factory.setRepository(new File("old"));

        ServletFileUpload upload = new ServletFileUpload(factory);
        System.out.println();
        upload.setFileSizeMax(MAX_FILE_SIZE);
        System.out.println();
        upload.setSizeMax(MAX_REQUEST_SIZE);
        upload.setHeaderEncoding("UTF-8");
        String uploadPath = request.getServletContext().getRealPath("./") + File.separator + "StudentHw/"+user.ID;
        System.out.println(uploadPath);
        System.out.println();


        // 如果目录不存在则创建
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            System.out.println();
            uploadDir.mkdir();
        }

        try {
            // 解析请求的内容提取文件数据
            @SuppressWarnings("unchecked")
            List<FileItem> formItems = upload.parseRequest(request);
            System.out.println();

            if (formItems != null && formItems.size() > 0) {
                // 迭代表单数据
                int j = 0;
                for (FileItem item : formItems) {
                    // 处理不在表单中的字段
                    if (!item.isFormField()) {
                        fileName = new File(item.getName()).getName();
                        System.out.println(fileName);
                        System.out.println();
                        String filePath = uploadPath + File.separator + fileName;
                        File storeFile = new File(filePath);
                        System.out.println();
                        item.write(storeFile);
                        sc.setAttribute("message", "文件上传成功!");
                    }
                    else {
                        if(j==0){
                            hwName = item.getString().trim();
                            hwName = new String(hwName.getBytes("ISO8859_1"), "UTF-8");
                        }
                        else if(j==1) {
                            cName = item.getString().trim();
                            cName = new String(cName.getBytes("ISO8859_1"), "UTF-8");
                        }
                        else{

                        }
                        j++;
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
            PreparedStatement ps1 = db.conn.prepareStatement("insert into stuhw value(?,?,?,?,?)");

            ps1.setString(1,user.ID);
            ps1.setString(2,hwName);
            ps1.setString(3,cName);
            ps1.setString(4,fileName);
            Date now=new Date();
            SimpleDateFormat f=new SimpleDateFormat("yyyy/MM/dd");
            ps1.setString(5,f.format(now));

            ps1.executeUpdate();
            ps1.close();
            db.CloseAll();
        }
        catch (Exception e){
            System.out.println("错误信息："+e.getMessage());
            e.printStackTrace();
        }

        response.sendRedirect("index.jsp");
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
