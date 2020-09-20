package com.kh.oherp.filter;


import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.oherp.entity.MemberDto;

@WebFilter(urlPatterns = {
	      })
public class AdminFilter implements Filter {
   
   @Override
   public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
         throws IOException, ServletException {
      
      
      HttpServletRequest req = (HttpServletRequest)request;
      HttpServletResponse resp = (HttpServletResponse)response;
      
      
      MemberDto mdto =(MemberDto)req.getSession().getAttribute("userinfo");
      
      boolean isLogin = mdto != null;
      if(!isLogin) {
         resp.sendRedirect(req.getContextPath()+"/member/login.jsp");
         return;
      }
      
      if(mdto.getMember_position().contentEquals("관리자")) {
         chain.doFilter(request, response);
      }else{
         resp.sendError(403);
      }
      
      
   }

}