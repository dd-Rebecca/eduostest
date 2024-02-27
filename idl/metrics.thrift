include "base.thrift"
include "common.thrift"

// 时间戳
typedef i64 Timestamp
// 数据点值类型
typedef string DataPointValue

// 监控指标查询条件
struct Conditions {
    // StartTime 开始时间，UTC 时间，格式：2006-01-02 15:04:05
    1: required string StartTime,
    // EndTime 结束时间，UTC 时间，格式：2006-01-02 15:04:05
    2: required string EndTime,
    // 工作空间ID
    3: required string WorkSpaceID
    // 环境ID列表，为空表示全部
    4: optional list<string> EnvironmentIDs
    // APIIP列表，为空表示全部
    5: optional list<string> APIIDs
    // 返回数据点的粒度(以秒为单位)。比如 5， 则返回的每个数据点的时间戳间隔为 5 秒。
    6: optional i32 Interval = 15 ,
}



struct QueryMetricDataResponse {
    // 每一条 MetricDataResult 包含时序的信息（纬度）和一组数据点
    1: required list<MetricDataResult> MetricDataResults
    // 实际查询语句
    2: optional list<string> Query

    255: base.BaseResp BaseResp,
}

struct MetricDataResult {
    // 一组数据点
    1: required list<DataPoint> Datapoints
}

struct Dimension {
    1: required string Name,
    2: required string Value,
}

struct DataPoint{
    // 东八区时间，格式：2006-01-02 15:04:05
    1: required string Time,
    2: required i64 Value,
}

// API 运行数
struct GetRunningApiCountRequest {
    // 监控指标查询条件
    1: required Conditions Conditions
    255: required base.TopParam Top
}
struct GetRunningApiCountResponse {
    1: required i64 Count
    // 实际查询语句
    2: optional list<string> Query
    255: base.BaseResp BaseResp,
}

// API 请求成功率
struct GetRequestSuccessRatioRequest {
    // 监控指标查询条件
    1: required Conditions Conditions
    255: required base.TopParam Top
}
struct GetRequestSuccessRatioResponse {
    1: required string SuccessRatio
    // 实际查询语句
    2: optional list<string> Query
    255: base.BaseResp BaseResp,
}

// API 调用次数
struct GetRequestCountRequest {
    // 监控指标查询条件
    1: required Conditions Conditions
    255: required base.TopParam Top
}
struct GetRequestCountResponse {
    1: required i64 Count
    // 实际查询语句
    2: optional list<string> Query
    255: base.BaseResp BaseResp,
}

// API 平均请求大小
struct GetAverageRequestSizeRequest {
    // 监控指标查询条件
    1: required Conditions Conditions
    255: required base.TopParam Top
}
struct GetAverageRequestSizeResponse {
    // 单位: B
    1: required i64 Size
    // 实际查询语句
    2: optional list<string> Query
    255: base.BaseResp BaseResp,
}

// API 请求次数排名
struct GetRequestsRatingRequest {
    // 监控指标查询条件
    1: required Conditions Conditions
    // 前几名，默认为前10名
    2: optional i32 Num
    255: required base.TopParam Top
}
struct GetRequestsRatingResponse {
    1: required list<RequestsCount> Items
    // 实际查询语句
    2: optional list<string> Query
    255: base.BaseResp BaseResp,
}
struct RequestsCount {
    // API ID
    1: required string APIID
    // API 名
    2: required string APIName
    // API 编码
    3: required string APICode
    // 服务目录
    4: required string APICategory
    // 请求次数
    5: required i64 Count
}

// 请求状态分布
struct GetRequestStatusDistributionRequest {
    // 监控指标查询条件
    1: required Conditions Conditions
    255: required base.TopParam Top
}
struct GetRequestStatusDistributionResponse {
    // 请求状态分布
    1: required list<RequestStatus> Items
    // 实际查询语句
    2: optional list<string> Query
    255: base.BaseResp BaseResp,
}
struct RequestStatus{
    // HTTP 状态码
    1: required string StatusCode
    // 数量
    2: required i64 Count
    // 占比
    3: required double Ratio
    // 状态类型
    4: optional string StatusType
}

// 平均响应时长
struct GetAverageLatencyRequest {
    // 监控指标查询条件
    1: required Conditions Conditions
    255: required base.TopParam Top
}
struct GetAverageLatencyResponse {
    // 延迟指标
    // 指定 Interval 时，返回各个时间点的平均延迟
    // 不指定 Interval 时，返回整个时间段的平均延迟
    2: required list<DataPoint> Items
    // 实际查询语句
    3: optional list<string> Query
    255: base.BaseResp BaseResp,
}

// 请求流量
struct GetRequestBandwidthRequest {
    // 监控指标查询条件
    1: required Conditions Conditions
    255: required base.TopParam Top
}
struct GetRequestBandwidthResponse {
    // 请求流量
    1: optional list<DataPoint> RequestBandwith
    // 响应流量
    2: optional list<DataPoint> ResponseBandwith
    // 实际查询语句
    3: optional list<string> Query
    255: base.BaseResp BaseResp,
}