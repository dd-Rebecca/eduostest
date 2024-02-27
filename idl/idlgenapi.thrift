include "common.thrift"
include "base.thrift"
include "category.thrift"

// IDL同步状态
typedef string IDLSyncStatus
// IDL同步状态：未同步
const IDLSyncStatus IDLSyncStatusUnprocessed = "Unprocessed"
// IDL同步状态：同步中
const IDLSyncStatus IDLSyncStatusProcessing = "Processing"
// IDL同步状态：同步成功
const IDLSyncStatus IDLSyncStatusSuccess = "Success"
// IDL同步状态：同步失败
const IDLSyncStatus IDLSyncStatusFailed = "Failed"

// IDL生成API映射类别
typedef string IDLToAPIMapConfigType
// IDL生成API映射类别：导入后编码
const IDLToAPIMapConfigType IDLToAPIMapConfigTypeCode = "Code"
// IDL生成API映射类别：导入后名称
const IDLToAPIMapConfigType IDLToAPIMapConfigTypeName = "Name"
// IDL生成API映射类别：导入后描述
const IDLToAPIMapConfigType IDLToAPIMapConfigTypeDesc = "Desc"

// IDL生成API映射匹配方式
typedef string IDLToAPIMapPattern
// IDL生成API映射匹配方式：方法名
const IDLToAPIMapPattern IDLToAPIMapPatternFuncName = "FuncName"
// IDL生成API映射匹配方式：方法注释
const IDLToAPIMapPattern IDLToAPIMapPatternFuncAnnotation = "FuncAnnotation"
// IDL生成API映射匹配方式：注解api.name
const IDLToAPIMapPattern IDLToAPIMapPatternAnnoAPIName = "AnnoAPIName"

// Path解析方式
typedef string PathMapType
// Path解析方式: 按注释解析
const PathMapType PathMapTypeAnnotation = "Annotation"
// Path解析方式: 按方法名解析
const PathMapType PathMapTypeFuncName = "FuncName" // 需要传入path前缀

struct CheckIDLAccessTokenRequest {
    // 仓库类型
    1: required common.RepoType RepoType (go.tag = 'validate:"required,oneof=GitLab GitHub"')
    // 仓库访问域名（包含http或https前缀）
    2: required string RepoHost (go.tag = 'validate:"required"')
    // 私钥
    3: required string AccessToken (go.tag = 'validate:"required"')

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}

struct CheckIDLAccessTokenResponse {
    // 是否校验通过
    1: bool Access
}

struct SearchIDLRepoRequest {
    // 仓库类型
    1: required common.RepoType RepoType (go.tag = 'validate:"required,oneof=GitLab GitHub"')
    // 仓库访问域名（包含http或https前缀）
    2: required string RepoHost (go.tag = 'validate:"required"')
    // 私钥
    3: required string AccessToken (go.tag = 'validate:"required"')
    // 模糊搜索仓库
    4: optional string RepoPath
    // 分页排序选项
    5: optional common.ListOption ListOpt

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}

struct SearchIDLRepoResponse {
    // 仓库列表
    1: list<string> RepoPathList
}

struct SearchIDLBranchRequest {
    // 仓库类型
    1: required common.RepoType RepoType (go.tag = 'validate:"required,oneof=GitLab GitHub"')
    // 仓库访问域名（包含http或https前缀）
    2: required string RepoHost (go.tag = 'validate:"required"')
    // 私钥
    3: required string AccessToken (go.tag = 'validate:"required"')
    // 仓库
    4: required string RepoPath (go.tag = 'validate:"required"')
    // 模糊搜索分支
    5: optional string Branch
    // 分页排序选项
    6: optional common.ListOption ListOpt

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top
    255: base.Base Base
}

struct SearchIDLBranchResponse {
    // 分支列表
    1: list<string> BranchList
}

struct SearchIDLFileRequest {
    // 仓库类型
    1: required common.RepoType RepoType (go.tag = 'validate:"required,oneof=GitLab GitHub"')
    // 仓库访问域名（包含http或https前缀）
    2: required string RepoHost (go.tag = 'validate:"required"')
    // 私钥
    3: required string AccessToken (go.tag = 'validate:"required"')
    // 仓库
    4: required string RepoPath (go.tag = 'validate:"required"')
    // 分支
    5: required string Branch (go.tag = 'validate:"required"')
    // idl文件类型
    6: required common.IDLType IDLType (go.tag = 'validate:"required,oneof=Thrift ProtoBuf"')
    // 模糊搜索文件名
    7: optional string IDLFile
    // 分页排序选项
    8: optional common.ListOption ListOpt

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top
    255: base.Base Base
}

struct SearchIDLFileResponse {
    // 文件列表
    1: list<string> FileList
}

struct IDLRepoInfo {
    // 仓库类型
    1: common.RepoType RepoType
    // 仓库访问域名（包含http或https前缀）
    2: string RepoHost
    // 私钥
    3: string AccessToken
    // 仓库路径
    4: string RepoPath
    // 分支
    5: string Branch
    // idl文件类型
    6: common.IDLType IDLType
    // idl文件路径
    7: string IDLFile
}

struct GetIDLToAPIMapConfigRequest {
    // idl文件类型
    1: required common.IDLType IDLType (go.tag = 'validate:"required,oneof=Thrift ProtoBuf"')

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top
    255: base.Base Base
}

struct GetIDLToAPIMapConfigResponse {
    // 映射关系配置列表
    1: list<IDLToAPIMapConfig> IDLToAPIMapConfigList
}

struct IDLToAPIMapConfig {
    // 映射类别
    1: IDLToAPIMapConfigType IDLToAPIMapConfigType
    // 映射方式选项列表
    2: list<PatternOption> PatternOption
}

struct PatternOption {
    // 映射方式
    1: IDLToAPIMapPattern Pattern
    // 映射方式展示名称
    2: string PatternShowValue
}

struct IDLToAPIMapConfigSelect {
    // 映射类别
    1: required IDLToAPIMapConfigType IDLToAPIMapConfigType (go.tag = 'validate:"required,oneof=Code Name Desc"')
    // 映射方式
    2: optional IDLToAPIMapPattern Pattern
}

struct GetIDLToAPIBaseInfoListRequest {
    // 仓库信息
    1: required IDLRepoInfo RepoInfo (go.tag = 'validate:"required"')
    // 映射选项
    2: required list<IDLToAPIMapConfigSelect> IDLToAPIMapConfigSelectList (go.tag = 'validate:"required"')
    // path解析方式，不传则默认PathMapTypeAnnotation
    3: optional PathMapType PathMapType
    // path前缀，PathMapType为FuncName时生效且必填
    4: optional string PrePath

     /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top
    255: base.Base Base
}

struct GetIDLToAPIBaseInfoListResponse {
    1: list<IDLToAPIBaseInfo> IDLToAPIBaseInfoList
    2: bool IsExistInvalidPath // 是否存在非法path
}

struct IDLToAPIBaseInfo {
    // http请求方法
    1: string HttpMethod
    // http请求path
    2: string Path
    // 导入后编码
    3: string Code
    // 导入后名称
    4: string Name
    // 导入后描述
    5: string Desc
    // method+path是否已存在
    6: bool IsExist
    // 新增还是更新
    7: common.APIAction APIAction
    // 版本号
    8: string Version
    // 版本描述
    9: string VersionDesc
}

struct CreateIDLAPICategoryRequest {
    // 所属空间id
    1: required string WorkSpaceID (go.tag = 'validate:"required"')
    // 名称
    2: required string Name (go.tag = 'validate:"resourceName"')
    // 描述
    3: optional string Description (go.tag = 'validate:"resourceDescription"')
    // 仓库信息
    4: required IDLRepoInfo RepoInfo (go.tag = 'validate:"required"')
    // 需要导入的API
    5: required list<IDLToAPIBaseInfo> APIList (go.tag='validate:"required,min=1"')
    // path解析方式，不传则默认PathMapTypeAnnotation
    6: optional PathMapType PathMapType
    // path前缀，PathMapType为FuncName时生效且必填
    7: optional string PrePath

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top
    255: base.Base Base
}

struct CreateIDLAPICategoryResponse {
    // 服务目录ID
    1: string CategoryID
    // IDL同步任务ID
    2: string IDLSyncJobID
}

struct GetIDLSyncJobRequest {
    // IDL同步任务ID
    1: required string IDLSyncJobID (go.tag = 'validate:"required"')
    // 工作空间ID
    2: required string WorkSpaceID (go.tag = 'validate:"required"')
    

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top
    255: base.Base Base
}

struct GetIDLSyncJobResponse {
    // IDL同步任务状态
    1: IDLSyncStatus IDLSyncStatus
    // 失败信息
    2: string FailedMessage
}

struct GetIDLAPICategoryRequest {
    // IDL类型服务目录ID
    1: required string CategoryID (go.tag = 'validate:"required"')
    // 工作空间ID
    2: required string WorkSpaceID (go.tag = 'validate:"required"')

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top
    255: base.Base Base
}

struct ShowIDLRepoInfo {
    // 仓库类型
    1: common.RepoType RepoType
    // 仓库访问域名（包含http或https前缀）
    2: string RepoHost
    // 脱敏私钥
    3: string MaskAccessToken
    // 仓库路径
    4: string RepoPath
    // 分支
    5: string Branch
    // idl文件类型
    6: common.IDLType IDLType
    // idl文件路径
    7: string IDLFile
}

struct GetIDLAPICategoryResponse {
    // 服务目录基础信息
    1: category.APICategory CategoryBaseInfo
    // 关联idl仓库信息
    2: ShowIDLRepoInfo IDLRepoInfo
    // path解析方式
    3: PathMapType PathMapType
    // path前缀，PathMapType为FuncName时生效
    4: string PrePath
}

struct UpdateIDLAPICategoryRequest {
    // 所属空间id
    1: required string WorkSpaceID (go.tag = 'validate:"required"')
    // IDL类型服务目录ID
    2: required string CategoryID (go.tag = 'validate:"required"')
    // 名称
    3: optional string Name (go.tag = 'validate:"optionalResourceName"')
    // 描述
    4: optional string Description (go.tag = 'validate:"resourceDescription"')
    // AccessToken
    5: optional string AccessToken

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top
    255: base.Base Base
}

struct UpdateIDLAPICategoryResponse {
}

struct GetCategoryIDLToAPIBaseListRequest {
    // 所属空间id
    1: required string WorkSpaceID (go.tag = 'validate:"required"')
    // IDL类型服务目录ID
    2: required string CategoryID (go.tag = 'validate:"required"')
    // idl文件分支
    3: required string Branch (go.tag = 'validate:"required"')
    // idl文件路径
    4: required string IDLFile (go.tag = 'validate:"required"')
    // 映射选项
    5: required list<IDLToAPIMapConfigSelect> IDLToAPIMapConfigSelectList (go.tag = 'validate:"required"')

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top
    255: base.Base Base
}

struct GetCategoryIDLToAPIBaseListResponse {
    1: list<IDLToAPIBaseInfo> IDLToAPIBaseInfoList
    2: bool IsExistInvalidPath // 是否存在非法path
}

struct UpdateIDLCategoryAPIListRequest {
    // 所属空间id
    1: required string WorkSpaceID (go.tag = 'validate:"required"')
    // IDL类型服务目录ID
    2: required string CategoryID (go.tag = 'validate:"required"')
    // 需要更新和新增的API
    3: required list<IDLToAPIBaseInfo> APIList (go.tag='validate:"required,min=1"')
    // idl文件分支
    4: required string Branch (go.tag = 'validate:"required"')
    // idl文件路径
    5: required string IDLFile (go.tag = 'validate:"required"')

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top
    255: base.Base Base
}

struct UpdateIDLCategoryAPIListResponse {
    // IDL同步任务ID
    1: string IDLSyncJobID
}

struct GetCategoryIDLFileContentRequest {
    // IDL类型服务目录ID
    1: required string CategoryID (go.tag = 'validate:"required"')
    // idl文件分支
    2: required string Branch (go.tag = 'validate:"required"')
    // idl文件路径
    3: required string IDLFile (go.tag = 'validate:"required"')
    // 工作空间ID
    4: required string WorkSpaceID (go.tag = 'validate:"required"')

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top
    255: base.Base Base
}

struct GetCategoryIDLFileContentResponse {
    // 文件内容
    1: string Content
    // 文件内容MD5
    2: string Md5
}

struct UpdateCategoryIDLFileContentRequest {
    // IDL类型服务目录ID
    1: required string CategoryID (go.tag = 'validate:"required"')
    // idl文件分支
    2: required string Branch (go.tag = 'validate:"required"')
    // idl文件路径
    3: required string IDLFile (go.tag = 'validate:"required"')
    // 文件未修改前md5值
    4: required string LastMd5 (go.tag = 'validate:"required"')
    // 文件内容
    5: required string Content (go.tag = 'validate:"required"')
    // 工作空间ID
    6: required string WorkSpaceID (go.tag = 'validate:"required"')

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top
    255: base.Base Base
}

struct UpdateCategoryIDLFileContentResponse{
}

struct SyncIDLAPIRequest {
    // IDL类型API ID
    1: required string APIID (go.tag = 'validate:"required"')
    // idl文件分支
    2: required string Branch (go.tag = 'validate:"required"')
    // idl文件路径
    3: required string IDLFile (go.tag = 'validate:"required"')
    // 版本id
    4: required string VersionID (go.tag = 'validate:"required"')
    // 版本号
    5: required string VersionName (go.tag = 'validate:"required"')
    // 版本描述
    6: optional string VersionDesc
    // 工作空间ID
    7: required string WorkSpaceID (go.tag = 'validate:"required"')

    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top
    255: base.Base Base
}

struct SyncIDLAPIResponse {
    // IDL同步任务ID
    1: string IDLSyncJobID
}
