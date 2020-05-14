package com.hznu.utils;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.common.collect.Lists;
import com.google.gson.*;
import com.google.gson.reflect.TypeToken;
import org.apache.commons.lang3.StringUtils;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

public class GsonUtil {

    public static String objectToJson(Object object) {
        GsonBuilder gsonBuilder = new GsonBuilder();
        Gson gson = gsonBuilder.create();
        return gson.toJson(object);
    }

    public static String objectToJsonString(Object object) {
        GsonBuilder gsonBuilder = new GsonBuilder();
        Gson gson = gsonBuilder.create();
        return gson.toJson(object);
    }

    public static <T> T jsonToObject(String json, Class<T> c) {
        T t = null;
        try {
            Gson gson = new Gson();
            t = gson.fromJson(json, c);
        } catch (Exception e) {
        	e.printStackTrace();
        }
        return t;
    }
    
    /**
     * @param json
     * @param typeToken:new TypeToken<Map<String,Object>>(){}
     * @return
     */
    public static <T> T jsonToType(String json, TypeToken<?> typeToken) {
        T t = null;
        try {
            Gson gson = new Gson();
            t = gson.fromJson(json, typeToken.getType());
        } catch (Exception e) {
        	e.printStackTrace();
        }
        return t;
    }

    // public static <T> List<T> jsonToList(String json, Class<T> c) {
    // List<T> list = null;
    // try {
    // Gson gson = new Gson();
    // list = gson.fromJson(json, new TypeToken<ArrayList<T>>() {
    // }.getType());
    // } catch (Exception e) {
    // // TODO: handle exception
    // }
    // return list;
    // }

    public static <T> List<T> jsonToList(String json, Class<T> c) {

        List<T> list = Lists.newArrayList();
        if (StringUtils.isBlank(json)) {
            return list;
        }

        Gson gson = new Gson();

        // 通过JsonParser对象可以把json格式的字符串解析成一个JsonElement对象
        JsonElement el = new JsonParser().parse(json);

        // 把JsonElement对象转换成JsonArray
        JsonArray jsonArray = new JsonArray();
        if (el.isJsonArray()) {
            jsonArray = el.getAsJsonArray();
        }
        // 遍历JsonArray对象
        Iterator<?> it = jsonArray.iterator();
        while (it.hasNext()) {
            JsonElement e = (JsonElement) it.next();
            // JsonElement转换为JavaBean对象
            list.add(gson.fromJson(e, c));
        }
        return list;
    }


    public static JsonNode strToJson(String str){
        ObjectMapper mapper = new ObjectMapper();
        try {
            return mapper.readTree(str);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
}


