package com.zytboa.filter;


import com.zytboa.vo.User;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by Administrator on 2017/3/22.
 */
public class LoginFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse resp = (HttpServletResponse) servletResponse;
        HttpSession session = req.getSession();
        String path = req.getRequestURI();
        User user = (User) session.getAttribute("user");
        if(path.indexOf("login") > -1){
            filterChain.doFilter(req,resp);
            return;
        }else if(path.contains(".css") || path.contains(".js") || path.contains("img") || path.contains("fonts")){
            filterChain.doFilter(req,resp);
        }else{
            if(user == null){
                resp.sendRedirect(req.getContextPath()+"/login");
            }else{
                filterChain.doFilter(req,resp);
            }
        }
    }

    @Override
    public void destroy() {

    }
}
