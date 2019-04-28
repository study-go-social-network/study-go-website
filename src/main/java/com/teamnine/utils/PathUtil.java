package com.teamnine.utils;

import java.io.IOException;

public class PathUtil {

    private static String commonPath;    // common path
    private static String serverPath;    // server path

    public static String getCommonPath() {

        serverPath = System.getProperty("catalina.home");
        commonPath = serverPath + PropertyUtil.getPropertiesPath().getProperty("webapps");
        return commonPath;
    }

    /**
     * @return
     * @throws IOException String
     * @function: the image of the article save path
     * @date 2019.02.09 19:22:50
     */
    public static String getArticlePath() {

        return PropertyUtil.getPropertiesPath().getProperty("articlePath");
    }

    /**
     * @return
     * @throws IOException String
     * @function: the avatar save path
     * @date 2019.02.09 19:23:40
     */
    public static String getUserPath() {

        return PropertyUtil.getPropertiesPath().getProperty("userPath");
    }
}
