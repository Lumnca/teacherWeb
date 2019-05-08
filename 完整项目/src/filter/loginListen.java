package filter;


import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class loginListen implements Filter {
    public void  init(FilterConfig config) throws ServletException {

    }
    public void  doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws java.io.IOException, ServletException
    {
        HttpServletResponse response = (HttpServletResponse)res;     //获取http请求与相应报文
        HttpServletRequest request = (HttpServletRequest)req;

        HttpSession session = request.getSession();          //通过session会话来判断是否登录

        if (session.getAttribute("user")==null) {          //session会话对象对空，即没有登录成功
            ServletContext sc = request.getServletContext();
            sc.setAttribute("message","身份信息已过期，请重新登录！");
            sc.setAttribute("flag",true);
            response.sendRedirect("index.jsp");            //返回界面重新登录

            return;
        }
        else{
            chain.doFilter(req,res);                    //成功则把请求传回过滤链，必须含有
        }
    }
    public void destroy( ){
    }

}
