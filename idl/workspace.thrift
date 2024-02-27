include "base.thrift"
include "common.thrift"

struct CreateWorkSpaceRequest {
    // 名称
    1: required string Name(go.tag = 'validate:"resourceName"')
    // 空间所有人，传 IAM user id
    2: required string OwnerID
    // 描述
    3: optional string Description (go.tag = 'validate:"resourceDescription"')

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct CreateWorkSpaceResponse {
    1: string ID,

    255: base.BaseResp BaseResp,
}

struct UpdateWorkSpaceRequest {
    // ID
    1: required string ID,
    // 名称
    2: optional string Name (go.tag = 'validate:"optionalResourceName"')
    // 更新 Owner，传 IAM user id
    3: optional string OwnerID
    // 描述
    4: optional string Description (go.tag = 'validate:"resourceDescription"')


    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct UpdateWorkSpaceResponse {
    255: base.BaseResp BaseResp,
}

struct ListFilter {
    1: optional string Name // 名称，模糊搜索
}

struct ListWorkSpacesRequest {

    1: optional common.ListOption ListOpt
    3: optional ListFilter Filter, // 筛选条件

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}

struct WorkSpaceItem {
        1: required string ID,
        // 名称，即中文名
        2: required string Name
        // 描述
        3: optional string Description,
        // API 数量
        5: i64 APICount
        // 创建时间
        10: required string CreateTime,
        // 更新时间
        12: string UpdateTime,
}

struct WorkSpaceDetail {
        1: required string ID,
        // 名称，即中文名
        2: required string Name
        // 描述
        3: optional string Description,
        // 空间所有者名称
        4: string Owner
        // 空间所有者ID（IAM 的 UserID）
        5: string OwnerID
        // API 数量
        6: i64 APICount
        // API 全生命周期配置
        7: list<APIStatusNode> APIStatusNodes
        // API Mock配置
        8: required APIMockConfig APIMockConfig,

        // 创建人
        9: required string CreateUser,
        // 创建时间
        10: required string CreateTime,
        // 更新人
        11: string UpdateUser,
        // 更新时间
        12: string UpdateTime,
}


struct ListWorkSpacesResponse {
    1: list<WorkSpaceItem> Items, // 工作空间列表
    2: i32 Total, // 条目总数

    255: base.BaseResp BaseResp,
}

struct ListAllWorkSpacesRequest {

    1: optional common.ListOption ListOpt
    3: optional ListFilter Filter, // 筛选条件

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct ListAllWorkSpacesResponse {
    1: list<AllWorkSpaceItem> Items, // 工作空间列表
    2: i32 Total, // 条目总数

    255: base.BaseResp BaseResp,
}
struct AllWorkSpaceItem {
        1: required string ID,
        // 名称，即中文名
        2: required string Name
        // 描述
        3: optional string Description,
        // 创建时间
        10: required string CreateTime,
        // 更新时间
        12: string UpdateTime,
}

struct DeleteWorkSpaceRequest {
    1: required string ID,

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct DeleteWorkSpaceResponse {

    255: base.BaseResp BaseResp,
}

struct GetWorkSpaceRequest {
    1: required string ID,

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct GetWorkSpaceResponse {
    1: WorkSpaceDetail Item

    255: base.BaseResp BaseResp,
}

struct GetWorkSpaceAuthsRequest {
    // 工作空间 ID
    1: required string WorkSpaceID,
    // IAM 用户 ID
    2: required string UserID,

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct GetWorkSpaceAuthsResponse {
    // 已授权的功能模块列表
    // API管理：AUTH_API_MANAGEMENT
    // API测试：AUTH_API_TEST
    // 调用日志：AUTH_API_LOG
    // 监控统计：AUTH_API_METRICS
    // 预警通知：AUTH_API_ALERT
    // 空间配置：AUTH_WORKSPACE_CONFIG
    1: list<string> Items

    255: base.BaseResp BaseResp,
}



struct UpdateMemberAuthRequest {
    // 工作空间 ID
    1: required string WorkSpaceID,
    // 成员 ID
    2: required string MemberID,
    // 授权的功能模块列表
    // API管理：AUTH_API_MANAGEMENT
    // API测试：AUTH_API_TEST
    // 调用日志：AUTH_API_LOG
    // 监控统计：AUTH_API_METRICS
    // 预警通知：AUTH_API_ALERT
    // 空间配置：AUTH_WORKSPACE_CONFIG
    3: optional list<string> Auths

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}

struct AddMemberToWorkSpaceRequest {
    // 工作空间 ID
    1: required string WorkSpaceID,
    // IAM 用户ID
    2: required string UserID,
    // 授权的功能模块列表
    // API管理：AUTH_API_MANAGEMENT
    // API测试：AUTH_API_TEST
    // 调用日志：AUTH_API_LOG
    // 监控统计：AUTH_API_METRICS
    // 预警通知：AUTH_API_ALERT
    // 空间配置：AUTH_WORKSPACE_CONFIG
    3: optional list<string> Auths

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}

struct RemoveMemberFromWorkSpaceRequest {
    // 工作空间 ID
    1: required string WorkSpaceID,
    // 空间成员ID
    2: required string MemberID,

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}

struct EnvironmentInfo {
    // 环境名称，空间内唯一
    1: required string Name
    // 工作空间 ID
    2: required string WorkSpaceID
}

struct CheckWorkSpaceRequest {
    // 工作空间名称
    1: optional string Name,
    // 检查环境信息是否合法
//    2: optional EnvironmentInfo EnvironmentInfo,

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct CheckWorkSpaceResponse {

    1: required string ErrInfo,

    255: base.BaseResp BaseResp,
}

struct CheckSafelyDeletableRequset {
    // ID
    1: required string ID

    /** Top相关的参数*/
    254: required base.TopParam Top,
    255: optional base.Base Base,
}

struct CheckSafelyDeletableResponse {
    // 是否可以安全删除
    1: required bool IsSavelyDeletable

    // 不可删除的原因
    2: optional string Reason,
}

struct ListWorkSpaceMembersRequest {

    // 工作空间 ID
    1: required string WorkSpaceID
    2: optional common.ListOption ListOpt
    4: optional ListFilter Filter, // 筛选条件

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}

struct ListWorkSpaceMembersResponse {
    1: list<Member> Items, // 工作空间成员列表
    2: i32 Total, // 条目总数

    255: base.BaseResp BaseResp,
}

struct Member {
    // 成员 ID
    1: required string ID
    // 成员名称
    2: required string Name
    // IAM user id
    3: required string UserID
    // 中文名
    4: required string DisplayName
    // 授权的功能模块列表
    // API管理：AUTH_API_MANAGEMENT
    // API测试：AUTH_API_TEST
    // 调用日志：AUTH_API_LOG
    // 监控统计：AUTH_API_METRICS
    // 预警通知：AUTH_API_ALERT
    // 空间配置：AUTH_WORKSPACE_CONFIG
    5: optional list<string> Auths
    // 成员角色：owner-空间所有者，member-空间成员
    10: required string Role
}

// 空间API全生命周期配置
struct UpdateAPILifeCycleConfigRequest {
    // 工作空间 ID
    1: required string WorkSpaceID
    // API状态节点
    2: required list<APIStatusNode> APIStatusNodes(go.tag = 'validate:"dive"')

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}

// API 状态节点
struct APIStatusNode {
    // 节点类型: START/DESIGN/DEVELOP/PUBLISH/END
    1: required string Type(go.tag = 'validate:"oneof=START DESIGN DEVELOP PUBLISH END"')
}




struct APIMockConfig {
    1: required bool IfOpenMockAuth,   // 是否开启鉴权
    2: required string ApimToken,     // mock token
}

struct UpdateAPIMockConfigRequest{
    // 工作空间ID
    1: required string WorkSpaceID,
    // 是否开启Mock鉴权
    2: optional bool IfOpenMockAuth,
    // refresh mock token
    3: optional bool IfRefreshMockToken,

    254: required base.TopParam Top,
    255: base.Base Base,
}

struct UpdateAPIMockConfigResponse{

    255: base.BaseResp BaseResp
}
