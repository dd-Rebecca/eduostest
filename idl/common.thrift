exception Error {
    1: i32 HTTPCode,
    2: string Code,
    3: string Message,
    4: map<string, string> Data,
}

// Sorter
struct Sorter {
    // 排序字段，填snake_case，例如操作时间就填created_at，更新时间填updated_at
    1: required string SortField(go.tag = 'validate:"oneof=created_at updated_at http_code biz_code version"'),
    // 排序顺序，默认desc，可填desc或asc，不限大小写
    2: required string SortOrder,
}

// ListOption
struct ListOption {
    1: optional list<Sorter> Sort(go.tag = 'validate:"omitempty,dive"'), // 排序字段
    2: optional i32 PageNumber = 1 (go.tag = 'json:"PageNumber" default:"1" validate:"omitempty,gte=0"'), // 页码
    3: optional i32 PageSize = 100 (go.tag = 'json:"PageSize" default:"100" validate:"omitempty,gte=0'), // 页大小
}

// SimpleInfo
struct SimpleInfo {
    1: string ID,
    2: string Name,
}

// 仓库类型
typedef string RepoType
// 仓库类型：GitLab
const RepoType RepoTypeGitLab = "GitLab"
// 仓库类型：GitHub
const RepoType RepoTypeGitHub = "GitHub"

// IDL类型
typedef string IDLType
// IDL类型：Thrift
const IDLType IDLTypeThrift = "Thrift"
// IDL类型：ProtoBuf
const IDLType IDLTypeProtoBuf = "ProtoBuf"

// API操作类型
typedef string APIAction
// API操作类型：Add
const APIAction APIActionAdd = "Add"
// API操作类型：Update
const APIAction APIActionUpdate = "Update"
