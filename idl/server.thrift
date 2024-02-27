include "base.thrift"
include "common.thrift"
include "api.thrift"
include "alert.thrift"
include "workspace.thrift"
include "category.thrift"
include "apiversion.thrift"
include "apicode.thrift"
include "apipublish.thrift"
include "apimock.thrift"
include "alert.thrift"
include "apilog.thrift"
include "api.thrift"
include "testcategory.thrift"
include "testapi.thrift"
include "testapistep.thrift"
include "testapihistory.thrift"
include "idlgenapi.thrift"
include "idlgenscaffold.thrift"
include "metrics.thrift"
include "apicodegen.thrift"
include "external/nexus.thrift"

namespace go epscp.eduos.apim

service APIMService {

/* 工作空间管理 */
    /* 创建工作空间 */
    workspace.CreateWorkSpaceResponse CreateWorkSpace(1: workspace.CreateWorkSpaceRequest req) throws (1: common.Error err)(workspace.category="工作空间管理"),
    /* 更新工作空间 */
    workspace.UpdateWorkSpaceResponse UpdateWorkSpace(1: workspace.UpdateWorkSpaceRequest req) throws (1: common.Error err)(workspace.category="工作空间管理"),
    /* 查询工作空间列表 */
    workspace.ListWorkSpacesResponse ListWorkSpaces(1: workspace.ListWorkSpacesRequest req) throws (1: common.Error err)(workspace.category="工作空间管理"),
    /* 列出所有工作空间，不考虑成员权限 */
    workspace.ListAllWorkSpacesResponse ListAllWorkSpaces(1: workspace.ListAllWorkSpacesRequest req) throws (1: common.Error err)(workspace.category="工作空间管理"),
    /* 查询工作空间详情 */
    workspace.GetWorkSpaceResponse GetWorkSpace(1: workspace.GetWorkSpaceRequest req) throws (1: common.Error err)(workspace.category="工作空间管理"),
    /* 删除工作空间 */
    workspace.DeleteWorkSpaceResponse DeleteWorkSpace(1: workspace.DeleteWorkSpaceRequest req) throws (1: common.Error err)(workspace.category="工作空间管理"),
    /* 添加工作空间成员 */
    base.BaseResponse AddMemberToWorkSpace(1: workspace.AddMemberToWorkSpaceRequest req) throws (1: common.Error err)(workspace.category="工作空间管理"),
    /* 移除工作空间成员 */
    base.BaseResponse RemoveMemberFromWorkSpace(1: workspace.RemoveMemberFromWorkSpaceRequest req) throws (1: common.Error err)(workspace.category="工作空间管理"),
    /* 编辑工作空间成员权限 */
    base.BaseResponse UpdateMemberAuth(1: workspace.UpdateMemberAuthRequest req) throws (1: common.Error err)(workspace.category="工作空间管理"),
    /* 获取工作空间权限 */
    workspace.GetWorkSpaceAuthsResponse GetWorkSpaceAuths(1: workspace.GetWorkSpaceAuthsRequest req) throws (1: common.Error err)(workspace.category="工作空间管理"),
    /* 检查工作空间名称是否重复 */
    workspace.CheckWorkSpaceResponse CheckWorkSpace(1: workspace.CheckWorkSpaceRequest req) throws (1: common.Error err)(workspace.category="工作空间管理"),
    /** 检查工作空间是否可以安全删除 */
    workspace.CheckSafelyDeletableResponse CheckWorkSpaceSafelyDeletable(1: workspace.CheckSafelyDeletableRequset req) throws (1: common.Error err),
    /* 查询工作空间成员列表 */
    workspace.ListWorkSpaceMembersResponse ListWorkSpaceMembers(1: workspace.ListWorkSpaceMembersRequest req) throws (1: common.Error err)(workspace.category="工作空间管理"),
    /* 更新API全生命周期配置*/
    base.BaseResponse UpdateWorkSpaceAPILifeCycleConfig(1: workspace.UpdateAPILifeCycleConfigRequest req) throws (1: common.Error err)(workspace.category="工作空间管理"),
    /* 更新API Mock配置 */
    workspace.UpdateAPIMockConfigResponse UpdateAPIMockConfig(1: workspace.UpdateAPIMockConfigRequest req) throws (1: common.Error err)(workspace.category="工作空间管理"),

/* API管理 */
    /* 创建API */
    api.CreateAPIResponse CreateAPI(1: api.CreateAPIRequest req) throws (1: common.Error err)(api.category="api管理"),
    /* 更新API */
    api.UpdateAPIResponse UpdateAPI(1: api.UpdateAPIRequest req) throws (1: common.Error err)(api.category="api管理"),
    /* 查询API列表 */
    api.ListAPIsResponse ListAPIs(1: api.ListAPIsRequest req) throws (1: common.Error err)(api.category="api管理"),
    /* 查询API详情 */
    api.GetAPIResponse GetAPI(1: api.GetAPIRequest req) throws (1: common.Error err)(api.category="api管理"),
    /* 校验API信息 */
    api.CheckAPIInfoResponse CheckAPIInfo(1: api.CheckAPIInfoRequest req) throws (1: common.Error err)(api.category="api管理"),
    /* 删除API */
    api.DeleteAPIResponse DeleteAPI(1: api.DeleteAPIRequest req) throws (1: common.Error err)(api.category="api管理"),
    /* 获取请求方法 */
    api.GetAPIRequestMethodResponse GetAPIRequestMethod(1: api.GetAPIRequestMethodRequest req) throws(1: common.Error err)(api.category="api管理")
    /* 返回当前用户已授权的API列表 */
    api.ListAuthorizedAPIsResponse ListAuthorizedAPIs(1: api.ListAuthorizedAPIsRequest req) throws(1: common.Error err)(api.category="api管理")
    /* 查询指定API已授权的环境和API版本信息 */
    api.ListAuthorizedEnvAndAPIVersionsResponse ListAuthorizedEnvAndAPIVersions(1: api.ListAuthorizedEnvAndAPIVersionsRequest req) throws(1: common.Error err)(api.category="api管理")
    /* 获取授权的API指定版本的详情 */
    api.GetAuthorizedAPIVersionResponse GetAuthorizedAPIVersion(1: api.GetAuthorizedAPIVersionRequest req) throws(1: common.Error err)(api.category="api管理")
    /* 获取授权的API指定版本的详情 */
    api.ListAllAPIsResponse ListAllAPIs(1: api.ListAllAPIsRequest req) throws(1: common.Error err)(api.category="api管理")
    /* 导入API文件 */
    api.ImportAPIResponse ImportAPI(1: api.ImportAPIRequest req) throws (1: common.Error err)(api.category="api管理")
    /* 导入API文件 */
    api.GetAPIImportJobResponse GetAPIImportJob(1: api.GetAPIImportJobRequest req) throws (1: common.Error err)(api.category="api管理")

/* 服务目录管理 */
    /* 创建服务目录 */
    category.CreateAPICategoryResponse CreateAPICategory(1: category.CreateAPICategoryRequest req) throws (1: common.Error err)
    /* 更新服务目录 */
    category.UpdateAPICategoryResponse UpdateAPICategory(1: category.UpdateAPICategoryRequest req) throws (1: common.Error err)
    /* 查询服务目录列表 */
    category.ListAPICategoryResponse ListAPICategory(1: category.ListAPICategoryRequest req) throws (1: common.Error err)
    /* 删除服务目录 */
    category.DeleteAPICategoryResponse DeleteAPICategory(1: category.DeleteAPICategoryRequest req) throws (1: common.Error err)
    /* 获取服务目录 */
    category.GetAPICategoryResponse GetAPICategory(1: category.GetAPICategoryRequest req) throws (1: common.Error err)
    /* 检查服务目录 */
    category.CheckAPICategoryResponse CheckAPICategory(1: category.CheckAPICategoryRequest req) throws (1: common.Error err)
/* API预警 */
    /* 创建预警策略 */
    alert.CreateAlertStrategyResponse CreateAlertStrategy(1: alert.CreateAlertStrategyRequest req) throws (1: common.Error err)(api.category="预警")
    /* 更新预警策略 */
    alert.UpdateAlertStrategyResponse UpdateAlertStrategy(1: alert.UpdateAlertStrategyRequest req) throws (1: common.Error err)(api.category="预警")
    /* 查询预警策略列表 */
    alert.ListAlertStrategiesResponse ListAlertStrategies(1: alert.ListAlertStrategiesRequest req) throws (1: common.Error err)(api.category="预警")
    /* 删除预警策略 */
    alert.DeleteAlertStrategyResponse DeleteAlertStrategy(1: alert.DeleteAlertStrategyRequest req) throws (1: common.Error err)(api.category="预警")
    /* 获取预警策略详情 */
    alert.GetAlertStrategyResponse GetAlertStrategy(1: alert.GetAlertStrategyRequest req) throws (1: common.Error err)(api.category="预警")
    /* 检查预警策略 */
    alert.CheckAlertStrategyInfoResponse CheckAlertStrategyInfo(1: alert.CheckAlertStrategyInfoRequest req) throws (1: common.Error err)(api.category="预警")
    /* 查询预警历史列表 */
    alert.ListAlertHistoryResponse ListAlertHistory(1: alert.ListAlertHistoryRequest req) throws (1: common.Error err)(api.category="预警")
    /* 处理告警 */
    alert.HandleAlertResponse HandleAlert(1: alert.HandleAlertRequest req) throws (1: common.Error err)(api.category="预警")

/* API版本管理 */
    /* 创建API版本 */
    apiversion.CreateAPIVersionResponse CreateAPIVersion(1: apiversion.CreateAPIVersionRequest req) throws (1: common.Error err)
    /* 更新API版本 */
    apiversion.UpdateAPIVersionResponse UpdateAPIVersion(1: apiversion.UpdateAPIVersionRequest req) throws (1: common.Error err)
    /* 查询API版本列表 */
    apiversion.ListAPIVersionsResponse ListAPIVersions(1: apiversion.ListAPIVersionsRequest req) throws (1: common.Error err)
    /* 删除API版本 */
    apiversion.DeleteAPIVersionResponse DeleteAPIVersion(1: apiversion.DeleteAPIVersionRequest req) throws (1: common.Error err)
    /* 获取API版本 */
    apiversion.GetAPIVersionResponse GetAPIVersion(1: apiversion.GetAPIVersionRequest req) throws (1: common.Error err)
    /* 检查API版本 */
    apiversion.CheckAPIVersionInfoResponse CheckAPIVersionInfo(1: apiversion.CheckAPIVersionInfoRequest req) throws (1: common.Error err)
    /* 完成开发 */
    apiversion.FinishDevelopResponse FinishDevelop(1: apiversion.FinishDevelopRequest req) throws (1: common.Error err)
    /* API版本运行列表 */
    apiversion.ListAPIVersionRunningInstancesResponse ListAPIVersionRunningInstances(1: apiversion.ListAPIVersionRunningInstancesRequest req) throws (1: common.Error err)
    /* 用于获取apiversion的content信息 */
    apiversion.ListAPIVersionContentResponse ListAPIVersionContent(1: apiversion.ListAPIVersionContentRequest req) throws(1: common.Error err)
    /* API版本发布列表 */
    apiversion.ListAPIVersionPublishResponse ListAPIVersionPublish(1: apiversion.ListAPIVersionPublishRequest req) throws (1: common.Error err)


/* API状态码管理 */
    /* 创建API状态码 */
    apicode.CreateAPICodeResponse CreateAPICode(1: apicode.CreateAPICodeRequest req) throws (1: common.Error err)
    /* 更新API状态码 */
    apicode.UpdateAPICodeResponse UpdateAPICode(1: apicode.UpdateAPICodeRequest req) throws (1: common.Error err)
    /* 查询API状态码列表 */
    apicode.ListAPICodesResponse ListAPICodes(1: apicode.ListAPICodesRequest req) throws (1: common.Error err)
    /* 查询所有API状态码列表 */
    apicode.ListAllAPICodesResponse ListAllAPICodes(1: apicode.ListAllAPICodesRequest req) throws (1: common.Error err)
    /* 删除API状态码 */
    apicode.DeleteAPICodeResponse DeleteAPICode(1: apicode.DeleteAPICodeRequest req) throws (1: common.Error err)
    /* 获取API状态码 */
    apicode.GetAPICodeResponse GetAPICode(1: apicode.GetAPICodeRequest req) throws (1: common.Error err)
    /* 检查API状态码 */
    apicode.CheckAPICodeInfoResponse CheckAPICodeInfo(1: apicode.CheckAPICodeInfoRequest req) throws (1: common.Error err)

/* APIMock管理 */
    /* 创建APIMock */
    apimock.CreateAPIMockResponse CreateAPIMock(1: apimock.CreateAPIMockRequest req) throws (1: common.Error err)
    /* 更新APIMock */
    apimock.UpdateAPIMockResponse UpdateAPIMock(1: apimock.UpdateAPIMockRequest req) throws (1: common.Error err)
    /* 查询APIMock列表 */
    apimock.ListAPIMocksResponse ListAPIMocks(1: apimock.ListAPIMocksRequest req) throws (1: common.Error err)
    /* 删除APIMock */
    apimock.DeleteAPIMockResponse DeleteAPIMock(1: apimock.DeleteAPIMockRequest req) throws (1: common.Error err)
    /* 获取APIMock */
    apimock.GetAPIMockResponse GetAPIMock(1: apimock.GetAPIMockRequest req) throws (1: common.Error err)
    /* 检查APIMock */
    apimock.CheckAPIMockInfoResponse CheckAPIMockInfo(1: apimock.CheckAPIMockInfoRequest req) throws (1: common.Error err)
    /* 获取API mock地址 */
    apimock.GetAPIMockAddressResponse GetAPIMockAddress(1: apimock.GetAPIMockAddressRequest req) throws (1: common.Error err)

/* API版本发布管理 */
    /* 发布API */
    apipublish.PublishAPIVersionResponse PublishAPIVersion(1: apipublish.PublishAPIVersionRequest req) throws (1: common.Error err)(api.category="API发布"),
    /* 发布API */
    apipublish.GetPublishAPIVersionResponse GetPublishAPIVersion(1: apipublish.GetPublishAPIVersionRequest req) throws (1: common.Error err)(api.category="API发布"),
    /* 下线API */
    apipublish.ShutoffAPIVersionResponse ShutoffAPIVersion(1: apipublish.ShutoffAPIVersionRequest req) throws (1: common.Error err)(api.category="API发布")
    /* 校验服务名是否重复 */
    apipublish.CheckServiceNameDuplicatedResponse CheckServiceNameDuplicated(1: apipublish.CheckServiceNameDuplicatedRequest req) throws (1: common.Error err)(api.category="API发布")
    /* 查询服务列表 */
    apipublish.ListServicesResponse ListServices(1: apipublish.ListServicesRequest req) throws (1: common.Error err)(api.category="API发布"),
    /* 查询容器集群列表 */
    apipublish.ListContainerClustersResponse ListContainerClusters(1: apipublish.ListContainerClustersRequest req) throws (1: common.Error err)(api.category="API发布"),
    /* 查询容器集群服务列表 */
    apipublish.ListContainerClusterServicesResponse ListContainerClusterServices(1: apipublish.ListContainerClusterServicesRequest req) throws (1: common.Error err)(api.category="API发布"),
    /* 查询指定的API发布的插件配置列表 */
    apipublish.ListAPIPublishPluginConfigsResponse ListAPIPublishPluginConfigs(1: apipublish.ListAPIPublishPluginConfigsRequest req) throws (1: common.Error err)(api.category="API发布"),
    /* 启禁用API发布的插件配置 */
    apipublish.EnableAPIPublishPluginConfigResponse EnableAPIPublishPluginConfig(1: apipublish.EnableAPIPublishPluginConfigRequest req) throws (1: common.Error err)(api.category="API发布"),
    /* 更新API发布的插件配置 */
    apipublish.UpdateAPIPublishPluginConfigResponse UpdateAPIPublishPluginConfig(1: apipublish.UpdateAPIPublishPluginConfigRequest req) throws (1: common.Error err)(api.category="API发布"),
    /* 删除API发布的插件配置 */
    apipublish.DeleteAPIPublishPluginConfigResponse DeleteAPIPublishPluginConfig(1: apipublish.DeleteAPIPublishPluginConfigRequest req) throws (1: common.Error err)(api.category="API发布"),
    /* 获取插件列表 */
    apipublish.ListAvailablePluginsResponse ListAvailablePlugins(1: apipublish.ListAvailablePluginsRequest req) throws (1: common.Error err)(api.category="API发布"),
    /* 获取插件列表 */
    apipublish.UpdatePublishedConsumerResponse UpdatePublishedConsumer(1: apipublish.UpdatePublishedConsumerRequest req) throws (1: common.Error err)(api.category="API发布"),


/* API测试目录管理 */
    /* 创建API测试目录 */
    testcategory.CreateTestAPICategoryResponse CreateTestAPICategory(1: testcategory.CreateTestAPICategoryRequest req) throws (1: common.Error err)(api.category="api测试目录管理"),
    /* 更新API测试目录 */
    testcategory.UpdateTestAPICategoryResponse UpdateTestAPICategory(1: testcategory.UpdateTestAPICategoryRequest req) throws (1: common.Error err)(api.category="api测试目录管理"),
    /* 查询API测试目录列表 */
    testcategory.ListTestAPICategoryResponse ListTestAPICategory(1: testcategory.ListTestAPICategoryRequest req) throws (1: common.Error err)(api.category="api测试目录管理"),
    /* 删除API测试目录 */
    testcategory.DeleteTestAPICategoryResponse DeleteTestAPICategory(1: testcategory.DeleteTestAPICategoryRequest req) throws (1: common.Error err)(api.category="api测试目录管理"),
    /* 获取API测试目录 */
    testcategory.GetTestAPICategoryResponse GetTestAPICategory(1: testcategory.GetTestAPICategoryRequest req) throws (1: common.Error err)(api.category="api测试目录管理"),
    /* 检查API测试目录 */
    testcategory.CheckTestAPICategoryResponse CheckTestAPICategory(1: testcategory.CheckTestAPICategoryRequest req) throws (1: common.Error err)(api.category="api测试目录管理"),
    /** 检查API测试目录 */
    testcategory.CheckSafelyDeletableResponse CheckTestAPICategorySafelyDeletable(1: testcategory.CheckSafelyDeletableRequset req) throws (1: common.Error err)(api.category="api测试目录管理"),

/* API测试用例管理 */
    /* 创建API测试用例 */
    testapi.CreateTestAPIResponse CreateTestAPI(1: testapi.CreateTestAPIRequest req) throws (1: common.Error err)(api.category="api测试用例管理"),
    /* 创建API测试用例和测试步骤 */
    testapi.CreateTestAPIWithStepsResponse CreateTestAPIWithSteps(1: testapi.CreateTestAPIWithStepsRequest req) throws (1: common.Error err)(api.category="api测试用例管理"),
    /* 更新API测试用例 */
    testapi.UpdateTestAPIResponse UpdateTestAPI(1: testapi.UpdateTestAPIRequest req) throws (1: common.Error err)(api.category="api测试用例管理"),
    /* 查询API测试用例列表 */
    testapi.ListTestAPIsResponse ListTestAPIs(1: testapi.ListTestAPIsRequest req) throws (1: common.Error err)(api.category="api测试用例管理"),
    /* 查询API测试用例详情 */
    testapi.GetTestAPIResponse GetTestAPI(1: testapi.GetTestAPIRequest req) throws (1: common.Error err)(api.category="api测试用例管理"),
    /* 校验API测试用例信息 */
    testapi.CheckTestAPIInfoResponse CheckTestAPIInfo(1: testapi.CheckTestAPIInfoRequest req) throws (1: common.Error err)(api.category="api测试用例管理"),
    /* 删除API测试用例 */
    testapi.DeleteTestAPIResponse DeleteTestAPI(1: testapi.DeleteTestAPIRequest req) throws (1: common.Error err)(api.category="api测试用例管理"),

/* API测试用例步骤管理 */
    /* 创建API测试用例步骤 */
    testapistep.CreateTestAPIStepResponse CreateTestAPIStep(1: testapistep.CreateTestAPIStepRequest req) throws (1: common.Error err)(api.category="api测试用例步骤管理"),
    /* 复制API测试用例步骤 */
    testapistep.CopyTestAPIStepResponse CopyTestAPIStep(1: testapistep.CopyTestAPIStepRequest req) throws (1: common.Error err)(api.category="api测试用例步骤管理"),
    /* 更新API测试用例步骤 */
    testapistep.UpdateTestAPIStepResponse UpdateTestAPIStep(1: testapistep.UpdateTestAPIStepRequest req) throws (1: common.Error err)(api.category="api测试用例步骤管理"),
    /* 排序API测试用例步骤 */
    testapistep.ReorderTestAPIStepsResponse ReorderTestAPIStep(1: testapistep.ReorderTestAPIStepsRequest req) throws (1: common.Error err)(api.category="api测试用例步骤管理"),
    /* 查询API测试用例步骤列表 */
    testapistep.ListTestAPIStepsResponse ListTestAPISteps(1: testapistep.ListTestAPIStepsRequest req) throws (1: common.Error err)(api.category="api测试用例步骤管理"),
    /* 查询API测试用例步骤详情 */
    testapistep.GetTestAPIStepResponse GetTestAPIStep(1: testapistep.GetTestAPIStepRequest req) throws (1: common.Error err)(api.category="api测试用例步骤管理"),
    /* 校验API测试用例步骤信息 */
    testapistep.CheckTestAPIStepResponse CheckTestAPIStep(1: testapistep.CheckTestAPIStepRequest req) throws (1: common.Error err)(api.category="api测试用例步骤管理"),
    /* 删除API测试用例步骤 */
    testapistep.DeleteTestAPIStepResponse DeleteTestAPIStep(1: testapistep.DeleteTestAPIStepRequest req) throws (1: common.Error err)(api.category="api测试用例步骤管理"),

/* API测试历史管理 */
    /* 创建API测试历史 */
    testapihistory.CreateTestAPIHistoryResponse CreateTestAPIHistory(1: testapihistory.CreateTestAPIHistoryRequest req) throws (1: common.Error err)(api.category="api测试历史管理"),
    /* 更新API测试历史 */
    testapihistory.UpdateTestAPIHistoryResponse UpdateTestAPIHistory(1: testapihistory.UpdateTestAPIHistoryRequest req) throws (1: common.Error err)(api.category="api测试历史管理"),
    /* 查询API测试历史列表 */
    testapihistory.ListTestAPIHistoriesResponse ListTestAPIHistories(1: testapihistory.ListTestAPIHistoriesRequest req) throws (1: common.Error err)(api.category="api测试历史管理"),
    /* 查询API测试历史详情 */
    testapihistory.GetTestAPIHistoryResponse GetTestAPIHistory(1: testapihistory.GetTestAPIHistoryRequest req) throws (1: common.Error err)(api.category="api测试历史管理"),
    /* 删除API测试用例 */
    testapihistory.DeleteTestAPIHistoriesResponse DeleteTestAPIHistories(1: testapihistory.DeleteTestAPIHistoriesRequest req) throws (1: common.Error err)(api.category="api测试历史管理"),

/* API日志管理 */
    /* API调用日志列表 */
    apilog.ListAPILogsResponse ListAPILogs(1: apilog.ListAPILogsRequest req) throws (1: common.Error err)
    /* API调用日志详情 */
    apilog.GetAPILogResponse GetAPILog(1: apilog.GetAPILogRequest req) throws (1: common.Error err)

/* IDL生成API */
    /* 检查AccessToken有效性 */
    idlgenapi.CheckIDLAccessTokenResponse CheckIDLAccessToken(1: idlgenapi.CheckIDLAccessTokenRequest req) throws (1: common.Error err)(api.category="IDL生成API")
    /* 模糊搜索仓库 */
    idlgenapi.SearchIDLRepoResponse SearchIDLRepo(1: idlgenapi.SearchIDLRepoRequest req) throws (1: common.Error err)(api.category="IDL生成API")
    /* 模糊搜索分支 */
    idlgenapi.SearchIDLBranchResponse SearchIDLBranch(1: idlgenapi.SearchIDLBranchRequest req) throws (1: common.Error err)(api.category="IDL生成API")
    /* 模糊搜索idl文件 */
    idlgenapi.SearchIDLFileResponse SearchIDLFile(1: idlgenapi.SearchIDLFileRequest req) throws (1: common.Error err)(api.category="IDL生成API")
    /* 获取映射关系列表 */
    idlgenapi.GetIDLToAPIMapConfigResponse GetIDLToAPIMapConfig(1: idlgenapi.GetIDLToAPIMapConfigRequest req) throws (1: common.Error err)(api.category="IDL生成API")
    /* 生成API列表 */
    idlgenapi.GetIDLToAPIBaseInfoListResponse GetIDLToAPIBaseInfoList(1: idlgenapi.GetIDLToAPIBaseInfoListRequest req) throws (1: common.Error err)(api.category="IDL生成API")
    /* 创建关联IDL类型服务目录 */
    idlgenapi.CreateIDLAPICategoryResponse CreateIDLAPICategory(1: idlgenapi.CreateIDLAPICategoryRequest req) throws (1: common.Error err)(api.category="IDL生成API")
    /* 获取IDL同步任务信息 */
    idlgenapi.GetIDLSyncJobResponse GetIDLSyncJob(1: idlgenapi.GetIDLSyncJobRequest req) throws (1: common.Error err)(api.category="IDL生成API")
    /* 获取IDL类型服务目录信息 */
    idlgenapi.GetIDLAPICategoryResponse GetIDLAPICategory(1: idlgenapi.GetIDLAPICategoryRequest req) throws (1: common.Error err)(api.category="IDL生成API")
    /* 更新IDL类型服务目录 */
    idlgenapi.UpdateIDLAPICategoryResponse UpdateIDLAPICategory(1: idlgenapi.UpdateIDLAPICategoryRequest req) throws (1: common.Error err)(api.category="IDL生成API")
    /* 生成IDL类型服务目录API列表 */
    idlgenapi.GetCategoryIDLToAPIBaseListResponse GetCategoryIDLToAPIBaseList(1: idlgenapi.GetCategoryIDLToAPIBaseListRequest req) throws (1: common.Error err)(api.category="IDL生成API")
    /* 批量更新IDL类型服务目录API列表 */
    idlgenapi.UpdateIDLCategoryAPIListResponse UpdateIDLCategoryAPIList(1: idlgenapi.UpdateIDLCategoryAPIListRequest req) throws (1: common.Error err)(api.category="IDL生成API")
    /* 获取IDL文件内容 */
    idlgenapi.GetCategoryIDLFileContentResponse GetCategoryIDLFileContent(1: idlgenapi.GetCategoryIDLFileContentRequest req) throws (1: common.Error err)(api.category="IDL生成API")
    /* 更新IDL文件内容 */
    idlgenapi.UpdateCategoryIDLFileContentResponse UpdateCategoryIDLFileContent(1: idlgenapi.UpdateCategoryIDLFileContentRequest req) throws (1: common.Error err)(api.category="IDL生成API")
    /* 同步单个IDL类型API */
    idlgenapi.SyncIDLAPIResponse SyncIDLAPI(1: idlgenapi.SyncIDLAPIRequest req) throws (1: common.Error err)(api.category="IDL生成API")

/* IDL生成脚手架 */
    /* 获取服务目录关联idl仓库信息 */
    idlgenscaffold.GetCategoryIDLRepoInfoResponse GetCategoryIDLRepoInfo(1: idlgenscaffold.GetCategoryIDLRepoInfoRequest req) throws (1: common.Error err)(api.category="IDL生成脚手架")
    /* 筛选idl分支 */
    idlgenscaffold.SearchCategoryIDLBranchResponse SearchCategoryIDLBranch(1: idlgenscaffold.SearchCategoryIDLBranchRequest req) throws (1: common.Error err)(api.category="IDL生成脚手架")
    /* 筛选idl主文件 */
    idlgenscaffold.SearchCategoryIDLFileResponse SearchCategoryIDLFile(1: idlgenscaffold.SearchCategoryIDLFileRequest req) throws (1: common.Error err)(api.category="IDL生成脚手架")
    /* 获取idl生成脚手架规则信息 */
    idlgenscaffold.GetIDLGenScaffoldRuleResponse GetIDLGenScaffoldRule(1: idlgenscaffold.GetIDLGenScaffoldRuleRequest req) throws (1: common.Error err)(api.category="IDL生成脚手架")
    /* 筛选目标仓库ns */
    idlgenscaffold.SearchCategoryTargetNamespaceResponse SearchCategoryTargetNamespace(1: idlgenscaffold.SearchCategoryTargetNamespaceRequest req) throws (1: common.Error err)(api.category="IDL生成脚手架")
    /* 创建idl生成脚手架任务 */
    idlgenscaffold.CreateIDLGenScaffoldJobResponse CreateIDLGenScaffoldJob(1: idlgenscaffold.CreateIDLGenScaffoldJobRequest req) throws (1: common.Error err)(api.category="IDL生成脚手架")
    /* 获取idl生成脚手架任务信息 */
    idlgenscaffold.GetIDLGenScaffoldJobResponse GetIDLGenScaffoldJob(1: idlgenscaffold.GetIDLGenScaffoldJobRequest req) throws (1: common.Error err)(api.category="IDL生成脚手架")
    /* idl生成脚手架任务列表 */
    idlgenscaffold.ListIDLGenScaffoldJobResponse ListIDLGenScaffoldJob(1: idlgenscaffold.ListIDLGenScaffoldJobRequest req) throws (1: common.Error err)(api.category="IDL生成脚手架")
    
/* 监控统计 */
    /* 获取 API 运行数 */
    metrics.GetRunningApiCountResponse GetRunningAPICount(1: metrics.GetRunningApiCountRequest req)throws (1: common.Error err)(api.category="监控统计")
    /* API 请求成功率 */
    metrics.GetRequestSuccessRatioResponse GetRequestSuccessRatio(1: metrics.GetRequestSuccessRatioRequest req)throws (1: common.Error err)(api.category="监控统计")
    /* API 调用次数 */
    metrics.GetRequestCountResponse GetRequestCount(1: metrics.GetRequestCountRequest req)throws (1: common.Error err)(api.category="监控统计")
    /* 平均响应时长 */
    metrics.GetAverageLatencyResponse GetAverageLatency(1: metrics.GetAverageLatencyRequest req)throws (1: common.Error err)(api.category="监控统计")
    /* 平均请求大小 */
    metrics.GetAverageRequestSizeResponse GetAverageRequestSize(1: metrics.GetAverageRequestSizeRequest req)throws (1: common.Error err)(api.category="监控统计")
    /* 请求次数排名 */
    metrics.GetRequestsRatingResponse GetRequestsRating(1: metrics.GetRequestsRatingRequest req)throws (1: common.Error err)(api.category="监控统计")
    /* 流量统计 */
    metrics.GetRequestBandwidthResponse GetRequestBandwidth(1: metrics.GetRequestBandwidthRequest req)throws (1: common.Error err)(api.category="监控统计")
    /* 状态分布 */
    metrics.GetRequestStatusDistributionResponse GetRequestStatusDistribution(1: metrics.GetRequestStatusDistributionRequest req)throws (1: common.Error err)(api.category="监控统计")

/* 代码生成 */
    /* 获取 API 接口调用代码 */
    apicodegen.GenerateAPICodeResponse GenerateAPICode(1: apicodegen.GenerateAPICodeRequest req)throws (1: common.Error err)(api.category="代码生成")
    /* 获取 API 接口调用代码类型 */
    apicodegen.GetGenerateAPICodeTypeResponse GetGenerateAPICodeType(1: apicodegen.GetGenerateAPICodeTypeRequest req)throws (1: common.Error err)(api.category="代码生成")

/* nexus服务接口 */
    nexus.ListConsumersResponse ListConsumersNexus(1:nexus.ListConsumersRequest req)throws (1: common.Error err)(api.category="nexus接口"),
}
