import lottie from '@ohos/lottie'
@Entry
@Component
struct LottlePage {
  // 初始化渲染上下文
  private mainRenderingSettings: RenderingContextSettings = new RenderingContextSettings(true) // 设置开启抗锯齿
  private mainCanvasRenderingContext: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.mainRenderingSettings)  // 创建2D渲染上下文
  @State message: string = 'Hello World'
  private path:string = "common/lottie/data.json"
  animationItem:any=null
  aboutToAppear(){
    this.animationItem = lottie.loadAnimation({
      container: this.mainCanvasRenderingContext,            // 渲染上下文
      renderer: 'canvas',                          // 渲染方式
      loop: true,                                  // 是否循环播放,默认true
      autoplay: true,                              // 是否自动播放，默认true
      path: this.path,             // json路径
    })
  }
  build() {
    Row() {
      Column() {
        // Text(this.message)
        //   .fontSize(50)
        //   .fontWeight(FontWeight.Bold)
        Canvas(this.mainCanvasRenderingContext)
          .width('50%')
          .height(360 + 'px')
          .backgroundColor(Color.Gray)
          .onReady(()=>{
            //抗锯齿的设置
            this.mainCanvasRenderingContext.imageSmoothingEnabled = true;
            this.mainCanvasRenderingContext.imageSmoothingQuality = 'medium'
          })
         Button('点击动画')
           .onClick(()=>{
            // this.animationItem?.destroy('2016'); //加载动画前先销毁之前加载的动画
            //  this.animationItem = lottie.loadAnimation({
            //    container: this.mainCanvasRenderingContext,  // 渲染上下文
            //    renderer: 'canvas',                          // 渲染方式
            //    loop: true,                                  // 是否循环播放,默认true
            //    autoplay: true,                              // 是否自动播放，默认true
            //    name: '2016',                                // 动画名称
            //    contentMode: 'Contain',                      // 填充的模式
            //    frameRate: 30,                               //设置animator的刷帧率为30
            //    path: this.path,                             // json路径
            //    initialSegment: [10,50]                      // 播放的动画片段
            //  })
           })
      }
      .width('100%')
    }
    .height('100%')
  }
}