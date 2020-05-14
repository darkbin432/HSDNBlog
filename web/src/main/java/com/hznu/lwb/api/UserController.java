//package com.hznu.lwb.api;
//
//import com.hznu.lwb.ApplicationController;
//import com.hznu.lwb.model.result.ApiResult;
//import com.hznu.lwb.service.IUserService;
//import org.apache.shiro.SecurityUtils;
//import org.apache.shiro.authc.AuthenticationException;
//import org.apache.shiro.authc.UsernamePasswordToken;
//import org.apache.shiro.subject.Subject;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import javax.annotation.Resource;
//import javax.servlet.http.HttpServletRequest;
//
///**
// * UserController 用户信息
// *
// * @author xuzou
// * @date 16/6/12
// * @copyright: copyright @ hznuTech 2016
// */
//@Controller
//@RequestMapping("/api")
//public class UserController extends ApplicationController {
//
//    private static final String FORMATE_DATE = "yyyy-MM-dd";
//
//    @Resource
//    private IUserService userService;
//
//    @RequestMapping(value = "/login",method = RequestMethod.POST)
//    @ResponseBody
//    public ApiResult login(User user, HttpServletRequest request) {
//        Subject subject = SecurityUtils.getSubject();
//        UsernamePasswordToken token = new UsernamePasswordToken(user.getUsername(), user.getPassword());
//        ApiResult apiResult = new ApiResult();
//        try {
//            subject.login(token);
//            apiResult = userService.login(user);
//            if (apiResult.getStatus() == 200){
//                request.getSession().setAttribute("User", apiResult.getData());
//            }
//        } catch (AuthenticationException e) {
//            apiResult.fail("帐号或密码错误");
//        }
//        return apiResult;
//    }
//
//    @RequestMapping(value = "/updatePersonalInfo" ,method = RequestMethod.POST)
//    @ResponseBody
//    public ApiResult updatePersonalInfo(User user){
//        ApiResult apiResult = userService.updatePersonalInfo(user);
//        return apiResult;
//    }
//
//}
