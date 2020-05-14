package com.hznu.lwb.service.init;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @author zxu
 */
public class Init {
    private static Logger logger = LoggerFactory.getLogger(Init.class);

    public static void init() {

        org.apache.log4j.Logger htalkLog = org.apache.log4j.Logger.getLogger("com.hznu.htalk");


        logger.debug("Init.init======================Init.init");
    }
}