package com.ogani.helper;

public class StarHelper {

    public static String getStars(float star) {
        StringBuilder stars = new StringBuilder();
        int tmp = (int)star;
        for(int i = 0; i < tmp; i++) {
            stars.append("star,");
        }
        if(tmp < star) {
            stars.append("star-half-o,");
            tmp++;
        }
        for(int i = 5; i > tmp; i--) {
            stars.append("star-o,");
        }
        return stars.toString();
    }
}
