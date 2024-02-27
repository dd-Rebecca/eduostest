include "base.thrift"
include "common.thrift"
include "base.thrift"
include "apiversion.thrift"

struct APIItem {
    1: required string ID,
    // 名称，即中文名
    2: required string Name,
    // 描述
    3: string Description,
    // 所属服务目录id
    4: required string CategoryID,
    // 所属空间id
    5: required string WorkSpaceID,
    // 请求方法
    6: required string RequestMethod,
    // 请求路径
    7: required string RequestURL,
    // 编码，即英文名
    8: required string Code,
    // 创建人
    9: required string CreateUser,
    // 创建时间
    10: required string CreateTime,
    // 更新人
    11: string UpdateUser,
    // 更新时间
    12: string UpdateTime,
    // 状态
    13: string Status,
    // 版本，默认展示最新版本
    14: string Version,
    // 所属服务目录信息
    15: required common.SimpleInfo CategoryInfo,
    // 是否开启mock
    16: bool IsOpenMock,
    // 类型,自定义：Custom ，idl导入：IDL
    17: required string Type,
    // 所属工作空间信息
    18: required common.SimpleInfo WorkspaceInfo,
}

struct CreateAPIRequest {
    // 名称
    1: required string Name(go.tag = 'validate:"resourceName"'),
    // 描述
    2: optional string Description(go.tag = 'validate:"omitempty,resourceDescription"'),
    // 所属服务目录id
    3: required string CategoryID,
    // 所属空间id
    4: required string WorkSpaceID,
    // 请求方法，例如GET、POST
    5: required string RequestMethod,
    // 请求路径
    6: required string RequestURL(go.tag = 'validate:"apiPath"'),
    // 编码，即英文名
    7: required string Code,

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct CreateAPIResponse {
    1: string ID,
    2: string VersionID,

    255: base.BaseResp BaseResp,
}

struct UpdateAPIRequest {
    1: required string ID,
    // 名称，即中文名
    2: optional string Name(go.tag = 'validate:"omitempty,optionalResourceName"')
    // 描述
    3: optional string Description(go.tag = 'validate:"omitempty,resourceDescription"'),
    // 编码，即英文名
    4: optional string Code,
    // 所属服务目录id
    5: optional string CategoryID,
    // 是否开启mock开关
    6: optional bool IsOpenMock,
    // 工作空间ID
    7: required string WorkSpaceID,


    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct UpdateAPIResponse {

    255: base.BaseResp BaseResp,
}

struct Keyword {
    1: required list<string> Fields, // 当下只支持api id、code、name、description字段
    2: required string Value,
}

struct ListAPIsFilter {
    1: optional string Name, // 名称，模糊搜索
    2: optional list<string> IDs, // api ids
    3: optional string Method, // 请求方法
    4: optional string URL, // 请求路径
    5: optional bool IsOpenMock, // 是否过滤mock开关
    6: optional Keyword Keyword, // API关键词搜索，当下支持API名称、编码
}

struct ListAPIsRequest {
    1: optional common.ListOption ListOpt(go.tag = 'validate:"omitempty,dive"'),
    2: optional ListAPIsFilter Filter, // 筛选条件
    3: required string WorkSpaceID, // 空间ID
    4: list<string> CategoryIDList, // 服务目录ID

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct ListAPIsResponse {
    1: list<APIItem> Items, // API条目列表
    2: i32 Total, // 条目总数

    255: base.BaseResp BaseResp,
}

struct GetAPIRequest {
    1: required string ID,
    // 工作空间ID
    2: required string WorkSpaceID,

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct GetAPIResponse {
    1: APIItem APIDetail

    255: base.BaseResp BaseResp,
}

struct DeleteAPIRequest {
    1: required string ID,
    2: required string CategoryID, // 服务目录ID
    // 工作空间ID
    3: required string WorkSpaceID,

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct DeleteAPIResponse {

    255: base.BaseResp BaseResp,
}

struct CheckAPIInfoRequest {
    // 校验名称时传Name
    1: optional list<string> Name,
    // 校验编码时传Code
    2: optional list<string> Code,
    // 工作空间ID
    3: optional string WorkSpaceID,
    // 服务目录ID
    4: optional string CategoryID,
    // 请求方法
    5: optional list<string> APIMethodPaths, // api method+path

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}

struct APIInvalid{
    1: required string Key, // api name code method+apth
    2: required string Reason, // 错误原因
}

struct CheckAPIInfoResponse {
    1: bool IsValid, // 参数是否合法
    2: list<APIInvalid> APINameInvalids, // name不合法原因, 多个字段不合法返回多个原因
    3: list<APIInvalid> APICodeInvalids, // code不合法原因, 多个字段不合法返回多个原因
    4: list<APIInvalid> APIMethodPathInvalids, // method+path不合法原因, 多个字段不合法返回多个原因

    255: base.BaseResp BaseResp,
}

struct ImportAPIRequest {
    // 所属空间id
    1: required string WorkSpaceID,
    // 服务目录id
    2: required string CategoryID,
    // 用户自定义API信息
    3: required list<UserCustomizeAPIInfo> UserCustomizeAPIInfos,
    // 源文件信息
    4: required string APIData,

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}

struct ImportAPIResponse {
    1: required string TaskID, // 任务ID

    255: base.BaseResp BaseResp,
}

struct UserCustomizeAPIInfo{
    // 原API Name ，用method+path表示
    1: required string OriginAPIName,
    // 用户自定义API编码
    2: required string APICode,
    // 用户自定义API名称
    3: required string APIName,
    // 用户自定义API描述
    4: optional string Description,
}

struct GetAPIRequestMethodRequest {

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct GetAPIRequestMethodResponse {
    1: list<string> APIRequestMethodList

    255: base.Base BaseResp,
}

struct AuthorizedAPIItem {
    1: required string ID
    // API 名称
    2: required string Name
    // API 编码
    3: required string Code
    // API 请求方法
    4: required string RequestMethod
    5: required common.SimpleInfo WorkSpace
    6: required common.SimpleInfo Category

}
struct ListAuthorizedAPIsFilter {
    1: optional string APIName
    2: optional string APICode
}
struct ListAuthorizedAPIsRequest {
    1: optional common.ListOption ListOpt(go.tag = 'validate:"omitempty,dive"'),
    2: optional ListAuthorizedAPIsFilter Filter

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct ListAuthorizedAPIsResponse {
    1: list<AuthorizedAPIItem> Items,
    2: i32 Total, // 条目总数

    255: base.BaseResp BaseResp,
}

struct EnvItem {
    // 环境ID
    1: required string ID
    // 环境名称
    2: required string Name
    3: required list<APIPublishItem> APIPublishs
}
struct APIPublishItem {
    1: required string APIPublishID
    // API版本名称
    2: required string APIVersion
    // API版本ID
    3: required string APIVersionID
}
struct ListAuthorizedEnvAndAPIVersionsRequest {
    1: required string APIID

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct ListAuthorizedEnvAndAPIVersionsResponse {
    1: list<EnvItem> Items,
    2: i32 Total, // 条目总数

    255: base.BaseResp BaseResp,
}

struct BasicAuthInfo {
    1: required string Username
    2: required string Password
}
struct KeyAuthInfo {
    1: required string Key
}
struct AuthInfo {
    1: optional BasicAuthInfo BasicAuth
    2: optional KeyAuthInfo KeyAuth
}
struct AuthorizedAPIVersionDetail {
    1: apiversion.APIVersionItem detail
    2: AuthInfo AuthInfo
}
struct GetAuthorizedAPIVersionRequest {
    1: required string APIPublishID

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct GetAuthorizedAPIVersionResponse {
    1: required AuthorizedAPIVersionDetail item

    255: base.BaseResp BaseResp,
}

struct ListAllAPIsFilter {
    1: optional string Name, // 名称，模糊搜索
    2: optional list<string> IDs, // api ids
    3: optional list<string> WorkspaceIDs, // ws ids
    4: optional Keyword Keyword, // 支持api id、code、name、description等字段进行关键词检索
}

struct ListAllAPIsRequest {
    1: optional common.ListOption ListOpt(go.tag = 'validate:"omitempty,dive"'),
    2: optional ListAllAPIsFilter Filter, // 筛选条件

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}

struct ListAllAPIsResponse {
    1: list<APIItem> Items, // API条目列表
    2: i32 Total, // 条目总数

    255: base.BaseResp BaseResp,
}

struct GetAPIImportJobRequest {
    1: required string TaskID,
    2: required string WorkSpaceID,

    254: required base.TopParam Top,
    255: base.Base Base,
}

struct GetAPIImportJobResponse {
    4: required string ErrorMsgs,
    5: required string Status,

    255: base.BaseResp BaseResp,
}