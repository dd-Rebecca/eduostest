include "base.thrift"
include "common.thrift"

struct TestAPIHistoryHeaderItem {
    // 参数名
    1: required string Name(go.tag = 'validate:"omitempty,apiParamName"'),
    // 参数值
    2: optional string Value(go.tag = 'validate:"omitempty,apiHeaderValue"'),
    // 是否启用
    3: optional bool IsEnabled
}

struct TestAPIHistoryParamItem {
    // 参数名
    1: required string Name(go.tag = 'validate:"omitempty,apiParamName"'),
    // 参数值
    2: optional string Value(go.tag = 'validate:"omitempty,resourceDescription"'),
    // 是否启用
    3: optional bool IsEnabled
}

struct TestAPIHistoryAuthParam {
    // auth 类型，BasicAuth
    1: required string Type(go.tag = 'validate:"oneof=BasicAuth"')
    // 参数名/用户名
    2: required string Name,
    // 参数值/密码
    3: required string Value(go.tag = 'validate:"omitempty,resourceDescription"'),
    // 位置, KeyAuth 时必填，枚举值：Header、Param
    4: optional string Location(go.tag = 'validate:"omitempty,oneof=Header Param"'),
}

struct TestAPIHistoryBodyParam {
    // 参数名
    1: required string Name(go.tag = 'validate:"apiParamName"'),
    // 参数值
    2: optional string Value(go.tag = 'validate:"omitempty"'),
    // 参数类型，枚举值：Text、File
    3: required string Type(go.tag = 'validate:"oneof=Text File"'),
    // 文件名，当参数类型是File时必填
    4: optional string FileName(go.tag = 'validate:"omitempty,resourceDescription"'),
    // 是否启用
    5: optional bool IsEnabled
}

struct TestAPIHistoryBody {
    // Body类型，枚举值：none、form-data、x-www-form-urlencoded、binary、raw
    1: required string Type(go.tag = 'validate:"omitempty,oneof=none form-data x-www-form-urlencoded binary raw"'),
    // Body子类型，当Body类型是raw时必填，枚举值：Text、JSON、XML、HTML
    2: optional string SubType(go.tag = 'validate:"omitempty,oneof=Text JSON XML HTML"'),
    // Body内容 json/xml/binary
    3: optional string Content,
    // Body参数，当Body类型是form-data、x-www-form-urlencoded时必填
    4: optional list<TestAPIHistoryBodyParam> Params(go.tag = 'validate:"omitempty,dive"'),
    // Body文件名，当Body类型是binary时必填
    5: optional string FileName(go.tag = 'validate:"omitempty,resourceDescription"'),
    // Body大小超出限制时，返回限制大小
    6: optional i64 ExceedSizeLimit,
}

struct TestAPIHistoryRequest {
    // Header参数配置
    1: optional list<TestAPIHistoryHeaderItem> Headers(go.tag = 'validate:"omitempty,dive"'),
    // Param参数配置
    2: optional list<TestAPIHistoryParamItem> Params(go.tag = 'validate:"omitempty,dive"'),
    // 认证信息
    3: optional TestAPIHistoryAuthParam Authorization
    // Body
    4: optional TestAPIHistoryBody Body
}

struct TestAPIHistoryResponse {
    // Header参数配置
    1: optional list<TestAPIHistoryHeaderItem> Headers(go.tag = 'validate:"omitempty,dive"'),
    // http status code
    2: optional i32 StatusCode
    // 响应时长
    3: optional i64 CostTime,
    // body 大小，单位 Byte
    4: optional i64 BodySize,
}

struct TestAPIHistoryAPISimple {
    1: required string ID,
    // 所属空间id
    2: required string WorkSpaceID,
    // 请求方法，枚举值：GET、POST、PUT、DELETE
    3: required string RequestMethod,
    // 请求路径
    4: required string RequestURL,
    // 请求完整路径
    5: required string RequestFullURL,
    // API id
    6: required string APIID,
    // API version id
    7: required string VersionID,
    // Env id
    8: required string EnvID,
    // 创建人
    9: required string CreateUser,
    // 创建时间
    10: required string CreateTime,
    // 更新人
    11: string UpdateUser,
    // 更新时间
    12: string UpdateTime,
    // Response
    13: required TestAPIHistoryResponse Response,
}

struct TestAPIHistoryItem {
    1: required string ID,
    // 所属空间id
    2: required string WorkSpaceID,
    // 请求方法，枚举值：GET、POST、PUT、DELETE
    3: required string RequestMethod,
    // 请求路径
    4: required string RequestURL,
    // 请求完整路径
    5: required string RequestFullURL,
    // API id
    6: required string APIID,
    // API version id
    7: required string VersionID,
    // Env id
    8: required string EnvID,
    // 创建人
    9: required string CreateUser,
    // 创建时间
    10: required string CreateTime,
    // 更新人
    11: string UpdateUser,
    // 更新时间
    12: string UpdateTime,
    // Reqeust
    13: required TestAPIHistoryRequest Request,
    // Response
    14: required TestAPIHistoryResponse Response,
}

struct CreateTestAPIHistoryRequest {
    // 所属空间id
    1: required string WorkSpaceID,
    // 请求方法，枚举值：GET、POST、PUT、DELETE
    2: required string RequestMethod(go.tag = 'validate:"oneof=GET POST PUT DELETE"'),
    // 请求路径
    3: required string RequestURL(go.tag = 'validate:"apiPath"'),
    // 请求完整路径
    4: required string RequestFullURL,
    // API id
    5: required string APIID,
    // API version id
    6: optional string VersionID,
    // Env id
    7: required string EnvID,
    // Reqeust
    8: required TestAPIHistoryRequest Request,
    // Response
    9: required TestAPIHistoryResponse Response,

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct CreateTestAPIHistoryResponse {
    1: string ID,

    255: base.BaseResp BaseResp,
}

struct UpdateTestAPIHistoryRequest {
    1: required string ID,
    // body 大小，单位 Byte
    2: optional i64 BodySize,

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct UpdateTestAPIHistoryResponse {

    255: base.BaseResp BaseResp,
}

struct ListTestAPIHistoriesRequest {
    1: optional common.ListOption ListOpt(go.tag = 'validate:"omitempty,dive"'),
    2: required string WorkSpaceID, // 空间ID
    3: optional string LastID, // 上次返回的最后一个ID，用于支持滚动加载，查询结果不包含该ID数据

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct ListTestAPIHistoriesResponse {
    1: list<TestAPIHistoryAPISimple> Items, // API条目列表
    2: i32 Total, // 条目总数

    255: base.BaseResp BaseResp,
}

struct GetTestAPIHistoryRequest {
    1: required string ID,
    // 工作空间ID
    2: required string WorkSpaceID,

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct GetTestAPIHistoryResponse {
    1: TestAPIHistoryItem TestAPIHistoryDetail

    255: base.BaseResp BaseResp,
}

struct DeleteTestAPIHistoriesRequest {
    // 所属空间id
    1: required string WorkSpaceID,
    // 待删除的测试历史ID列表，不传时清空当前用户当前空间下的测试历史
    2: optional list<string> IDs,

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct DeleteTestAPIHistoriesResponse {

    255: base.BaseResp BaseResp,
}
