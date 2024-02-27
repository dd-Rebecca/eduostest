include "base.thrift"
include "common.thrift"
include "testapistep.thrift"

struct TestAPIItemSimple {
    1: required string ID,
    // 名称，即中文名
    2: required string Name
    // 描述
    3: string Description,
    // 所属服务目录id
    4: required string TestCategoryID,
    // 所属空间id
    5: required string WorkSpaceID,
    // 步骤数
    6: required i32 StepCount,
    // 创建人
    7: required string CreateUser,
    // 创建时间
    8: required string CreateTime,
    // 更新人
    9: string UpdateUser,
    // 更新时间
    10: string UpdateTime,
}

struct TestAPIItem {
    1: required string ID,
    // 名称，即中文名
    2: required string Name
    // 描述
    3: string Description,
    // 所属服务目录id
    4: required string TestCategoryID,
    // 所属空间id
    5: required string WorkSpaceID,
    // 步骤数
    6: required i32 StepCount,
    // 步骤列表
    7: required list<testapistep.TestAPIStepItemSimple> Steps
    // 创建人
    8: required string CreateUser,
    // 创建时间
    9: required string CreateTime,
    // 更新人
    10: string UpdateUser,
    // 更新时间
    11: string UpdateTime,
}

struct CreateTestAPIRequest {
    // 名称
    1: required string Name(go.tag = 'validate:"resourceName"'),
    // 描述
    2: optional string Description(go.tag = 'validate:"omitempty,resourceDescription"'),
    // 所属服务目录id
    3: required string TestCategoryID,
    // 所属空间id
    4: required string WorkSpaceID,

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct CreateTestAPIResponse {
    1: string ID,

    255: base.BaseResp BaseResp,
}

struct TestAPIStepItem {
    // 名称
    1: required string Name(go.tag = 'validate:"resourceName"'),
    // 描述
    2: optional string Description(go.tag = 'validate:"omitempty,resourceDescription"'),
    // 请求方法，枚举值：GET、POST、PUT、DELETE
    5: required string RequestMethod(go.tag = 'validate:"oneof=GET POST PUT DELETE"'),
    // 请求路径
    6: required string RequestURL(go.tag = 'validate:"apiPath"'),
    // API id
    8: required string APIID,
    // API version id
    9: optional string VersionID,
    // Env id
    10: required string EnvID,
    // Reqeust
    11: testapistep.TestAPIStepRequest Request,
}
struct CreateTestAPIWithStepsRequest {
    // 名称
    1: required string Name(go.tag = 'validate:"resourceName"'),
    // 描述
    2: optional string Description(go.tag = 'validate:"omitempty,resourceDescription"'),
    // 所属服务目录id
    3: required string TestCategoryID,
    // 所属空间id
    4: required string WorkSpaceID,
    // 测试用例步骤信息
    5: required list<TestAPIStepItem> TestAPISteps(go.tag = 'validate:"dive"'),

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct CreateTestAPIWithStepsResponse {
    1: string ID,

    255: base.BaseResp BaseResp,
}

struct UpdateTestAPIRequest {
    1: required string ID,
    // 名称，即中文名
    2: optional string Name(go.tag = 'validate:"omitempty,optionalResourceName"')
    // 描述
    3: optional string Description(go.tag = 'validate:"omitempty,resourceDescription"'),
    // 所属服务目录id
    4: optional string TestCategoryID,
    // 工作空间ID
    5: required string WorkSpaceID,

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct UpdateTestAPIResponse {

    255: base.BaseResp BaseResp,
}

struct ListTestAPIsFilter {
    1: optional string Name, // 名称，模糊搜索
}
struct ListTestAPIsRequest {
    1: optional common.ListOption ListOpt(go.tag = 'validate:"omitempty,dive"'),
    2: optional ListTestAPIsFilter Filter, // 筛选条件
    3: required string WorkSpaceID, // 空间ID
    4: list<string> TestCategoryIDList, // 服务目录ID

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct ListTestAPIsResponse {
    1: list<TestAPIItemSimple> Items, // API条目列表
    2: i32 Total, // 条目总数

    255: base.BaseResp BaseResp,
}

struct GetTestAPIRequest {
    1: required string ID,
    // 工作空间ID
    5: required string WorkSpaceID,

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct GetTestAPIResponse {
    1: TestAPIItem TestAPIDetail

    255: base.BaseResp BaseResp,
}

struct DeleteTestAPIRequest {
    1: required string ID,
    2: required string TestCategoryID, // 服务目录ID
    // 工作空间ID
    5: required string WorkSpaceID,

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct DeleteTestAPIResponse {

    255: base.BaseResp BaseResp,
}

struct CheckTestAPIInfoRequest {
    // 校验名称时传Name
    1: optional string Name,
    // 工作空间ID
    2: required string WorkSpaceID,

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct CheckTestAPIInfoResponse {
    1: bool IsValid, // 参数是否合法
    2: list<string> InvalidReason, // 不合法原因, 多个字段不合法返回多个原因

    255: base.BaseResp BaseResp,
}