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
}
