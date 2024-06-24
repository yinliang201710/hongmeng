通过官方的学习自己编写，去掉了官方推荐的组件化，并将大部分组件使用放到同个组件模块中方便学习和研究，更适合学习
1.使用版本3.2，项目已构建和打包到appGally，app应用，非元服务版本。项目地址：https://developer.huawei.com/consumer/cn/service/josp/agc/index.html#/myApp
2.使用DevEco Studio开发，配置下载3.2，3.1，3.0SDK（使用3.2SDK模拟机启动会报错，故选用3.1,3.0版本的部分依赖）模拟机这个问题很坑，官方论坛IT都没给到解决方案，自己尝试才解决，构建工具hvigor,使用的ohpm依赖包，项目已开源后续会继续更新，git地址：https://github.com/yinliang201710/hongmeng
3.首页使用直接嵌套路由，多入口，可通过不同bt进入到不同路由
4.登录页面，使用容器组件column进行页面布局，@state生命用户输出账号密码，使用Image用户组件和TextInput，password组件，用户密码校验，登录跳转Index页面
5.首页采用tabs组件，TabsController控制器限制跳转行为，tbbcontent使用grid布局，并创建@builder装饰器构建tabBar组件加载不同头部
6.featrue模块使用swiper轮播组件，引用的本地资源资源管理器resource获取静态资源模拟接口数据
7.弹窗构建，使用AlertDiaglog组件实现图片，和customDiaglog自定义组件实现图片和信息加载弹窗
8.使用notificationRequest发送推送通知，从创建图像资源到图片资源使用资源管理器转换成pixlMap对象，再使用notificationRequest发送，需要使用真机或模拟机才能收取到信息
9.使用本地media-mp4资源加载动画，实现视频的拖拽和暂停
10.web组件构建网络请求，使用node搭建本地资源html，使用oncomfir回调渲染页面
11.使用http模块，creathttp请求，返回一个pomise对象，处理接口请求
后续继续更新
