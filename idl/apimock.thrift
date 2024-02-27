include "base.thrift"
include "common.thrift"
include "base.thrift"

struct ParamCondition {
    // 参数名
    1: required string Name,
    // 条件
    2: required string Condition,
    // 参数值
    3: required string Value,
}

struct ResponseHeader {
    // 参数名
    1: required string Name,
    // 参数值
    3: required string Value,
}

struct APIMockItem {
    // id
    1: required string ID,
    // 所属API id
    2: required string APIID,
    // http code
    3: required string HttpCode,
    // mock场景
    4: required string Scene,
    // 参数条件
    5: required list<list<ParamCondition>> Params,
    // 参数条件
    6: required list<ResponseHeader> ResponseHeaders,
    // 参数条件
    7: required string ResponseBody,
    // 返回body Content-Type
    8: required string ResponseType,
    // 创建人
    9: required string CreateUser,
    // 创建时间
    10: required string CreateTime,
    // 更新人
    11: string UpdateUser,
    // 更新时间
    12: string UpdateTime,
}

struct CreateAPIMockRequest {
    // 所属API id
    1: required string APIID,
    // http code
    2: required string HttpCode,
    // mock场景
    3: required string Scene,
    // 参数条件
    4: required list<list<ParamCondition>> Params,
    // 参数条件
    6: optional list<ResponseHeader> ResponseHeaders,
    // 参数条件
    7: optional string ResponseBody,
    // 工作空间ID
    8: required string WorkSpaceID,
    // 返回body Content-Type
    9: required string ResponseType (go.tag = 'validate:"omitempty,oneof=JSON XML HTML Text"'),

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct CreateAPIMockResponse {
    1: string ID,

    255: base.BaseResp BaseResp,
}

struct UpdateAPIMockRequest {
    // id
    1: required string ID,
    // 所属API id
    2: required string APIID,
    // http code
    3: required string HttpCode,
    // mock场景
    4: required string Scene,
    // 参数条件
    5: required list<list<ParamCondition>> Params,
    // 参数条件
    6: optional list<ResponseHeader> ResponseHeaders,
    // 参数条件
    7: optional string ResponseBody,
    // 工作空间ID
    8: required string WorkSpaceID,
    // 返回body Content-Type
    9: required string ResponseType (go.tag = 'validate:"omitempty,oneof=JSON XML HTML Text"'),

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct UpdateAPIMockResponse {

    255: base.BaseResp BaseResp,
}

struct ListAPIMocksFilter {
    1: optional string HttpCode,
}
struct ListAPIMocksRequest {
    1: optional common.ListOption ListOpt,
    2: optional ListAPIMocksFilter Filter, // 筛选条件
    3: required string APIID, // API ID
    // 工作空间ID
    8: required string WorkSpaceID,

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct ListAPIMocksResponse {
    1: list<APIMockItem> Items, // API条目列表
    2: i32 Total, // 条目总数

    255: base.BaseResp BaseResp,
}

struct GetAPIMockRequest {
    1: required string ID,
    // 工作空间ID
    8: required string WorkSpaceID,

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct GetAPIMockResponse {
    1: APIMockItem APIMockDetail

    255: base.BaseResp BaseResp,
}

struct DeleteAPIMockRequest {
    1: required string ID,
    // 工作空间ID
    8: required string WorkSpaceID,

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct DeleteAPIMockResponse {

    255: base.BaseResp BaseResp,
}

struct CheckAPIMockInfoRequest {
    // 校验版本
    1: optional string HttpCode,
    // 校验编码时传Code
    2: required string APIID,
    // 工作空间ID
    8: required string WorkSpaceID,

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct CheckAPIMockInfoResponse {
    1: bool IsValid, // 参数是否合法
    2: list<string> InvalidReason, // 不合法原因, 多个字段不合法返回多个原因

    255: base.BaseResp BaseResp,
}

struct GetAPIMockAddressRequest {
    // api id
    1: optional string APIID,
    // 工作空间ID
    8: required string WorkSpaceID,

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct GetAPIMockAddressResponse {
    1: string MockAddress, // mock 地址

    255: base.BaseResp BaseResp,
}
