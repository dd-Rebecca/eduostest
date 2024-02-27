include "base.thrift"
include "common.thrift"

struct TestAPIStepHeaderItem {
    // 参数名
    1: required string Name(go.tag = 'validate:"omitempty,apiParamName"'),
    // 参数值
    2: optional string Value(go.tag = 'validate:"omitempty,apiHeaderValue"'),
    // 参数类型，枚举值：Normal、Advanced
    3: optional string Type(go.tag = 'validate:"omitempty,oneof=Normal Advanced"'),
    // 是否启用
    4: optional bool IsEnabled
}

struct TestAPIStepParamItem {
    // 参数名
    1: required string Name(go.tag = 'validate:"omitempty,apiParamName"'),
    // 参数值
    2: optional string Value(go.tag = 'validate:"omitempty,resourceDescription"'),
    // 参数类型，枚举值：Normal、Advanced
    3: optional string Type(go.tag = 'validate:"omitempty,oneof=Normal Advanced"'),
    // 是否启用
    4: optional bool IsEnabled
}

struct TestAPIStepAuthParam {
    // auth 类型，BasicAuth
    1: required string Type(go.tag = 'validate:"oneof=BasicAuth"')
    // 参数名/用户名
    2: required string Name,
    // 参数值/密码
    3: required string Value(go.tag = 'validate:"omitempty,resourceDescription"'),
    // 位置, KeyAuth 时必填，枚举值：Header、Param
    4: optional string Location(go.tag = 'validate:"omitempty,oneof=Header Param"'),
}

struct TestAPIStepExpectParam {
    // 是否校验参数
    1: optional bool CheckParam
    // HTTP状态码，多个状态码英文逗号隔开，默认200，范围200-599
    2: optional string StatusCodes,
    // 响应时常，大于0，单位ms
    3: optional i64 CostTime (go.tag = 'validate:"omitempty,min=0"'),
    // 响应结果校验
    4: optional TestAPIStepResultCheck ResultCheck
}

struct TestAPIStepResultCheck {
    // 是否启用
    1: required bool IsEnabled,
    // 条件组列表
    2: required list<TestAPIStepCheckResultConditionGroup> ConditionGroups;
}

struct TestAPIStepCheckResultConditionGroup {
    // 条件列表
    1: required list<TestAPIStepCheckResultCondition> Conditions;
}

struct TestAPIStepCheckResultCondition {
    // 参数名
    1: required string Name(go.tag = 'validate:"apiParamName"'),
    // 参数值
    2: required string Value(go.tag = 'validate:"resourceDescription"'),
    // 参数类型，枚举值：Normal、Advanced
    3: required string Type(go.tag = 'validate:"oneof=Normal Advanced"'),
    // 运算符，等于(==)、不等于(~=)、大于(>)、小于(<)、大于等于(>=)、小于等于(<=)、正则（~~）、正则不区分大小写（~*）
    4: required string Operator(go.tag = 'validate:"omitempty,oneof=\'==\' \'~=\' \'>\' \'<\' \'>=\' \'<=\' \'~~\' \'~*\'"'),
}

struct TestAPIStepBodyParam {
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

struct TestAPIStepBody {
    // Body类型，枚举值：none、form-data、x-www-form-urlencoded、binary、raw
    1: required string Type(go.tag = 'validate:"omitempty,oneof=none form-data x-www-form-urlencoded binary raw"'),
    // Body子类型，当Body类型是raw时必填，枚举值：Text、JSON、XML、HTML
    2: optional string SubType(go.tag = 'validate:"omitempty,oneof=Text JSON XML HTML"'),
    // Body内容 json/xml/binary
    3: optional string Content,
    // Body参数，当Body类型是form-data、x-www-form-urlencoded时必填
    4: optional list<TestAPIStepBodyParam> Params(go.tag = 'validate:"omitempty,dive"'),
    // Body文件名，当Body类型是binary时必填
    5: optional string FileName(go.tag = 'validate:"omitempty,resourceDescription"'),
    // Body大小超出限制时，返回限制大小
    6: optional i64 ExceedSizeLimit,
}

struct TestAPIStepRequest {
    // Header参数配置
    1: optional list<TestAPIStepHeaderItem> Headers(go.tag = 'validate:"omitempty,dive"'),
    // Param参数配置
    2: optional list<TestAPIStepParamItem> Params(go.tag = 'validate:"omitempty,dive"'),
    // 认证信息
    3: optional TestAPIStepAuthParam Authorization
    // 预期结果
    4: optional TestAPIStepExpectParam Expectation
    // Body
    5: optional TestAPIStepBody Body
}

struct TestAPIStepItemSimple {
    1: required string ID,
    // 名称，即中文名
    2: required string Name
    // 描述
    3: string Description,
    // 所属测试用例id
    4: required string TestAPIID,
    // 所属空间id
    5: required string WorkSpaceID,
    // 请求方法，枚举值：GET、POST、PUT、DELETE
    6: required string RequestMethod,
    // 请求路径
    7: required string RequestURL,
    // API id
    8: required string APIID,
    // API version id
    9: required string VersionID,
    // Env id
    10: required string EnvID,
    // 创建人
    11: required string CreateUser,
    // 创建时间
    12: required string CreateTime,
    // 更新人
    13: string UpdateUser,
    // 更新时间
    14: string UpdateTime,
}

struct TestAPIStepItem {
    1: required string ID,
    // 名称，即中文名
    2: required string Name
    // 描述
    3: string Description,
    // 所属测试用例id
    4: required string TestAPIID,
    // 所属空间id
    5: required string WorkSpaceID,
    // 请求方法，枚举值：GET、POST、PUT、DELETE
    6: required string RequestMethod,
    // 请求路径
    7: required string RequestURL,
    // API id
    8: required string APIID,
    // API version id
    9: required string VersionID,
    // Env id
    10: required string EnvID,
    // 创建人
    11: required string CreateUser,
    // 创建时间
    12: required string CreateTime,
    // 更新人
    13: string UpdateUser,
    // 更新时间
    14: string UpdateTime,
    // Reqeust
    15: TestAPIStepRequest Request,
}

struct CreateTestAPIStepRequest {
    // 名称
    1: required string Name(go.tag = 'validate:"resourceName"'),
    // 描述
    2: optional string Description(go.tag = 'validate:"omitempty,resourceDescription"'),
    // 所属测试用例id
    3: required string TestAPIID,
    // 所属空间id
    4: required string WorkSpaceID,
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
    11: TestAPIStepRequest Request,

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct CreateTestAPIStepResponse {
    1: string ID,

    255: base.BaseResp BaseResp,
}

struct CopyTestAPIStepRequest {
    1: required string WorkSpaceID, // 工作空间ID
    2: required string TestAPIID, // 测试用例ID
    3: string ID, // 拷贝的步骤ID

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct CopyTestAPIStepResponse {
    1: string ID,

    255: base.BaseResp BaseResp,
}

struct UpdateTestAPIStepRequest {
    1: required string ID,
    // 名称，即中文名
    2: optional string Name(go.tag = 'validate:"omitempty,optionalResourceName"')
    // 描述
    3: optional string Description(go.tag = 'validate:"omitempty,resourceDescription"'),
    // 请求方法，枚举值：GET、POST、PUT、DELETE
    4: required string RequestMethod(go.tag = 'validate:"oneof=GET POST PUT DELETE"'),
    // 请求路径
    5: optional string RequestURL(go.tag = 'validate:"omitempty,apiPath"'),
    // API id
    6: required string APIID,
    // API version id
    9: optional string VersionID,
    // Env id
    10: required string EnvID,
    // 所属测试用例id
    11: required string TestAPIID,
    // Reqeust
    12: optional TestAPIStepRequest Request,
    // 工作空间ID
    13: required string WorkSpaceID,

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct UpdateTestAPIStepResponse {

    255: base.BaseResp BaseResp,
}

struct ReorderTestAPIStepsRequest {
    1: required string WorkSpaceID, // 工作空间ID
    2: required string TestAPIID, // 测试用例ID
    3: required string ID, // 测试用例步骤ID
    // 位于哪个测试步骤后面，为空表示排在最前面
    4: string AfterID

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct ReorderTestAPIStepsResponse {

    255: base.BaseResp BaseResp,
}

struct ListTestAPIStepsFilter {
    1: optional string Name, // 名称，模糊搜索
}
struct ListTestAPIStepsRequest {
    1: optional common.ListOption ListOpt(go.tag = 'validate:"omitempty,dive"'),
    2: optional ListTestAPIStepsFilter Filter, // 筛选条件
    3: required string WorkSpaceID, // 空间ID
    4: list<string> TestAPIIDList, // 测试用例ID

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct ListTestAPIStepsResponse {
    1: list<TestAPIStepItemSimple> Items, // API条目列表
    2: i32 Total, // 条目总数

    255: base.BaseResp BaseResp,
}

struct GetTestAPIStepRequest {
    1: required string ID,
    2: required string WorkSpaceID, // 工作空间ID
    3: required string TestAPIID, // 测试用例ID

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct GetTestAPIStepResponse {
    1: TestAPIStepItem TestAPIStepDetail

    255: base.BaseResp BaseResp,
}

struct DeleteTestAPIStepRequest {
    1: required string ID,
    2: required string WorkSpaceID, // 工作空间ID
    3: required string TestAPIID, // 测试用例ID

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct DeleteTestAPIStepResponse {

    255: base.BaseResp BaseResp,
}

struct CheckTestAPIStepRequest {
    // 校验名称时传Name
    1: optional string Name,
    // 工作空间ID
    2: optional string WorkSpaceID,

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}
struct CheckTestAPIStepResponse {
    1: bool IsValid, // 参数是否合法
    2: list<string> InvalidReason, // 不合法原因, 多个字段不合法返回多个原因

    255: base.BaseResp BaseResp,
}