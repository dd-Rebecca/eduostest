struct TrafficEnv {
    1: bool Open = false,
    2: string Env = "",
}

struct Base {
    1: string LogID = "",
    2: string Caller = "",
    3: string Addr = "",
    4: string Client = "",
    5: optional TrafficEnv TrafficEnv,
    6: optional map<string, string> Extra,
}

struct BaseResp {
    1: string StatusMessage = "",
    2: i32 StatusCode = 0,
    3: optional map<string, string> Extra,
}

struct TopParam {
    /** 请求的RequestId*/
    1: required string RequestId (go.tag = 'header:"X-Top-Request-Id"'),
    /** 主账号ID*/
    2: required i64 AccountId (go.tag = 'header:"X-Top-Account-Id" validate:"gt=0"'),
    /** 子账号ID，能够访问主账号授权的资源*/
    3: optional i64 UserId (go.tag = 'header:"X-Top-User-Id"'),
    /** 角色ID，能够访问主账号授权的资源*/
    4: optional i64 RoleId (go.tag = 'header:"X-Top-Role-Id"'),
    /** 请求的目的服务*/
    5: required string DestService (go.tag = 'header:"X-Top-Service"'),
    /** 请求的源服务*/
    6: required string SourceService (go.tag = 'header:"X-Top-Source"'),
    /** 请求的地域*/
    7: optional string Region (go.tag = 'header:"X-Top-Region"'),
    /** 请求的真实IP*/
    8: optional string RealIp (go.tag = 'header:"X-Top-Real-Ip"'),
    /** 是否内部账号， 1：是， 0： 否*/
    9: optional i32 IsInternal (go.tag = 'header:"X-Top-Account-IsInternal"'),
    /** Psm 地址*/
    10: optional string Psm (go.tag = 'header:"X-Psm"'),
    /** Top 的位置*/
    11: optional string Site (go.tag = 'header:"X-Top-Site"'),
}

struct BaseResponse {
    255: BaseResp BaseResp,
}