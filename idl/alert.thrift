include "base.thrift"
include "common.thrift"

struct AlertTargetSimple {
    // 通知对象类型，specified=指定用户，api_creator=api创建人
    1: required string Type,
    // IAM用户ID
    2: list<string> UserIDs,
}

struct AlertTarget {
    // 通知对象类型，specified=指定用户，api_creator=api创建人
    1: required string Type,
    // IAM用户信息
    2: required list<common.SimpleInfo> UserInfoList,
}

// 条件
struct Condition {
    // 参数名
    // request_uri=请求uri，server_addr=服务ip地址，http_latency=响应时长，status_code=状态码
    // success_rate=请求成功率，average_http_latency=平均响应时长，max_http_latency=最大响应时长
    // fail_count=请求失败次数，count_by_ip=相同ip请求次数
    1: required string Key,
    2: required string Expression, // 表达式
    3: required string Value, // 值
}

// 条件组
struct ConditionGroup {
    1: list<Condition> Conditions
}

struct AlertStrategySimple {
    1: required string ID,
    // 策略名称
    2: required string Name,
    // 类型
    3: required string Type,
    // 内容
    4: required string Content,
    // 通知对象
    5: required list<AlertTarget> AlertTargetList,
    // 预警开始时间
    6: required string BeginTime,
    // 预警结束时间
    7: optional string EndTime,
    // 触发次数
    8: required i32 AlertCount,
    // 创建人
    9: required string CreateUser,
    // 创建时间
    10: required string CreateTime,
    // 更新人
    11: string UpdateUser,
    // 更新时间
    12: string UpdateTime,
    // 描述
    13: string Description
    // 通知方式，应用消息=App，短信加急=SmsUrgent，电话加急=PhoneUrgent
    14: required list<string> AlertWays
}

struct AlertStrategyItem {
    1: required string ID,
    // 策略名称
    2: required string Name,
    // 策略描述
    3: string Description,
    // 关联API信息
    4: required list<common.SimpleInfo> APIs,
    // 类型, ContentBased=基于内容的，StatisticBased=基于统计
    5: required string Type,
    // 预警开始时间
    6: required string BeginTime,
    // 预警结束时间，如果是永不结束则为空
    7: optional string EndTime,
    // 统计周期，只有基于统计的策略有该属性
    8: optional i32 Period,
    // 通知对象
    9: required list<AlertTarget> AlertTargetList,
    // 通知内容
    10: required string Content,
    // 通知收敛，单位分钟，只有基于内容的策略有该属性
    11: optional i32 Inhibit,
    // 通知触发条件
    12: list<ConditionGroup> ConditionGroups,
    // 所在空间
    13: string WorkSpaceID,
    // 创建人
    14: required string CreateUser,
    // 创建时间
    15: required string CreateTime,
    // 更新人
    16: string UpdateUser,
    // 更新时间
    17: string UpdateTime,
    // 通知方式，应用消息=App，短信加急=SmsUrgent，电话加急=PhoneUrgent
    18: required list<string> AlertWays
}

struct AlertHistory {
    1: required string ID,
    // 关联策略ID
    2: required string StrategyID,
    // 通知内容
    3: required string Content,
    // 通知对象
    4: required list<AlertTarget> AlertTargetList,
    // 告警时间
    5: required string AlertTime,
    // 关联策略名称
    6: required string StrategyName,
    // 关联策略描述
    7: required string StrategyDesc,
    // 关联策略类型
    8: required string StrategyType,
    // 关联策略是否删除
    9: required bool IsStrategyDeleted,
}

struct ListAlertHistoryFilter {
    1: optional string StrategyID, // 策略id
    2: list<string> StrategyIDs,
    3: optional string StrategyName, // 策略名称
    4: optional string Content, // 通知内容
}

struct ListAlertStrategyFilter {
    1: optional string Name,
    2: list<string> IDs,
}

struct ListAlertStrategiesRequest {
    1: optional common.ListOption ListOpt(go.tag = 'validate:"omitempty,dive"'),
    2: optional ListAlertStrategyFilter Filter, // 筛选条件
    3: required string WorkSpaceID, // 空间ID
    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct ListAlertStrategiesResponse {
    1: list<AlertStrategySimple> Items,
    2: i32 Total,

    255: base.BaseResp BaseResp,
}

struct ListAlertHistoryRequest {
    1: optional common.ListOption ListOpt(go.tag = 'validate:"omitempty,dive"'),
    2: optional ListAlertHistoryFilter Filter, // 筛选条件
    3: required string WorkSpaceID, // 空间ID

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct ListAlertHistoryResponse {
    1: list<AlertHistory> Items,
    2: i32 Total,

    255: base.BaseResp BaseResp,
}

typedef string AlertWay
// 预警通知方式：应用
const AlertWay AlertWayApp = "App"
// 预警通知方式：短信
const AlertWay AlertWayUrgentSms = "SmsUrgent"
// 预警通知方式: 电话
const AlertWay AlertWayUrgentPhone = "PhoneUrgent"

struct CreateAlertStrategyRequest {
    // 策略名称
    1: required string Name (go.tag = 'validate:"resourceName"'),
    // 策略描述
    3: string Description (go.tag = 'validate:"resourceDescription"'),
    // 关联API信息
    4: required list<string> APIIDs,
    // 类型, ContentBased=基于内容的，StatisticBased=基于统计
    5: required string Type,
    // 预警开始时间
    6: required i64 BeginTime,
    // 预警结束时间，如果是永不结束则为空
    7: optional i64 EndTime,
    // 统计周期，单位分钟，只有基于统计的策略有该属性,
    8: optional i32 Period,
    // 通知对象
    9: required list<AlertTargetSimple> AlertTargetList,
    // 通知内容
    10: required string Content,
    // 通知收敛，单位分钟，只有基于内容的策略有该属性
    11: optional i32 Inhibit,
    // 通知触发条件
    12: list<ConditionGroup> ConditionGroups,
    // 所在空间
    13: required string WorkSpaceID,
    // 通知方式，应用消息=App，短信加急=SmsUrgent，电话加急=PhoneUrgent
    14: required list<string> AlertWays

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct CreateAlertStrategyResponse {
    1: string ID,

    255: base.BaseResp BaseResp,
}

struct UpdateAlertStrategyRequest {
    1: required string ID,
    // 策略名称
    2: optional string Name (go.tag = 'validate:"optionalResourceName"'),
    // 策略描述
    3: optional string Description (go.tag = 'validate:"resourceDescription"'),
    // 关联API信息
    4: optional list<string> APIIDs,
    // 类型, ContentBased=基于内容的，StatisticBased=基于统计
    5: optional string Type,
    // 预警开始时间
    6: optional i64 BeginTime,
    // 预警结束时间，如果是永不结束则为空
    7: optional i64 EndTime,
    // 统计周期，单位分钟，只有基于统计的策略有该属性,
    8: optional i32 Period,
    // 通知对象
    9: optional list<AlertTargetSimple> AlertTargetList,
    // 通知内容
    10: optional string Content,
    // 通知收敛，单位分钟，只有基于内容的策略有该属性
    11: optional i32 Inhibit,
    // 通知触发条件
    12: optional list<ConditionGroup> ConditionGroups,
    // 所在空间
    13: required string WorkSpaceID,
    // 通知方式，应用消息=App，短信加急=SmsUrgent，电话加急=PhoneUrgent
    14: list<string> AlertWays

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct UpdateAlertStrategyResponse {

    255: base.BaseResp BaseResp,
}

struct GetAlertStrategyRequest {
    1: required string ID,
    // 工作空间ID
    2: required string WorkSpaceID,

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct GetAlertStrategyResponse {
    1: AlertStrategyItem AlertStrategyDetail

    255: base.BaseResp BaseResp,
}

struct DeleteAlertStrategyRequest {
    1: required string ID,
    // 所在空间
    2: required string WorkSpaceID,

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct DeleteAlertStrategyResponse {

    255: base.BaseResp BaseResp,
}

struct CheckAlertStrategyInfoRequest {
    // 校验名称时传Name
    1: optional string Name,
    // 工作空间ID
    3: required string WorkSpaceID,

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct CheckAlertStrategyInfoResponse {
    1: bool IsValid, // 参数是否合法
    2: list<string> InvalidReason, // 不合法原因, 多个字段不合法返回多个原因

    255: base.BaseResp BaseResp,
}

struct AlertManagerAlert {
    1: map<string, string> annotations,
}

struct HandleAlertRequest {
    1: string receiver, // 接收策略
    2: list<AlertManagerAlert> alerts // 告警信息

    255: base.Base Base,
}
struct HandleAlertResponse {

    255: base.BaseResp BaseResp,
}