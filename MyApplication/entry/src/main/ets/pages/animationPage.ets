@Entry
@Component
struct AnimationPage {
  @State message: string = 'Hello World'
  @State imgWith:number=30
  build() {
    Row() {
      Column() {
        Image($r('app.media.love'))
          .width(this.imgWith)
          .position({ x: this.imgWith,y:this.imgWith*(-1)})
          .objectFit(ImageFit.Contain)
          .animation({
            duration: 1000,
            tempo: 1.0,
            delay: 0,
            curve: Curve.LinearOutSlowIn,
            playMode: PlayMode.Alternate,
            iterations: -1
          })
        Button('按下开始动')
          .onClick(()=>{
            if(this.imgWith===100){
              this.imgWith=30;
            }else{
              this.imgWith=100;
            }

          })
      }
      .width('100%')
    }
    .height('100%')
  }
}