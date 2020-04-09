package com.jekeen.common.util;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

/**
 * @author wjy
 * @create 2019-02-22 下午 3:08
 **/
public class MyTool {
    /**
     * 获取UUID
     * @return 32位UUID
     */
    public static String getUUID(){
        return UUID.randomUUID().toString().replaceAll("-", "");
    }

    /**
     * 获取标准时间
     * @return yyyy-MM-dd HH:mm:ss
     */
    public static  String getStandardTime(){
        SimpleDateFormat formatTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return formatTime.format(new Date());
    }
    /**
     * 获取时间序列
     * @return yyyyMMddhhmmssSSS
     */
    public static  String getTimeSeries(){
        SimpleDateFormat formatTime = new SimpleDateFormat("yyyyMMddhhmmssSSS");
        return formatTime.format(new Date());
    }
    /**
     * 删除单个文件
     *
     * @param fileName
     *            要删除的文件的文件名
     * @return 单个文件删除成功返回true，否则返回false
     */
    public static boolean deleteFile(String fileName) {
        File file = new File(fileName);
        // 如果文件路径所对应的文件存在，并且是一个文件，则直接删除
        if (file.exists() && file.isFile()) {
            if (file.delete()) {
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }
}
