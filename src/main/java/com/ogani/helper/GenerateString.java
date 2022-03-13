package com.ogani.helper;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class GenerateString {
    public static String generate() {
        Timestamp date = new Timestamp(System.currentTimeMillis());
        SimpleDateFormat format = new SimpleDateFormat("dd0MM0yyyy0hh0mm0ss0S");
        return format.format(date);
    }
}
