package com.hznu.utils;

import java.util.UUID;

/**
 * UUIDGenerator
 *
 * @author xuzou
 * @date 15/12/2
 * @copyright: copyright @ hznuTech 2015
 */
public class UUIDGenerator {

    //generator a uuid
    public static String getUUID() {
        UUID uuid = UUID.randomUUID();
        String str = uuid.toString();
        String temp = str.substring(0, 8) + str.substring(9, 13) + str.substring(14, 18) + str.substring(19, 23) + str.substring(24);
        return temp;
    }

    //generate the number of uuid
    public static String[] getUUID(int number) {
        if (number < 1) {
            return null;
        }
        String[] ss = new String[number];
        for (int i = 0; i < number; i++) {
            ss[i] = getUUID();
        }
        return ss;
    }
}

