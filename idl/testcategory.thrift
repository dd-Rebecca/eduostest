include "common.thrift"
include "base.thrift"

struct TestAPICategory {
    // id
    1: required string ID,
    // 名称
    2: required string Name,
    // 描述
    3: optional string Description,
    // 所属空间id
    4: required string WorkSpaceID,
    // 测试用例数量
    5: optional i64 TestAPICount,
    // 创建人
    6: required string CreateUser,
    // 创建时间
    7: required string CreateTime,
    // 更新人
    8: string UpdateUser,
    // 更新时间
    9: string UpdateTime,
}

struct CreateTestAPICategoryRequest {
    // 所属空间id
    1: required string WorkSpaceID,
    // 名称
    2: required string Name(go.tag = 'validate:"resourceName"'),
    // 描述
    3: optional string Description (go.tag = 'validate:"resourceDescription"'),

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}

struct CreateTestAPICategoryResponse {
    1: string ID,
}

struct UpdateTestAPICategoryRequest {
    // id
    1: required string ID,
    // 所属空间id
    2: required string WorkSpaceID,
    // 描述
    3: optional string Description (go.tag = 'validate:"resourceDescription"'),
    // 名称
    4: optional string Name (go.tag = 'validate:"omitempty,optionalResourceName"'),

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}

struct UpdateTestAPICategoryResponse {

}

struct DeleteTestAPICategoryRequest {
    // id
    1: required string ID,
    // 所属空间id
    2: required string WorkSpaceID,

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}

struct DeleteTestAPICategoryResponse {
}

struct ListTestAPIsFilter {
    // 名称，模糊搜索
    1: optional string Name,
}


struct ListTestAPICategoryRequest {
    // 页码和排序
    1: optional common.ListOption ListOpt
    // 空间ID
    2: required string WorkSpaceID,
    // 筛选条件
    3: optional ListTestAPIsFilter Filter,

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}

struct ListTestAPICategoryResponse {
    // 条目列表
    1: list<TestAPICategory> Items,
    // 条目总数
    2: i32 Total,
}

struct GetTestAPICategoryRequest {
    // 空间ID
    1: required string WorkSpaceID,
    // 服务目录ID
    2: required string ID,

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}

struct GetTestAPICategoryResponse {
    // 服务目录
    1: TestAPICategory Item,
}

struct CheckTestAPICategoryRequest {
    // 空间ID
    1: required string WorkSpaceID,
    // 名称
    2: required string Name (go.tag = 'validate:"resourceName"'),

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}

struct CheckTestAPICategoryResponse {
    // 是否有效
    1: bool Valid,
}

struct CheckSafelyDeletableRequset {
    // ID
    1: required string ID
    // 工作空间ID
    2: required string WorkSpaceID

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
