package com.hznu.lwb.api;

import com.hznu.lwb.model.Notice;
import com.hznu.lwb.model.UserViewNoticeKey;
import com.hznu.lwb.model.result.ApiResult;
import com.hznu.lwb.service.INoticeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * @author 斌
 */
@Controller
@RequestMapping("/api")
public class NoticeController {

    @Resource
    private INoticeService noticeService;

    @RequestMapping(value = "/selectNoticeByPrimaryKey",method = RequestMethod.GET)
    @ResponseBody
    public ApiResult selectNoticeByPrimaryKey(Integer noticeId){
        ApiResult apiResult = noticeService.selectByPrimaryKey(noticeId);
        return apiResult;
    }

    @RequestMapping(value = "/selectNoticeByAdmin",method = RequestMethod.GET)
    @ResponseBody
    public ApiResult selectNoticeByAdmin(String userId){
        ApiResult apiResult = noticeService.selectByAdmin(userId);
        return apiResult;
    }

    @RequestMapping(value = "/selectAllNotice",method = RequestMethod.GET)
    @ResponseBody
    public ApiResult selectAllNotice(){
        ApiResult apiResult = noticeService.selectAll();
        return apiResult;
    }

    @RequestMapping(value = "/insertNotice",method = RequestMethod.POST)
    @ResponseBody
    public ApiResult insertNotice(Notice notice){
        ApiResult apiResult = noticeService.insertNotice(notice);
        return apiResult;
    }

    @RequestMapping(value = "/insertNoticeUserRelationship",method = RequestMethod.POST)
    @ResponseBody
    public ApiResult insertNoticeUserRelationship(UserViewNoticeKey userViewNoticeKey){
        ApiResult apiResult = noticeService.insertRelation(userViewNoticeKey);
        return apiResult;
    }

    @RequestMapping(value = "/updateNotice",method = RequestMethod.POST)
    @ResponseBody
    public ApiResult updateNotice(Notice notice){
        ApiResult apiResult = noticeService.updateNotice(notice);
        return apiResult;
    }

    @RequestMapping(value = "/deleteNotice",method = RequestMethod.DELETE)
    @ResponseBody
    public ApiResult deleteNotice(Integer noticeId){
        ApiResult apiResult = noticeService.deleteNotice(noticeId);
        return apiResult;
    }
}
