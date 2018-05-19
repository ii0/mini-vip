Creator.Objects.vip_card =
	name: "vip_card"
	label: "会员卡"
	icon: "apps"
	fields:
		card_number:
			label:"卡号"
			type:'text'
			is_name:true
			required:true
		points:
			label:'积分'
			type:'number'
		grade:
			label:'等级'
			type:'select'
			options:[
				{label: "普通", value: "普通"},
				{label: "白银", value: "白银"},
				{label: "黄金", value: "黄金"},
				{label: "铂金", value: "铂金"},
				{label: "砖石", value: "砖石"}
			]
		discount:
			label:'折扣'
			type:'number'
		balance:
			label:'余额'
			type:'number'
		store:
			label:'办卡门店'
			type:'master_detail'
			reference_to:'vip_store'
		apply_stores:
			label:'适用门店'
			type:'lookup'
			reference_to:'vip_store'
			mutiple:true
		start_time:
			label:'办卡时间'
			type:'datetime'
		validity_period:
			label:'有效期'
			type:'select'
			options:[
				{label: "永久", value: "永久"},
				{label: "20年", value: "20年"},
				{label: "10年", value: "10年"},
				{label: "5年", value: "5年"},
				{label: "3年", value: "3年"},
				{label: "2年", value: "2年"},
				{label: "1年", value: "1年"}
			]
		user:
			label:'持卡人'
			type:'master_detail'
			reference_to:'users'
		introducer:
			label:'推荐人'
			type:'lookup'
			reference_to:'users'
		is_actived:
			label:'是否激活'
			type:'boolean'
		actived_time:
			label:'激活时间'
			type:'datetime'
		# shared_users:
		#     label: "共享用户"
		#     type:'lookup'
		#     mutiple: true
		#     reference_to:'users'
		enable_forward:
			label:'允许转发'
			type:'boolean'
			defaultValue:false
		forward_count:
			label:'转发次数'
			type:'number'
			omit:true
		description:
			label:'备注'
			type:'textarea'
	list_views:
		all:
			label: "所有会员卡"
			columns: ["user","card_number", "points", "grade","balance","store","apply_stores"]
			filter_scope: "space"
		mine:
			label: "我的会员卡"
			filters: [["user", "=", "{Meteor.userId}"]]
			columns: ["card_number", "points", "grade","balance","store","apply_stores"]