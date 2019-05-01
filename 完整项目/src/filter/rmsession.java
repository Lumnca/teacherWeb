package filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



public class rmsession  implements Filter {
    private FilterConfig config;

    public void  init( FilterConfig config) throws ServletException {

        this.config = config;
    }
    public void  doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws java.io.IOException, ServletException
    {
        HttpServletResponse response = (HttpServletResponse)res;
        HttpServletRequest request = (HttpServletRequest)req;

        HttpSession session = request.getSession();

        if (session.getAttribute("user")!=null) {
           session.removeAttribute("user");
           session.invalidate();
           System.out.println("清除session成功！");
        }
        chain.doFilter(req,res);
    }
    public void destroy( ){
    }
}
