include "base.thrift"
include "common.thrift"
include "base.thrift"


struct Node {
    // 域名或 IP
    1: required string Host (go.tag = 'validate:"required,hostname_rfc1123"'),
    // 端口
    2: required i32 Port (go.tag = 'validate:"required,min=0,max=65535"'),
}

struct PublishAPIVersionRequest {
    // 环境ID
    1: required string EnvID,
    // API版本ID
    2: required string VersionID,
    // API ID
    3: required string APIID,
    // 网关服务ID，选择已有服务是必传
    4: optional string serviceID,
    // 服务类型，自定义服务是必传，枚举值：K8S-容器服务,Fixed-固定后端
    5: optional string Type (go.tag = 'validate:"omitempty,oneof=K8S Fixed"')
    // 容器服务所在的 namespace，当服务类型为容器服务时必填
    6: optional string Namespace,
    // 容器服务名称
    7: optional string ServiceName,
    // 容器服务目标端口
    8: optional i32 ServiceTargetPort,
    // 固定后端服务节点列表，当服务类型为固定后端时必填
    9: optional list<Node> Nodes,
    // 容器服务集群
    10: optional string ConnectionSourceID,
    // 服务属性，枚举值：Existing-已有网关服务，Custom-自定义服务
    11: required string ServiceAttributes (go.tag = 'validate:"omitempty,oneof=Existing Custom"'),
    // 工作空间ID
    12: required string WorkSpaceID,
    // 发布ID，用于重新发布
    13: optional string ID,
    // 描述
    14: optional string Description (go.tag = 'validate:"omitempty,resourceDescription"'),
    // 是否开启身份认证
    15: required bool EnableIdentity,
    // 身份认证类型插件id
    16: optional string IdentityPluginID,
    // 消费者插件id
    17: optional string ConsumerPluginID,
    // apisix消费者名单name
    18: optional list<string> APISIXConsumerNames,
    // 服务名称，自定义服务时必传，对应网关服务的名称
    19: optional string Service(go.tag = 'validate:"omitempty,resourceName"'),
    // 版本链接，用于填写发布路由描述信息，方便从发布网关跳转到API版本详情
    20: optional string VersionLink,

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct PublishAPIVersionResponse {
    1: required string ID,

    255: base.BaseResp BaseResp,
}

struct GetPublishAPIVersionRequest {
    // 发布ID
    1: required string ID,
    // 工作空间ID
    8: required string WorkSpaceID,

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}

struct GetPublishAPIVersionResponse {
    // 环境ID
    1: required string EnvID,
    // API版本ID
    2: required string VersionID,
    // API ID
    3: required string APIID,
    // 网关服务ID，选择已有服务是必传
    4: optional string serviceID,
    // 服务类型，自定义服务是必传，枚举值：K8S-容器服务,Fixed-固定后端
    5: optional string Type (go.tag = 'validate:"omitempty,oneof=K8S Fixed"')
    // 容器服务所在的 namespace，当服务类型为容器服务时必填
    6: optional string Namespace,
    // 容器服务名称
    7: optional string ServiceName,
    // 容器服务目标端口
    8: optional i32 ServiceTargetPort,
    // 固定后端服务节点列表，当服务类型为固定后端时必填
    9: optional list<Node> Nodes,
    // 容器服务集群
    10: optional string ConnectionSourceID,
    // 服务属性，枚举值：Existing-已有网关服务，Custom-自定义服务
    11: required string ServiceAttributes (go.tag = 'validate:"omitempty,oneof=Existing Custom"'),
    // 工作空间ID
    12: required string WorkSpaceID,
    // 发布ID
    13: required string ID,
    // 描述
    14: optional string Description (go.tag = 'validate:"omitempty,resourceDescription"'),
    // 是否开启身份认证
    15: required bool EnableIdentity,
    // 身份认证类型id
    16: optional string IdentityPluginID,
    // 消费者名单id
    17: optional list<string> APISIXConsumerNames,

    255: base.BaseResp BaseResp,
}

struct ShutoffAPIVersionRequest {
    1: required string EnvID, // 环境ID
    2: required string VersionID, // 服务目录ID
    3: required string APIID, // API ID
    4: required string WorkSpaceID, // 工作空间ID

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct ShutoffAPIVersionResponse {
    255: base.BaseResp BaseResp,
}

// 校验服务名重复
struct CheckServiceNameDuplicatedRequest {
    // 名称
    1: required string Name,
    // 网关ID
    2: required string GatewayID,

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct CheckServiceNameDuplicatedResponse {

    1: required bool IsDuplicated,

    255: base.BaseResp BaseResp,
}

struct ServiceResponse {
    // 服务 ID
    1: required string ID,
    // 网关 ID
    2: required string GatewayID,
    // 服务名称
    3: required string Name,
    // 服务类型，枚举值：K8S-容器服务,Fixed-固定后端
    4: required string Type,
    // 容器集群 ID，当服务类型为容器服务时必填
    5: optional string ContainerClusterID,
}

struct ListServiceFilter {
    // 服务名称
    1: optional string Name,
    // 服务 id 列表
    2: optional list<string> IDs
}

struct ListServicesRequest {
    // 页码
    1: optional i32 PageNumber = 1 (go.tag = 'json:"PageNumber" default:"1" validate:"omitempty,gte=0"'),
    // 页大小
    2: optional i32 PageSize = 100 (go.tag = 'json:"PageSize" default:"100" validate:"omitempty,gte=0'),
    // Service筛选条件
    3: optional ListServiceFilter Filter,
    // 排序字段
    4: list<common.Sorter> Sort,
    // 网关 ID
    5: required string GatewayID,

    /** Top相关的参数*/
    254: required base.TopParam Top,
    255: base.Base Base,
}

struct ListServicesResponse {
    /** 服务列表 */
    1: list<ServiceResponse> Items,
    /** 总条目数 */
    2: i32 Total,

    255: base.BaseResp BaseResp,
}

struct ContainerCluster {
    1: required string ID,
    // 名称
    2: required string Name
}

struct ListContainerClusterFilter {
    1: optional string Name, // 名称，模糊搜索
}
struct ListContainerClustersRequest {
    1: optional i32 PageNumber = 1 (go.tag = 'json:"PageNumber" default:"1" validate:"omitempty,gte=0"'), // 页码
    2: optional i32 PageSize = 100 (go.tag = 'json:"PageSize" default:"100" validate:"omitempty,gte=0'), // 页大小
    3: optional ListContainerClusterFilter Filter, // ContainerCluster筛选条件
    4: list<common.Sorter> Sort, // 排序字段

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct ListContainerClustersResponse {
    1: list<ContainerCluster> Items, // ContainerCluster集群条目列表
    2: i32 Total, // 条目总数

    255: base.BaseResp BaseResp,
}

struct ListContainerClusterServicesRequest {
    // 容器集群连接源ID
    1: required string ContainerClusterID (go.tag='validate:"required"'),

    /** Top相关的参数*/
    254: required base.TopParam Top,
    255: optional base.Base Base,
}

struct NamespaceServices {
    // 命名空间
    1: string Namespace,
    // 服务列表
    2: list<string> ServiceNameList,
}

struct ListContainerClusterServicesResponse {
    1: list<NamespaceServices> NamespaceServicesList,

    255: base.BaseResp BaseResp,
}

struct ListAvailablePluginFilter {
    // 根据插件名称筛选
    1: optional string PluginName,
    // 根据插件功能类型筛选, 比如认证插件则["AUTHENTICATION"]
    2: optional list<string> PluginFeatureTypes,
    // 根据插件编码筛选，比如获取消费者黑白名单插件则["consumer-restriction"]
    3: optional list<string> PluginEncodes,
}

struct ListAvailablePluginsRequest {
    // 工作空间ID
    1: required string WorkspaceID(go.tag = 'validate:"required"'),
    // 环境ID
    2: required string EnvID(go.tag = 'validate:"required"'),
    // 分页页码
    3: optional i32 PageNumber = 1 (go.tag = 'json:"PageNumber" default:"1" validate:"omitempty,gte=0"'),
    // 分页大小
    4: optional i32 PageSize = 100 (go.tag = 'json:"PageSize" default:"100" validate:"omitempty,gte=0'),
    // 过滤条件
    5: optional ListAvailablePluginFilter Filter,

    /** Top相关的参数*/
    254: required base.TopParam Top,
    255: optional base.Base Base,
}

struct PluginItem {
    // 插件ID
    1: required string PluginID,
    // 插件名称
    2: required string PluginName,
    // 插件图标路径
    3: required string PluginIconPath,
}

struct ListAvailablePluginsResponse {
    1: required list<PluginItem> Items,

    // 总条目
    2: required i32 Total,

    255: optional base.Base Base,
}

struct ListAPIPublishPluginConfigsFilter {
    // 根据插件名称筛选
    1: optional string PluginName,
    // 根据插件功能类型筛选
    2: optional list<string> PluginFeatureType,
    // 排除插件列表
    3: optional list<string> ExcludePlugins,
}

struct ListAPIPublishPluginConfigsRequest {
    // api发布ID
    1: required string APIPublishID(go.tag = 'validate:"required"'),
    // 分页页码
    2: optional i32 PageNumber = 1 (go.tag = 'json:"PageNumber" default:"1" validate:"omitempty,gte=0"'),
    // 分页大小
    3: optional i32 PageSize = 100 (go.tag = 'json:"PageSize" default:"100" validate:"omitempty,gte=0'),
    // 过滤条件
    4: optional ListAPIPublishPluginConfigsFilter Filter,
    // 工作空间ID
    8: required string WorkSpaceID,

    /** Top相关的参数*/
    254: required base.TopParam Top,
    255: optional base.Base Base,
}

struct PluginConfigInfo {
    // 插件ID
    1: required string PluginID,
    // 插件名称
    2: required string PluginName,
    // 插件功能类型
    3: required string PluginFeatureType,
    // 插件编码
    4: required string PluginEncode,
    // 插件图标
    5: required string PluginIconPath,
    // 插件配置启禁用状态
    6: required bool Enabled,
    // 插件配置
    7: optional string Config,
    // 插件配置ID
    8: optional string PluginConfigID,
    // 插件配置创建时间
    9: optional i64 CreateTime,
}

struct ListAPIPublishPluginConfigsResponse {
    // 网关ID
    1: required string GatewayID,
    // 对象类型
    2: required string UsingType,
    // 对象ID
    3: required string UsingObjectID,
    // 该对象下所有的插件配置信息
    4: required list<PluginConfigInfo> Items,
    // 总条目
    5: required i32 Total,

    255: optional base.Base Base,
}

struct EnableAPIPublishPluginConfigRequest {
    // API发布ID
    1: required string APIPublishID(go.tag = 'validate:"required"'),
    // 插件配置是否启用
    2: required bool Enabled,
    // 插件ID
    3: required string PluginID(go.tag = 'validate:"required"'),
    // 插件具体配置, 可选，首次启用时必填
    4: optional string Config
    // 插件配置ID， 可选，非首次启用时必填
    5: optional string PluginConfigID,
    // 工作空间ID
    8: required string WorkSpaceID,

    /** Top相关的参数*/
    254: required base.TopParam Top,
    255: optional base.Base Base,
}

struct EnableAPIPublishPluginConfigResponse {
    // 插件配置ID
    1: required string PluginConfigID

    255: optional base.Base Base,
}

struct UpdateAPIPublishPluginConfigRequest {
    // API发布ID
    1: required string APIPublishID(go.tag = 'validate:"required"'),
    // 插件配置ID
    2: required string PluginConfigID(go.tag = 'validate:"required"'),
    // 插件具体更新配置
    3: required string Config(go.tag = 'validate:"required"'),
    // 工作空间ID
    8: required string WorkSpaceID,

    /** Top相关的参数*/
    254: required base.TopParam Top,
    255: optional base.Base Base,
}

struct UpdateAPIPublishPluginConfigResponse {
    255: optional base.Base Base,
}

struct DeleteAPIPublishPluginConfigRequest {
    // API发布ID
    1: required string APIPublishID(go.tag = 'validate:"required"'),
    // 插件配置ID
    2: required string PluginConfigID(go.tag = 'validate:"required"'),
    // 工作空间ID
    8: required string WorkSpaceID,

    /** Top相关的参数*/
    254: required base.TopParam Top,
    255: optional base.Base Base,
}

struct DeleteAPIPublishPluginConfigResponse {
    255: optional base.Base Base,
}

struct UpdatePublishedConsumerRequest {
    1: required string keyAuthID,
    2: required i64 UserID,
    3: required list<string> EnvIDs,
    4: required list<string> APIIDs,
    5: required bool Added, // 添加还是移除消费者

    /** Top相关的参数*/
    254: required base.TopParam Top,
    255: optional base.Base Base,
}


struct UpdatePublishedConsumerResponse {
    255: optional base.Base Base,
}
