include "common.thrift"
include "base.thrift"

struct APICategory {
    // id
    1: required string ID,
    // 名称
    2: required string Name,
    // 描述
    3: optional string Description,
    // 所属空间id
    4: required string WorkSpaceID,
    // 创建人
    5: required string CreateUser,
    // 创建时间
    6: required string CreateTime,
    // 更新人
    7: string UpdateUser,
    // 更新时间
    8: string UpdateTime,
    // 类型
    9: string Type,
    // API数目
    10: i64 APICount,
}

struct CreateAPICategoryRequest {
    // 所属空间id
    1: required string WorkSpaceID,
    // 名称
    2: required string Name (go.tag = 'validate:"resourceName"'),
    // 描述
    3: optional string Description (go.tag = 'validate:"resourceDescription"'),

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}

struct CreateAPICategoryResponse {
    1: string ID,
}

struct UpdateAPICategoryRequest {
    // id
    1: required string ID,
    // 所属空间id
    2: required string WorkSpaceID,
    // 描述
    3: optional string Description (go.tag = 'validate:"resourceDescription"'),
    // 名称
    4: optional string Name (go.tag = 'validate:"optionalResourceName"'),

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}

struct UpdateAPICategoryResponse {

}

struct DeleteAPICategoryRequest {
    // id
    1: required string ID,
    // 所属空间id
    2: required string WorkSpaceID,

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}

struct DeleteAPICategoryResponse {
}

struct ListAPICategorysFilter {
    // 名称，模糊搜索
    1: optional string Name,
    // 类型，枚举：custom-自定义，idlLinked-idl导入
    2: optional string Type,
    // IDs
    3: list<string> IDs,
}


struct ListAPICategoryRequest {
    // 页码和排序
    1: optional common.ListOption ListOpt
    // 空间ID
    2: required string WorkSpaceID,
    // 筛选条件
    3: optional ListAPICategorysFilter Filter,

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}

struct ListAPICategoryResponse {
    // 条目列表
    1: list<APICategory> Items,
    // 条目总数
    2: i32 Total,
}

struct GetAPICategoryRequest {
    // 空间ID
    1: required string WorkSpaceID,
    // 服务目录ID
    2: required string ID,

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}

struct GetAPICategoryResponse {
    // 服务目录
    1: APICategory Item,
}

struct CheckAPICategoryRequest {
    // 空间ID
    1: required string WorkSpaceID,
    // 名称
    2: required string Name (go.tag = 'validate:"resourceName"'),

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}

struct CheckAPICategoryResponse {
    // 是否有效
    1: bool Valid,
}
