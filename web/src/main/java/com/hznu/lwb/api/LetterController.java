package com.hznu.lwb.api;

import com.hznu.lwb.model.Letter;
import com.hznu.lwb.model.param.LetterParam;
import com.hznu.lwb.model.result.ApiResult;
import com.hznu.lwb.service.ILetterService;
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
public class LetterController {

    @Resource
    private ILetterService letterService;

    @RequestMapping(value = "/selectRecipientBySender",method = RequestMethod.GET)
    @ResponseBody
    public ApiResult selectRecipientBySender(String senderId){
        ApiResult apiResult = letterService.selectRecipientBySender(senderId);
        return apiResult;
    }

    @RequestMapping(value = "/selectLetterByBoth",method = RequestMethod.GET)
    @ResponseBody
    public ApiResult selectLetterByBoth(LetterParam letterParam){
        ApiResult apiResult = letterService.selectByBoth(letterParam);
        return apiResult;
    }

    @RequestMapping(value = "/insertLetter",method = RequestMethod.POST)
    @ResponseBody
    public ApiResult insertLetter(Letter letter){
        ApiResult apiResult = letterService.insert(letter);
        return apiResult;
    }

    @RequestMapping(value = "/deleteLetter",method = RequestMethod.DELETE)
    @ResponseBody
    public ApiResult deleteLetter(Integer letterId){
        ApiResult apiResult = letterService.delete(letterId);
        return apiResult;
    }

}
