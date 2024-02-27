include "base.thrift"
include "common.thrift"
include "base.thrift"

struct APICodeItem {
    81: string ID,
    // 所属API id
    2: required string APIID,
    // http code
    5: required string HttpCode,
    // 业务编码
    6: optional string BizCode,
    // 描述
    7: required string Description,
    // Response参数配置
    8: optional string Response,
    // 创建人
    9: required string CreateUser,
    // 创建时间
    10: required string CreateTime,
    // 更新人
    11: string UpdateUser,
    // 更新时间
    12: string UpdateTime,
}

struct CreateAPICodeRequest {
    // 所属API id
    1: required string APIID,
    // http code
    4: required string HttpCode,
    // 业务编码
    5: optional string BizCode,
    // 描述
    6: required string Description (go.tag = 'validate:"resourceDescription"'),
    // Response参数配置
    7: optional string Response,
    // 工作空间ID
    8: required string WorkSpaceID,

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct CreateAPICodeResponse {
    1: string ID,

    255: base.BaseResp BaseResp,
}

struct UpdateAPICodeRequest {
    // id
    1: string ID,
    // http code
    2: required string HttpCode,
    // 业务编码
    3: optional string BizCode,
    // 描述
    4: required string Description (go.tag = 'validate:"resourceDescription"'),
    // Response参数配置
    5: optional string Response,
    // 工作空间ID
    6: required string WorkSpaceID,

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct UpdateAPICodeResponse {

    255: base.BaseResp BaseResp,
}

struct ListAPICodesFilter {
    1: optional string HttpCode, // http状态码，模糊搜索
}
struct ListAPICodesRequest {
    1: optional common.ListOption ListOpt,
    2: optional ListAPICodesFilter Filter, // 筛选条件
    3: required string APIID, // API ID
    // 工作空间ID
    4: required string WorkSpaceID,

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct ListAPICodesResponse {
    1: list<APICodeItem> Items, // API条目列表
    2: i32 Total, // 条目总数

    255: base.BaseResp BaseResp,
}
struct ListAllAPICodesRequest {
    1: required string APIID, // API ID

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct ListAllAPICodesResponse {
    1: list<APICodeItem> Items, // API条目列表
    2: i32 Total, // 条目总数

    255: base.BaseResp BaseResp,
}

struct GetAPICodeRequest {
    1: required string ID,
    // 工作空间ID
    2: required string WorkSpaceID,

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct GetAPICodeResponse {
    1: APICodeItem APICodeDetail

    255: base.BaseResp BaseResp,
}

struct DeleteAPICodeRequest {
    1: required string ID,
    // 工作空间ID
    2: required string WorkSpaceID,

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct DeleteAPICodeResponse {

    255: base.BaseResp BaseResp,
}

struct CheckAPICodeInfoRequest {
    // Http状态码
    1: optional string HttpCode,
    // API ID
    2: required string APIID,
    // 业务状态码
    3: optional string BizCode,
    // 工作空间ID
    4: required string WorkSpaceID,

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct CheckAPICodeInfoResponse {
    1: bool IsValid, // 参数是否合法
    2: list<string> InvalidReason, // 不合法原因, 多个字段不合法返回多个原因

    255: base.BaseResp BaseResp,
}
