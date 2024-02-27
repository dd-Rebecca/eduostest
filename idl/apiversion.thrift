include "base.thrift"
include "common.thrift"
include "apipublish.thrift"

struct APIParamItem {
    // 参数数据类型, string、number、boolean、object或array
    1: string Type,
    // 参数名
    2: string Name(go.tag = 'validate:"omitempty,apiParamName"'),
    // 是否必填
    3: optional bool IsRequired,
    // 参数示例值
    4: optional string ExampleValue(go.tag = 'validate:"omitempty,resourceDescription"'),
    // 参数说明
    5: optional string Note(go.tag = 'validate:"omitempty,resourceDescription"'),
    // 子结构体
    // 如果没有子结构体，即为空
    6: optional list<APIParamItem> Children
    // 是否虚节点，虚节点仅用于承接array类型的APIParamItem
    // 虚节点只有Type, Name, Children, IsVirtual有值
    7: bool IsVirtual,
}

struct APIVersionItemSimple {
    // 版本 id
    1: required string ID,
    // 版本号
    2: required string Version
    // 描述
    3: string Description,
    // 所属服务目录id
    4: required string CategoryID,
    // 所属空间id
    5: required string WorkSpaceID,
    // 状态
    6: required string Status,
    // 运行环境 id
    7: required list<string> EnvIDs,
    // 创建人
    9: required string CreateUser,
    // 创建时间
    10: required string CreateTime,
    // 更新人
    11: string UpdateUser,
    // 更新时间
    12: string UpdateTime,
}

struct APIVersionItem {
    // 版本id
    1: required string ID,
    // 名称，即中文名
    2: required string Name
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
    // Header参数配置
    13: list<APIParamItem> Headers,
    // Param参数配置
    14: list<APIParamItem> Params,
    // Body参数配置
    15: list<APIParamItem> Body,
    // Response参数配置
    16: list<APIParamItem> Response,
    // Body 枚举：JSON/XML
    17: string BodyExample,
    // Response 枚举：JSON/XML
    18: string ResponseExample,
    // 版本号
    19: string Version,
    // 版本状态
    20: string Status,
    // api id
    21: string APIID,
    // 运行环境 id
    22: required list<string> EnvIDs,
    // body type: none form-data x-www-form-urlencoded raw.JSON raw.XML raw.HTML raw.Text binary
    23: required string BodyType(go.tag = 'validate:"oneof=none form-data x-www-form-urlencoded raw.JSON raw.XML raw.HTML raw.Text binary"'),
    // response type: JSON XML HTML Text binary
    24: required string ResponseType(go.tag = 'validate:"oneof=JSON XML HTML Text binary"'),
}

struct CreateAPIVersionRequest {
    // 所属API id
    1: required string APIID,
    // 所属服务目录id
    2: required string CategoryID,
    // 所属空间id
    3: required string WorkSpaceID,
    // Header参数配置
    4: list<APIParamItem> Headers(go.tag = 'validate:"omitempty,dive"'),
    // Param参数配置
    5: list<APIParamItem> Params(go.tag = 'validate:"omitempty,dive"'),
    // Body参数配置
    6: list<APIParamItem> Body,
    // Response参数配置
    7: list<APIParamItem> Response,
    // Body json/xml框示例
    8: string BodyExample(go.tag = 'validate:"omitempty,apiParamExample"'),
    // Response json/xml框示例
    9: string ResponseExample(go.tag = 'validate:"omitempty,apiParamExample"'),
    // Body json/xml type
    10: string BodyType,
    // Response json/xml type
    11: string ResponseType,
    // 版本号
    12: required string Version,
    // 新建版本，需要传入原Version id
    13: optional string OriginVersionID,
    // 描述
    14: optional string Description (go.tag = 'validate:"resourceDescription"'),

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}

struct CreateAPIVersionResponse {
    1: string ID,

    255: base.BaseResp BaseResp,
}

struct UpdateAPIVersionRequest {
    // 版本 id
    1: required string ID,
    // 所属服务目录id
    2: optional string CategoryID,
    // Header参数配置，不传不更新，传了就是全量更新
    3: optional list<APIParamItem> Headers(go.tag = 'validate:"omitempty,dive"'),
    // Param参数配置，不传不更新，传了就是全量更新
    4: optional list<APIParamItem> Params(go.tag = 'validate:"omitempty,dive"'),
    // Body参数配置，不传不更新，传了就是全量更新
    5: optional list<APIParamItem> Body,
    // Response参数配置，不传不更新，传了就是全量更新
    6: optional list<APIParamItem> Response,
    // Body json/xml框示例
    7: optional string BodyExample(go.tag = 'validate:"omitempty,apiParamExample"'),
    // Response json/xml框示例
    8: optional string ResponseExample(go.tag = 'validate:"omitempty,apiParamExample"'),
    // Body json/xml type
    9: string BodyType,
    // Response json/xml type
    10: string ResponseType,
    // 是否暂存
    11: optional bool Temporary,
    // 描述
    12: optional string Description (go.tag = 'validate:"resourceDescription"'),
    // 工作空间ID
    13: required string WorkSpaceID,

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct UpdateAPIVersionResponse {

    255: base.BaseResp BaseResp,
}

struct ListAPIVersionsFilter {
    1: optional string Version, // 版本，模糊搜索
}
struct ListAPIVersionsRequest {
    1: optional common.ListOption ListOpt(go.tag = 'validate:"omitempty,dive"'),
    2: optional ListAPIVersionsFilter Filter, // 筛选条件
    5: required string APIID, // API ID
    6: required string WorkSpaceID, // 工作空间ID

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct ListAPIVersionsResponse {
    1: list<APIVersionItemSimple> Items, // API条目列表
    2: i32 Total, // 条目总数

    255: base.BaseResp BaseResp,
}

struct GetAPIVersionRequest {
    // 版本 id
    1: required string ID,
    // 工作空间ID
    2: required string WorkSpaceID,

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct GetAPIVersionResponse {
    1: APIVersionItem APIVersionDetail

    255: base.BaseResp BaseResp,
}

struct DeleteAPIVersionRequest {
    // 版本 id
    1: required string ID,
    2: required string APIID, // api id
    // 工作空间ID
    3: required string WorkSpaceID,

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct DeleteAPIVersionResponse {

    255: base.BaseResp BaseResp,
}

struct CheckAPIVersionInfoRequest {
    // 校验版本号
    1: optional string Version,
    // api id
    2: required string APIID,
    // 工作空间ID
    3: required string WorkSpaceID,

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct CheckAPIVersionInfoResponse {
    1: bool IsValid, // 参数是否合法
    2: list<string> InvalidReason, // 不合法原因, 多个字段不合法返回多个原因

    255: base.BaseResp BaseResp,
}


struct FinishDevelopRequest {
    // 版本 id
    1: required string ID,
    // api id
    2: required string APIID,
    // 工作空间ID
    3: required string WorkSpaceID,

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct FinishDevelopResponse {
}

struct ConsumerItem {
    // 消费者name，对应agw apisix消费者的username
    1: required string APISIXConsumerName,
    // 消费者用户名称
    2: required string ConsumerUserDisplayName,
    // 消费者名称，对应agw控制面消费者name
    3: required string ConsumerName
}

struct APIVersionRunningInstanceItemSimple {
    // API发布ID
    1: required string APIPublishID,
    // API发布环境ID
    2: required string EnvID,
    // API发布环境名称
    3: required string EnvName,
    // API发布对应的网关服务ID
    4: required string APIPublishServiceID,
    // API发布说明
    5: optional string APIPublishDesc,
    // 发布人
    6: required string APIPublishUser,
    // 发布时间
    7: required string APIPublishTime,
    // 发布环境对应的网关ID
    8: required string GatewayID,
    // 是否开启认证
    9: required bool AuthEnabled,
    // 认证插件信息
    10: optional apipublish.PluginItem AuthPluginInfo,
    // 消费者信息列表
    11: optional list<ConsumerItem> ConsumersInfo,
    // 消费者黑白名单插件id
    12: optional string ConsumerRestrictionPluginID,
}

struct ListAPIVersionRunningInstancesFilter {
    // 根据发布说明检索，支持前后去空格+模糊搜索
    1: optional string APIPublishDesc,
    // 根据环境ID过滤
    2: optional string EnvID,
}

struct ListAPIVersionRunningInstancesRequest {
    1: optional common.ListOption ListOpt(go.tag = 'validate:"omitempty,dive"'),
    2: optional ListAPIVersionRunningInstancesFilter Filter, // 筛选条件
    // API版本ID
    3: required string APIVersionID(go.tag='validate:"required"'),
    // 工作空间ID
    4: required string WorkSpaceID,

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}

struct ListAPIVersionRunningInstancesResponse {
    // API版本运行列表条目
    1: list<APIVersionRunningInstanceItemSimple> Items,
     // 条目总数
    2: i32 Total,

    255: base.BaseResp BaseResp,
}

struct ListAPIVersionContentRequest{
    1: required string APIID,

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}

struct ListAPIVersionContentResponse{
    1: required list<APIVersionContent> APIVersionContents,
    // 条目总数
    2: required i32 Total,

    /** Top相关的参数，前端不需要处理*/
    255: base.BaseResp BaseResp,
}

struct APIVersionContent {
    1: required string ID,
    2: required string Content,
    3: required string BodyExample,
    4: required string ResponseExample,
    5: required string BodyType,
    6: required string ResponseType,
    7: required string Version,
    8: required string Description,
}

struct ListAPIVersionPublishRequest {
    1: required string APIVersionID,

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}

struct ListAPIVersionPublishResponse {
    // API版本运行列表条目
    1: required list<APIVersionPublish> Items,
     // 条目总数
    2: required i32 Total,

    255: base.BaseResp BaseResp,
}

struct APIVersionPublish {
    // API发布ID
    1: required string ID,
    // API发布环境ID
    2: required string APIID,
    // API发布对应的网关服务ID
    3: required string ServiceID,
    // API发布对应的网关路由ID
    4: required string RouteID,
    // API发布对应的网关ID
    5: required string GatewayID,
    // API发布环境ID
    6: required string EnvID,
    // API发布版本ID
    7: required string VersionID,
    // API发布版本
    8: required string Version,
    // API发布说明
    9: optional string Description,
    // 是否开启认证
    10: required bool EnableIdentity,
    // 认证插件ID
    11: optional string IdentityPluginID,
    // 消费者黑白名单插件ID
    12: optional string ConsumerPluginID,
    // 认证插件配置ID
    13: required string IdentityPluginConfigID,
    // 消费者黑白名单插件配置ID
    14: required string ConsumerPluginConfigID,
    // 消费者列表
    15: optional list<APIVersionPublishConsumer> consumers,
    // 消费者列表
    16: required string CreateUser,
    // 消费者列表
    17: required string CreateTime,
}

struct APIVersionPublishConsumer {
    // 消费者ID
    1: required string ConsumerID,
}
