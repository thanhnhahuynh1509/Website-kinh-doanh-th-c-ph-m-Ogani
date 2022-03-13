package com.ogani.helper;

import javax.servlet.http.HttpServletRequest;

public class AbsolutePath {
    public static String getAbsolutePath(HttpServletRequest request) {
        return request.getServletContext().getRealPath("/");
    }
}
