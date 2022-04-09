package com.junefw.infra.common.util;


import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class UtilCookie {
	
	private Map cookieMap = new java.util.HashMap();
	
    public UtilCookie(HttpServletRequest httServletRequest) {
        Cookie[] cookies = httServletRequest.getCookies();
        if (cookies != null) {
            for (int i = 0 ; i < cookies.length ; i++) {
                cookieMap.put(cookies[i].getName(), cookies[i]);
            }
        }
    }
    
    
    
    
    
    public static Cookie createCookie(String name, String value) throws Exception {
        return new Cookie(name, URLEncoder.encode(value, "euc-kr"));
    }
	
    public static Cookie createCookie(
            String name, String value,  
            String domain, String path, int maxAge) 
    throws IOException {
        Cookie cookie = new Cookie(name, 
                  URLEncoder.encode(value, "euc-kr"));
        cookie.setDomain(domain);
        cookie.setPath(path);
        cookie.setMaxAge(maxAge);
        return cookie;
    }
    
    public Cookie getCookie(String name) {
        return (Cookie)cookieMap.get(name); 
    }
    
    public String getValue(String name) throws IOException {
        Cookie cookie = (Cookie)cookieMap.get(name);
        if (cookie == null) return null;
        return URLDecoder.decode(cookie.getValue(), "euc-kr");
    }
    
    public boolean exists(String name) {
        return cookieMap.get(name) != null;
    }
    
}
