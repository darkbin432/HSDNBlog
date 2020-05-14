# 计生协信息化WebFinalWork数据库库拓扑

## 说明

数据库固定字段

| 字段名       | 类型         | 备注           |
| ------------ | ------------ | -------------- |
| id           | int          | 主键           |
| created_time | datetime     | 创建时间       |
| updated_time | datetime     | 更新时间       |
| version      | varchar(255) | 版本号         |
| status       | tinyint(1)   | 1存在、0被删除 |



* git目录

```
--- WebFinalWork项目
	----front	前端
		----vue		
	----backend 后台
		----springmvc
		
		
branch
	--- master
	--- dev-1.0
	--- dev-kzn
	--- dev-xht
```

* .gitignore

```
.idea
.eclipse
.log
.config
```

* 图片文件等资源

```
--- tomcat 
	--- webapp
		--- WebFinalWorkResource
			--- images
			--- videos
			--- files
		--- WebFinalWork.war
```




## 会员信息表huiyuan

| 字段名           | 类型         | 备注                                    |
| ---------------- | ------------ | --------------------------------------- |
| id               | int          | 主键                                    |
| name             | varchar(255) | 会员姓名                                |
| sex              | tinyint(1)   | 性别（0 女性 1 男性）                   |
| card_no          | varchar(255) | 身份证号码（年龄根据身份证号码计算）    |
| address          | varchar(255) | 现居住址                                |
| mobile           | varchar(20)  | 联系电话                                |
| scope_id         | int          | 所在区域                                |
| political        | int          | 政治面貌                                |
| service_type     | int          | 服务对象0失独人群1育龄家庭2青少年       |
| volunteer_status | int          | 志愿者状态 0不是 1是                    |
| huiyuan_type     | tinyint(1)   | 0个体会员/1团体会员/2流动人口/3常住人口 |
| notify_status    | tinyint(1)   | 是否愿意接收协会的活动通知              |
| description      | text         | 介绍和描述                              |
| created_time     | datetime     | 创建时间                                |
| updated_time     | datetime     | 更新时间                                |
| version          | varchar(255) | 版本号                                  |
| status           | tinyint(1)   | 是否删除                                |



## 活动信息表activity

| 字段名                 | 类型          | 备注                                               |
| ---------------------- | ------------- | -------------------------------------------------- |
| id                     | int           | 主键                                               |
| project_id             | int           | 项目id                                             |
| approval_id            | int           | 审批机构id                                         |
| check_states           | int           | 审批状态(3无需审批  2审批未通过 1审批通过 0未审批) |
| title                  | varchar(255)  | 活动名称                                           |
| initiator_id           | int           | 创建人id                                           |
| head_member_id         | int           | 活动负责人id                                       |
| create_member_scope_id | int           | 活动创建人区域id                                   |
| activity_area          | int           | 活动地址                                           |
| start_time             | datetime      | 启动时间                                           |
| end_time               | datetime      | 结束时间                                           |
| huiyuan_limit          | int           | 会员人数限制 0 不限制                              |
| volunteer_limit        | int           | 志愿者人数限制 0 不限制                            |
| description            | text          | 介绍和描述                                         |
| attachment             | varchar(5000) | 附件地址集合                                       |
| summary                | text          | 活动总结                                           |
| summary_image          | text          | 总结照片                                           |
| is_filed               | tinyint       | 是否归档 1是 0否                                   |
| created_time           | datetime      | 创建时间                                           |
| updated_time           | datetime      | 更新时间                                           |
| version                | varchar(255)  | 版本号                                             |
| status                 | tinyint(1)    | 是否删除                                           |



## 会员记录表huiyuan_activity

| 字段名           | 类型         | 备注                                              |
| ---------------- | ------------ | ------------------------------------------------- |
| id               | int          | 主键                                              |
| huiyuan_id       | int          | 会员id                                            |
| activity_id      | int          | 活动id                                            |
| volunteer_status | tinyint(1)   | 是否以志愿者身份参与  0未审批 1通过 2拒绝 3未申请 |
| attend_status    | tinyint(1)   | 签到状态 0 未签到 1签到                           |
| created_time     | datetime     | 创建时间                                          |
| updated_time     | datetime     | 更新时间                                          |
| version          | varchar(255) | 版本号                                            |
| status           | tinyint(1)   | 是否删除                                          |



## 机构信息表organization

| 字段名                 | 类型         | 备注     |
| ---------------------- | ------------ | -------- |
| id                     | int          | 主键     |
| name                   | varchar(255) | 机构名称 |
| type                   | int          | 机构性质 |
|                        | int          | 机构排序 |
| mobile                 | varchar(20)  | 联系电话 |
| hotline                | varchar(20)  | 值班电话 |
| address                | varchar(255) | 机构地址 |
| postalcode             | varchar(10)  | 邮政编码 |
| fax                    | varchar(20)  | 传真     |
| parent_organization_id | int          | 上级机构 |
| created_time           | datetime     | 创建时间 |
| updated_time           | datetime     | 更新时间 |
| version                | varchar(255) | 版本号   |
| status                 | tinyint(1)   | 是否删除 |



## 机构成员表organization_member

| 字段名          | 类型         | 备注                       |
| --------------- | ------------ | -------------------------- |
| id              | int          | 主键                       |
| username        | varchar(255) | 用户名                     |
| password        | varchar(255) | 密码                       |
| name            | varchar(255) | 成员姓名                   |
| sex             | tinyint(1)   | 性别                       |
| sequence        | int          | 成员排序                   |
| mobile          | varchar(20)  | 移动电话                   |
|                 | varchar(20)  | 办公电话                   |
| organization_id | int          | 机构id                     |
| position        | varchar(255) | 职位                       |
| address         | varchar(255) | 现居住址                   |
| type            | int          | 权限类型 0普通用户 1管理员 |
| created_time    | datetime     | 创建时间                   |
| updated_time    | datetime     | 更新时间                   |
| version         | varchar(255) | 版本号                     |
| status          | tinyint(1)   | 是否删除                   |



## 公告信息表announcement

| 字段名                 | 类型          | 备注                     |
| ---------------------- | ------------- | ------------------------ |
| id                     | int           | 主键                     |
| title                  | varchar(255)  | 标题                     |
| create_member_id       | int           | 发布者id                 |
| create_member_scope_id | int           | 发布者区域id             |
| read_count             | int           | 点击次数                 |
| attachment             | varchar(5000) | 附件地址集合             |
| content                | text          | 内容                     |
| created_time           | datetime      | 创建时间(发布时间)       |
| updated_time           | datetime      | 更新时间（最后修改时间） |
| version                | varchar(255)  | 版本号                   |
| status                 | tinyint(1)    | 是否删除                 |



## 资讯信息表zixun

| 字段名           | 类型          | 备注                     |
| ---------------- | ------------- | ------------------------ |
| id               | int           | 主键                     |
| title            | varchar(255)  | 标题                     |
| create_member_id | int           | 发布者                   |
| read_count       | int           | 点击次数                 |
| attachment       | varchar(5000) | 附件地址集合             |
| content          | text          | 内容                     |
| created_time     | datetime      | 创建时间(发布时间)       |
| updated_time     | datetime      | 更新时间（最后修改时间） |
| version          | varchar(255)  | 版本号                   |
| status           | tinyint(1)    | 是否删除                 |



## 宣教信息表xuanjiao

| 字段名                 | 类型           | 备注主键               |
| ---------------------- | -------------- | ---------------------- |
| id                     | int            | 主键                   |
| name                   | varchar(255)   | 课程名称               |
| type                   | int            | 宣教类型               |
| create_member_scope_id | int            | 发布者区域id           |
| attachment             | varchar(5000)  | 图片文件名集合         |
| video                  | varcahr（255） | 视频文件名集合         |
| pdf                    | varchar(255)   | pdf文件名集合          |
| pdf_name               | varcahr(255)   | pdf名称集合            |
| content                | text           | 内容                   |
| created_time           | datetime       | 创建时间（发布时间）   |
| updated_time           | datetime       | 更新时间(最后修改时间) |
| version                | varchar(255)   | 版本号                 |
| status                 | tinyint（1）   | 是否删除               |



## 项目信息表project

| 字段名       | 类型         | 备注     |
| ------------ | ------------ | -------- |
| id           | int          | 主键     |
| name         | text         | 项目名称 |
| description  | text         | 项目内容 |
| created_time | datetime     | 创建时间 |
| updated_time | datetime     | 更新时间 |
| version      | varchar(255) | 版本号   |
| status       | tinyint(1)   | 是否删除 |



## 邮件信息表mail

| 字段名          | 类型          | 备注                 |
| --------------- | ------------- | -------------------- |
| id              | int           | 主键                 |
| in_mail         | int           | 发件人id             |
| to_mail         | varchar(255)  | 收件人id集合         |
| subject         | varchar(255)  | 主题                 |
| content         | varchar(5000) | 内容                 |
| attachment      | varchar(5000) | 附件地址集合         |
| attachment_name | varchar(5000) | 附件名称集合         |
| attachment_size | varchar(5000) | 附件大小集合         |
| date            | datetime      | 发送时间             |
| send_status     | tinyint(1)    | 状态 1已发送\0草稿箱 |
| in_star         | tinyint(1)    | 发件人是否星标       |
| is_garbage      | tinyint(1)    | 是否放入回收站       |
| created_time    | datetime      | 创建时间             |
| updated_time    | datetime      | 更新时间             |
| version         | varchar(255)  | 版本号               |
| status          | tinyint(1)    | 是否删除             |



## 邮件_成员对应表 mail_people_relationship

| 字段名                 | 类型         | 备注           |
| ---------------------- | ------------ | -------------- |
| id                     | int          | 主键           |
| mail_id                | int          | 邮件id         |
| organization_member_id | int          | 收件人id       |
| is_read                | tinyint(1)   | 是否已读       |
| to_star                | tinyint(1)   | 收件人是否星标 |
| is_garbage             | tinyint(1)   | 是否放入回收站 |
| created_time           | datetime     | 创建时间       |
| updated_time           | datetime     | 更新时间       |
| version                | varchar(255) | 版本号         |
| status                 | tinyint(1)   | 是否删除       |



## 机构_范围对应表organization_scope_relationship

| 字段名          | 类型         | 备注       |
| --------------- | ------------ | ---------- |
| id              | int          | 主键       |
| organization_id | int          | 机构id     |
| scope_id        | int          | 活动范围id |
| name            | varchar(255) | 范围名称   |
| created_time    | datetime     | 创建时间   |
| updated_time    | datetime     | 更新时间   |
| version         | varchar(255) | 版本号     |
| status          | tinyint(1)   | 是否删除   |



## 公告_范围对应表announcement_scope_relationship

| 字段名          | 类型         | 备注       |
| --------------- | ------------ | ---------- |
| id              | int          | 主键       |
| announcement_id | int          | 公告id     |
| scope_id        | int          | 活动范围id |
| created_time    | datetime     | 创建时间   |
| updated_time    | datetime     | 更新时间   |
| version         | varchar(255) | 版本号     |
| status          | tinyint(1)   | 是否删除   |



## 活动_范围对应表 activity_scope_relationship

| 字段名       | 类型         | 备注       |
| ------------ | ------------ | ---------- |
| id           | int          | 主键       |
| activity_id  | int          | 活动id     |
| scope_id     | int          | 活动范围id |
| created_time | datetime     | 创建时间   |
| updated_time | datetime     | 更新时间   |
| version      | varchar(255) | 版本号     |
| status       | tinyint(1)   | 是否删除   |



## 会员管理分析报表huiyuan_report 

| 字段名        | 类型         | 备注       |
| ------------- | ------------ | ---------- |
| id            | int          | 主键       |
| scope_id      | int          | 区域id     |
| is_filed      | tinyint(1)   | 是否归档   |
| huiyuan_count | int          | 会员数     |
| male          | int          | 男性会员数 |
| geti          | int          | 个体会员数 |
| tuanti        | int          | 团体会员数 |
| liudong       | int          | 流动人口数 |
| changzhu      | int          | 常住人口数 |
| shidu         | int          | 失独人数   |
| yuling        | int          | 育龄人数   |
| qingshaonian  | int          | 青少年数   |
| created_time  | datetime     | 创建时间   |
| updated_time  | datetime     | 更新时间   |
| version       | varchar(255) | 版本号     |
| status        | tinyint(1)   | 是否删除   |



## 项目工作分析报表project_work_report



## 年度报表year_report

| 字段名                               | 类型         | 备注                          |
| :----------------------------------- | ------------ | ----------------------------- |
| id                                   | int          | id                            |
| organization_id                      | int          | 机构id                        |
| organization_member_id               | int          | 上报人                        |
| report_year                          | int          | 上报年度                      |
| fluid_population_organization_number | int          | 企业和流动人口 计生协组织个数 |
| fluid_population_VIP_number          | Int          | 企业和流动人口 计生协会员个数 |
| shi_teacher_numbe                    | int          | 现有市级师资                  |
| xian_teacher_number                  | int          | 现有县级师资                  |
| shi_base_number                      | int          | 现有市级基地                  |
| xian_base_number                     | int          | 现有县级基地                  |
| school_number                        | int          | 现有高校                      |
| broadcast_number                     | int          | 县级以上广播电视报道          |
| paper_medium_number                  | int          | 县级以上纸媒报道              |
| adult_training_scene                 | int          | 青少年讲座培训场次            |
| adult_training_number                | int          | 青少年讲座培训人数            |
| parent_training_scene_number         | int          | 家长讲座培训场次              |
| parent_training_number               | int          | 家长讲座培训人数              |
| help_scene_number                    | int          | 计生协帮扶和服务场次          |
| help_number_number                   | int          | 计生协帮扶和服务对象人数      |
| pair_help_logarithm_number           | int          | 特殊家庭结对帮扶对数          |
| minfei_organization_number           | int          | 现有相关民非组织数            |
| village_community_number             | int          | 村、社区总数                  |
| new_revision_village_number          | int          | 新修订计生村规民约的村数      |
| pending_revision_village_number      | int          | 有待修订计生村规民约的村数    |
| rights_protection_point_number       | int          | 计生维权试点个数              |
| reproduction_birth_scene_number      | int          | 举办生殖优生等培训讲座数      |
| reproduction_birth_number            | int          | 参加生殖优生等培训讲座数人数  |
| receive_help_number                  | int          | 受助对象户数                  |
| relief_fund                          | decimal      | 慰问救助资金                  |
| oneiromancy_number                   | int          | 圆梦微心愿个数                |
| oneiromancy_money                    | decimal      | 圆梦微心愿资金                |
| theme_publicity_scene_number         | int          | 主题宣传场次                  |
| theme_publicity_people_number        | int          | 主题宣传人数                  |
| theme_publicity_issue_number         | int          | 主题宣传资料发放数量          |
| microblog_status                     | tinyint(1)   | 市一级是否有官微(0无 1有)     |
| microblog_number                     | int          | 市一级有官微数                |
| jisheng_peixun_scene_number          | int          | 市县计生协举办培训场次        |
| jisheng_peixun_number                | int          | 市县计生协举办培训人数        |
| teacher_peixun_scene_number          | int          | 青春健康师资培训场次          |
| teacher_peixun_number                | int          | 青春健康师资培训人数          |
| gugan_peixun_scene_number            | int          | 计生特殊家庭帮扶骨干培训场次  |
| gugan_peixun_number                  | int          | 计生特殊家庭帮扶骨干培训人数  |
| created_time                         | datetime     | 创建时间                      |
| updated_time                         | datetime     | 更新时间                      |
| version                              | varchar(255) | 版本号                        |
| status                               | tinyint(1)   | 是否删除                      |



## 组织建设报表 Organization_construction_report_info

| 字段名           | 类型         | 备注                 |
| ---------------- | ------------ | -------------------- |
| id               | int          | id                   |
| scope_id         | int          | 区域id               |
| report_person_id | int          | 上报人id             |
| is_filed         | int          | 是否归档             |
| xingzhengqsl     | int          | 行政区数量           |
| jigousl          | int          | 机构数量             |
| dangzusl         | int          | 党组数量             |
| dangzhibsl       | int          | 党支部数量           |
| ruxu             | int          | 入序                 |
| cangong          | int          | 参公                 |
| sanding          | int          | 三定                 |
| neishejgsl       | int          | 内设机构数量         |
| jigoujssl        | int          | 机构数量             |
| xingzhengbz      | int          | 行政编制             |
| shiyebz          | int          | 事业编制             |
| qitabz           | int          | 其他编制             |
| zaibianryrs      | int          | 在编人员人数         |
| zaibianrynxsl    | int          | 在编人员女性人数     |
| zaibianrydysl    | int          | 在编人员党员人数     |
| zhengting        | int          | 厅局级正厅级人数     |
| futing           | int          | 厅局级副厅级人数     |
| zhengchu         | int          | 处级正厅级人数       |
| fuchu            | int          | 处级副厅级人数       |
| zhengke          | int          | 正科级人数           |
| fuke             | int          | 副科级人数           |
| keyuanjyx        | int          | 科员及以下人数       |
| jianzhipydqtrys  | int          | 兼职聘用等其他人员数 |
| lishirs          | int          | 理事人数             |
| lishinx          | int          | 理事女性人数         |
| tuantihy         | int          | 团体会员人数         |
| gerenhyrs        | int          | 个人会员人数         |
| gerenhynx        | int          | 个体会员中女性人数   |
| zhiyuanzrs       | int          | 志愿者人数           |
| zhiyuanzdws      | int          | 志愿者队伍人数       |
| huiyuanxz        | int          | 会员小组             |
| huiyuanzj        | int          | 会员之家             |
| wenhuast         | int          | 文化社团             |
| huodongzdstqt    | int          | 活动阵地、社团其他   |
| dulicwysjg       | int          | 独立财务预算机构     |
| benniandczbke    | int          | 本年度财政拨款额     |
| jijinh           | int          | 基金会               |
| jiguansyjsx      | int          | 机关事业计生协       |
| liudongrkjsx     | int          | 流动人口计生协       |
| created_time     | datetime     | 创建时间             |
| updated_time     | datetime     | 更新时间             |
| version          | varchar(255) | 版本号               |
| status           | tinyint(1)   | 是否删除             |



## 活动审批记录表activity_approval_record

| 字段名        | 类型         | 备注                                   |
| ------------- | ------------ | -------------------------------------- |
| id            | int          | id                                     |
| activity_id   | int          | 活动id                                 |
| approval_id   | int          | 审批人id                               |
| approval_name | varchar(20)  | 审批人姓名                             |
| result        | tinyint(1)   | 审批结果 0未审批 1通过 2拒绝 3无需审批 |
| created_time  | datetime     | 创建时间                               |
| updated_time  | datetime     | 更新时间                               |
| version       | varchar(255) | 版本号                                 |
| status        | tinyint(1)   | 是否删除                               |



## 志愿者审批记录表volunteer_approval_record

| 字段名        | 类型         | 备注                           |
| ------------- | ------------ | ------------------------------ |
| id            | int          | id                             |
| huiyuan_id    | int          | 会员id                         |
| approval_id   | int          | 审批人id                       |
| approval_name | varchar(20)  | 审批人姓名                     |
| result        | tinyint(1)   | 审批结果 0拒绝 1通过 2尚未审批 |
| created_time  | datetime     | 创建时间                       |
| updated_time  | datetime     | 更新时间                       |
| version       | varchar(255) | 版本号                         |
| status        | tinyint(1)   | 是否删除                       |