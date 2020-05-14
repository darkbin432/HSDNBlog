package com.hznu.lwb;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

import com.google.common.collect.Maps;


public class ApplicationController {
    @Autowired
    protected HttpServletRequest request;
//    @Autowired
//    protected HttpServletResponse response;

    protected ModelAndView buildMAV(String page) {
        return buildMAV(page,"main_layout");
//        return buildMAV(page,"");
    }

    public ModelAndView buildMAV(String page, String layout) {
        ModelAndView mav = new ModelAndView(layout);
        mav.addObject("view", page);
        Map<String, String> requestContext = Maps.newHashMap();
        requestContext.put("contextPath", request.getContextPath());
        mav.addObject("rc", requestContext);
        mav.addObject("contextPath", request.getContextPath());
        return mav;
    }

    private Subject getCurrentSubject() {
        return SecurityUtils.getSubject();
    }

    protected void currentSubjectLogout() {
        try {
            getCurrentSubject().logout();
        } catch (Exception e) {
            System.out.print("登出失败");
        }
    }

    protected String getRealPath() {
        return request.getSession().getServletContext().getRealPath("/");
    }
}
