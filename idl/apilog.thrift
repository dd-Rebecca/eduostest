include "base.thrift"
include "common.thrift"

struct ListAPILogsFilter {
    // 根据日志内容做全文筛选
    1: optional string Content,
    // 根据API发布环境筛选
    2: optional list<string> EnvironmentIDs,
    // 根据API响应状态码筛选
    3: optional list<i32> Status,
    // 检索日志开始时间，格式：2006-01-02 15:04:05
    4: optional string StartTime,
    // 检索日志结束时间，格式：2006-01-02 15:04:05
    5: optional string EndTime,
    // 是否仅仅检索出error的日志
    6: optional bool IsErrorLog,
    // 根据APIID筛选
    7: optional list<string> APIIDs,
    // 根据请求方法筛选
    8: optional list<string> Methods,
}

struct ListAPILogsRequest {
    // API所在工作空间ID
    1: required string WorkSpaceID,
    2: optional common.ListOption ListOpt
    3: optional ListAPILogsFilter Filter, // 筛选条件

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}

struct ListAPILogsResponse {
    // API调用日志列表
    1: required list<APILogItem> Items,
    // API调用日志总条目数量
    2: required i32 Total,

    255: base.BaseResp BaseResp,
}

struct APILogItem {
    // API日志ID
    1: required string ID,
    // API ID
    2: required string APIID,
    // API名称
    3: optional string APIName,
    // API编码
    4: optional string APIEncode,
    // API描述信息
    5: optional string APIDesc,
    // API版本
    6: required string APIVersion,
    // API发布环境ID
    7: required string EnvironmentID,
    // API发布环境名称
    8: required string EnvironmentName,
    // API请求信息
    9: required APIRequestInfo Request,
    // API响应信息
    10: required APIResponseInfo Response,
    // API响应时长，单位ms
    11: required i32 Duration,
    // API请求地址
    12: required string ClientIP,
    // 请求时间
    13: required string StartTime,
    // 关联路由ID
    14: required string RouteID,
    // 关联服务ID
    15: optional string ServiceID,
    // API所在工作空间ID
    16: required string WorkSpaceID,
    // 时间戳
    17: required string TimeStamp,
    // 消费者
    18: optional string ConsumerName,
}

struct APIRequestInfo {
    // API请求头
   1: optional map<string,string> Headers,
   // API请求body，json字符串
   2: optional string Body,
   // API请求方法
   3: required string Method,
   // API请求url
   4: required string URL,
   // API请求uri
   5: required string URI,
   // API请求params
   6: optional map<string,string> QueryString,
   // API请求内容大小
   7: required i32 Size,
}

struct APIResponseInfo {
    // API响应头
    1: optional map<string,string> Headers,
    // API响应body，json字符串
    2: optional string Body,
    // API响应状态码
    3: required i32 Status,
    // API响应内容大小
    4: required i32 Size,
}

struct GetAPILogRequest {
   // API日志ID
   1: required string ID,
   // 工作空间ID
   2: required string WorkSpaceID,

   /** Top相关的参数，前端不需要处理*/
   254: required base.TopParam Top,
   255: base.Base Base,
}

struct GetAPILogResponse {
    // API日志详情内容
    1: required APILogItem Item,

    255: base.BaseResp BaseResp,
}