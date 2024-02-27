include "common.thrift"
include "base.thrift"

// 脚手架框架类型
typedef string ScaffoldType
// 脚手架框架类型：Java
const ScaffoldType ScaffoldTypeJava = "Java"
// 脚手架框架类型：PHP
const ScaffoldType ScaffoldTypePHP = "PHP"
// 脚手架框架类型：Node.js
const ScaffoldType ScaffoldTypeNodeJs = "Node.js"
// 脚手架框架类型：TypeScript
const ScaffoldType ScaffoldTypeTypeScript = "TypeScript"
// 脚手架框架类型：Golang
const ScaffoldType ScaffoldTypeGolang = "Golang"

// IDL生成脚手架任务状态
typedef string IDLGenScaffoldStatus
// IDL生成脚手架任务状态：未处理
const IDLGenScaffoldStatus IDLGenScaffoldStatusUnprocessed = "Unprocessed"
// IDL生成脚手架任务状态：处理中
const IDLGenScaffoldStatus IDLGenScaffoldStatusProcessing = "Processing"
// IDL生成脚手架任务状态：成功
const IDLGenScaffoldStatus IDLGenScaffoldStatusSuccess = "Success"
// IDL生成脚手架任务状态：失败
const IDLGenScaffoldStatus IDLGenScaffoldStatusFailed = "Failed"

struct GetCategoryIDLRepoInfoRequest {
    // 服务目录ID
    1: required string CategoryID (go.tag = 'validate:"required"')
    // 工作空间ID
    2: required string WorkSpaceID (go.tag = 'validate:"required"')

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top
    255: base.Base Base
}

struct GetCategoryIDLRepoInfoResponse {
    // 仓库类型
    1: common.RepoType RepoType
    // 仓库访问域名（包含http或https前缀）
    2: string RepoHost
    // 脱敏私钥
    3: string MaskAccessToken
    // idl仓库路径
    4: string RepoPath
    // idl分支
    5: string Branch
    // idl文件类型
    6: common.IDLType IDLType
    // idl文件路径
    7: string IDLFile
}

struct SearchCategoryTargetNamespaceRequest {
    // 服务目录ID
    1: required string CategoryID (go.tag = 'validate:"required"')
    // 模糊搜索ns
    2: optional string Namespace
    // 分页排序选项
    3: optional common.ListOption ListOpt
    // 工作空间ID
    4: required string WorkSpaceID (go.tag = 'validate:"required"')

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top
    255: base.Base Base
}

struct SearchCategoryTargetNamespaceResponse {
    // ns列表
    1: list<string> NamespaceList
}

struct GetIDLGenScaffoldRuleRequest {
    // 服务目录id
    1: required string CategoryID (go.tag = 'validate:"required"')
    // 脚手架框架类型
    2: required ScaffoldType ScaffoldType (go.tag = 'validate:"required"')
    // 工作空间ID
    3: required string WorkSpaceID (go.tag = 'validate:"required"')

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top
    255: base.Base Base
}

struct GenScaffoldRuleInfo {
    // 规则id
    1: string GenRuleID
    // 脚手架框架类型
    2: ScaffoldType ScaffoldType
    // 目标仓库路径(namespace/path)
    3: string TargetRepoPath
    // 目标分支
    4: string TargetBranch
}

struct GetIDLGenScaffoldRuleResponse {
    // 是否存在
    1: bool IsExist
    // 规则信息
    2: GenScaffoldRuleInfo RuleInfo
}

struct SearchCategoryIDLBranchRequest {
    // 服务目录ID
    1: required string CategoryID (go.tag = 'validate:"required"')
    // 模糊搜索branch
    2: optional string Branch
    // 分页排序选项
    3: optional common.ListOption ListOpt
    // 工作空间ID
    4: required string WorkSpaceID (go.tag = 'validate:"required"')

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top
    255: base.Base Base
}

struct SearchCategoryIDLBranchResponse {
    // branch列表
    1: list<string> IDLBranchList
}

struct SearchCategoryIDLFileRequest {
    // 服务目录ID
    1: required string CategoryID (go.tag = 'validate:"required"')
    // 所在分支
    2: required string Branch
    // 模糊搜索文件名
    3: optional string IDLFile
    // 分页排序选项
    4: optional common.ListOption ListOpt
    // 工作空间ID
    5: required string WorkSpaceID (go.tag = 'validate:"required"')

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top
    255: base.Base Base
}

struct SearchCategoryIDLFileResponse {
    // 文件列表
    1: list<string> IDLFileList
}

struct CreateIDLGenScaffoldJobRequest {
    // 服务目录id
    1: required string CategoryID (go.tag = 'validate:"required"')
    // idl分支
    2: required string IDLBranch (go.tag = 'validate:"required"')
    // idl主文件
    3: required string IDLFile (go.tag = 'validate:"required"')
    // 脚手架框架类型
    4: optional ScaffoldType ScaffoldType
    // 目标仓库路径(namespace/path)
    5: optional string TargetRepoPath
    // 规则id，如果填写了规则id，则忽略ScaffoldType和TargetRepoPath
    6: optional string GenRuleID
    // 目标tag
    7: required string TargetTag (go.tag = 'validate:"required"')
    // tag附注
    9: optional string TagMessage
    // 工作空间ID
    10: required string WorkSpaceID (go.tag = 'validate:"required"')

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top
    255: base.Base Base
}

struct CreateIDLGenScaffoldJobResponse {
    // 任务id
    1: string JobID
}

struct GetIDLGenScaffoldJobRequest {
    // 任务id
    1: required string JobID (go.tag = 'validate:"required"')
    // 工作空间ID
    2: required string WorkSpaceID (go.tag = 'validate:"required"')

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top
    255: base.Base Base
}

struct GenScaffoldJobInfo {
    // 任务id
    1: string JobID
    // 任务状态
    2: IDLGenScaffoldStatus IDLGenScaffoldStatus
    // 失败信息
    3: string FailedMessage
    // idl分支
    4: string IDLBranch
    // idl主文件
    5: string IDLFile
    // 脚手架框架类型
    6: ScaffoldType ScaffoldType
    // 目标仓库路径(namespace/path)
    7: string TargetRepoPath
    // 目标tag
    8: string TargetTag
    // tag附注
    9: string TagMessage
    // 创建时间
    10: string CreateTime
    // 创建人
    11: string CreateUser
}

struct GetIDLGenScaffoldJobResponse {
    // 任务信息
    1: GenScaffoldJobInfo JobInfo
}

struct ListJobFilter {
    1: optional string TagName // 标签名称
}

struct ListIDLGenScaffoldJobRequest {
    // 服务目录ID
    1: required string CategoryID (go.tag = 'validate:"required"')
    // 筛选条件
    2: optional ListJobFilter Filter, 
    // 分页排序选项
    3: optional common.ListOption ListOpt
    // 工作空间ID
    4: required string WorkSpaceID (go.tag = 'validate:"required"')

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top
    255: base.Base Base
}

struct ListIDLGenScaffoldJobResponse {
    // 任务信息列表
    1: list<GenScaffoldJobInfo> JobInfoList
    // 总数
    2: i32 Total
}
