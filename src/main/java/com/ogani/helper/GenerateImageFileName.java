package com.ogani.helper;

import javax.servlet.http.Part;
import java.io.File;

public class GenerateImageFileName {
    public static String generate(Part part) {
        String[] files = new File(part.getSubmittedFileName()).getName().split("[.]");
        String name = files[0];
        String extension = files[files.length - 1];

        return name + GenerateString.generate() + "." + extension;
    }
}
