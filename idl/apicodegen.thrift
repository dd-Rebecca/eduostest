include "base.thrift"
include "common.thrift"
include "base.thrift"

struct GenerateAPICodeRequest {
	// 环境ID
	1: required string EnvID,
	// 版本
	2: optional string VersionID,
	// 代码语言类型: cURL HTTP Golang Java.OkHttp Java.Unirest Nodejs.Request Nodejs.Native JavaScript.Unirest JavaScript.Request JavaScript.Native JavaScript.XHR JavaScript.jQuery JavaScript.Axios JavaScript.Fetch
	3: required string Type (go.tag = 'validate:"oneof=cURL HTTP Golang Java.OkHttp Java.Unirest Nodejs.Request Nodejs.Native JavaScript.Unirest JavaScript.Request JavaScript.Native JavaScript.XHR JavaScript.jQuery JavaScript.Axios JavaScript.Fetch"'),
	// api ID
	4: required string APIID,
    // ws ID
    5: required string WorkspaceID,

	/** Top相关的参数，前端不需要处理*/
	254: required base.TopParam Top,
	255: base.Base Base,
}
struct GenerateAPICodeResponse {
	1: string code,

	255: base.BaseResp BaseResp,
}

struct GetGenerateAPICodeTypeRequest {
	// 获取主分类
	1: optional bool Type,
    // 获取子分类: cURL HTTP Golang Java Nodejs JavaScript
    2: optional string SubType (go.tag = 'validate:"omitempty,oneof=cURL HTTP Golang Java Nodejs JavaScript"'),

	/** Top相关的参数，前端不需要处理*/
	254: required base.TopParam Top,
	255: base.Base Base,
}
struct GetGenerateAPICodeTypeResponse {
	1: list<string> types,

	255: base.BaseResp BaseResp,
}
