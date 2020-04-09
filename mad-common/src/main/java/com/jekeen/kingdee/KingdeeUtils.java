//package com.jekeen.kingdee;
//
//import com.alibaba.fastjson.JSONObject;
//import org.springframework.http.HttpHeaders;
//import org.springframework.http.MediaType;
//
//import java.util.ArrayList;
//import java.util.List;
//
///**金蝶工具类
// * @author wjy
// * @create 2019-07-13 上午 10:45
// **/
//public class KingdeeUtils {
//    /**
//     * kingdee 用户校验Url
//     */
//    public final static String validateUser_url="http://localhost:8087/api/kingdee/validateUser";
//    /**
//     * 街景域名
//     */
//    public final static String JEKEEN_URL ="https://jiejing-888.test.ik3cloud.com";
//    /**
//     * 帐套Id，字符串类型（必录）
//     */
//    public final static String acctID ="20190129143421";
//    /**
//     * 用户名称，字符串类型（必录）
//     */
//    public final static String username ="administrator";
//    /**
//     * 用户密码，字符串类型（必录）
//     */
//    public final static String password ="112233a$";
//    /**
//     * 语言标识，整型（非必录）
//     */
//    public final static String lcid ="2052";
//    /**
//     * kdservice-sessionid
//     */
//    public static String kdservice_sessionid ="";
//    /**
//     * 用户登录
//     */
//    public final static String KINGDEE_VALIDATEUSER_URL =JEKEEN_URL + "/k3cloud/Kingdee.BOS.WebApi.ServicesStub.AuthService.ValidateUser.common.kdsvc";
//    /**
//     * 单据查询
//     */
//    public final static String KINGDEE_EXECUTEBILLQUERY_URL =JEKEEN_URL + "/k3cloud/Kingdee.BOS.WebApi.ServicesStub.DynamicFormService.ExecuteBillQuery.common.kdsvc";
//    /**
//     * Save 保存接口
//     */
//    public final static String KINGDEE_SAVE_URL =JEKEEN_URL + "/K3Cloud/Kingdee.BOS.WebApi.ServicesStub.DynamicFormService.Save.common.kdsvc";
//    /**
//     * Submit 提交接口
//     */
//    public final static String KINGDEE_SUBMIT_URL =JEKEEN_URL + "/K3Cloud/Kingdee.BOS.WebApi.ServicesStub.DynamicFormService.Submit.common.kdsvc";
//    /**
//     * Audit 审核接口
//     */
//    public final static String KINGDEE_AUDIT_URL =JEKEEN_URL + "/K3Cloud/Kingdee.BOS.WebApi.ServicesStub.DynamicFormService.Audit.common.kdsvc";
//    /**
//     *生产订单执行
//     */
//    public final static String KINGDEE_EXCUTEOPERATION_URL =JEKEEN_URL + "/K3Cloud/Kingdee.BOS.WebApi.ServicesStub.DynamicFormService.ExcuteOperation.common.kdsvc";
//
//    /**
//     * 获取 HttpHeaders
//     * @return HttpHeaders
//     */
//    public static HttpHeaders getHttpHeaders() {
//        HttpHeaders headers = new HttpHeaders();
//        MediaType type = MediaType.parseMediaType("application/json; charset=UTF-8");
//        headers.setContentType(type);
//        //添加cookies
//        List<String> cookieList = new ArrayList<String>();
//        cookieList.add("kdservice-sessionid=" + kdservice_sessionid);
//        //将cookie放入header
//        headers.put(HttpHeaders.COOKIE,cookieList);
//        return headers;
//    }
//    /**
//     * 登录
//     * @return json
//     */
//    public static String ValidateUser(){
//        JSONObject json = new JSONObject();
//        json.put("acctID", acctID);
//        json.put("username", username);
//        json.put("password", password);
//        json.put("lcid", lcid);
//        return json.toString();
//    }
//
//    /**
//     * 单据查询
//     * @param StartRow  开始行索引 （非必录）
//     * @param Limit  最大行数（非必录）
//     * @param FormId 业务对象表单Id（必录）
//     * @param FilterString 过滤条件，字符串类型（非必录）
//     * @param FieldKeys 需查询的字段key集合，字符串类型，格式："key1,key2,..." （必录）
//     * @return
//     */
//    public static String ExecuteBillQuery(Integer StartRow,Integer Limit, String FormId,String FilterString,String FieldKeys){
////        {
////            "data":{
////            "Limit": 100,
////                    "StartRow": 0,
////                    "FilterString":"FNUMBER in ('WB010101A008','WB010101A016','WB010101A012') or FNAME='矩形管-碳钢-镀锌-40*80*1.5*6000'",
////                    "FormId" :"BD_MATERIAL",
////                    "FieldKeys":"FNUMBER,FNAME"
////        }
////        }
//
//        JSONObject json = new JSONObject();
//
//        JSONObject dataJson = new JSONObject();
//        if(null != StartRow){
//            dataJson.put("StartRow", StartRow);
//        }
//        if(null != Limit){
//            dataJson.put("Limit", Limit);
//        }
//        if(null != FilterString){
//            dataJson.put("FilterString", FilterString);
//        }
//        dataJson.put("FormId", FormId);
//        dataJson.put("FieldKeys", FieldKeys);
//
//        json.put("data",dataJson);
//        return json.toString();
//    }
//}
