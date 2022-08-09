package com.slog.driver.constants;

import java.text.SimpleDateFormat;
import java.util.Locale;

/**
 * Created by ourdevelops Team on 10/23/2020.
 */

public class Constant {

    //private static final String BASE_URL = "https://slogfy.xyz/";
    private static final String BASE_URL = "https://indraenterprise.com/";
    public static final String FCM_KEY = "AAAApYGF4yQ:APA91bH6q7Msp3YwTbW1-3grJHUiZN387AMk1CdTLHNaLXlqmikeIQlS1bXvlfK0BvvPb7yrVnw9jRybgdL3TzZvjxLX2eaYRvXJ-e9Hfn_k7bAJ7ZgI7LssR8Srf83pTZ86IaBq3S3R";

    public static final String CONNECTION = BASE_URL + "api/";
    public static final String IMAGESFITUR = BASE_URL + "images/service/";
    public static final String IMAGESBANK = BASE_URL + "images/bank/";
    public static final String IMAGESDRIVER = BASE_URL + "images/driverphoto/";
    public static final String IMAGESUSER = BASE_URL + "images/customer/";
    public static final String IMAGESMERCHANT = BASE_URL + "images/merchant/";
    public static String CURRENCY = "";

    public static long duration;
    public static Double LONGITUDE;
    public static String LOCATION;

    public static String TOKEN = "token";

    public static String USERID = "uid";

    public static String PREF_NAME = "pref_name";

    public static int permission_camera_code = 786;
    public static int permission_write_data = 788;
    public static int permission_Read_data = 789;
    public static int permission_Recording_audio = 790;

    public static SimpleDateFormat df =
            new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.ENGLISH);
    public static String versionname = "1.0";


}
