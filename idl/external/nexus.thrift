include "../base.thrift"
include "../common.thrift"

struct ConsumerListFilter {
    2: optional string ConsumerName
}

struct ConsumerItem {
    // AGW上的消费者ID
    1: required string ID
    // APISIX上的消费者名称
    2: required string ApisixConsumerName
    // 平台管理消费配置中的消费者名称
    3: required string ConsumerName
    // 用户的中文名称
    4: string DisplayName
}

struct ListConsumersRequest {
    1: required string GatewayID
    2: optional common.ListOption ListOpt
    3: optional ConsumerListFilter Filter


    /** Top相关的参数，前端不需要处理*/
    254: required base.TopParam Top,
    255: base.Base Base,
}

struct ListConsumersResponse {
    1: list<ConsumerItem> Items
    2: i32 Total

    255: base.BaseResp BaseResp,
}