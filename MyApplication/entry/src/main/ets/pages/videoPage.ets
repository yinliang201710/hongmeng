@Entry
@Component
struct VideoPage {
  private source: Resource=$rawfile('videoTest.mp4');
  private controller: VideoController;
  private previewUris:Resource=$r('app.media.preview');
  build() {
      Column() {
        Video({
          src: this.source,
          previewUri: this.previewUris,
          controller: this.controller
        })
          .zIndex(0)
          .controls(false) // 不显示控制栏
          .autoPlay(true) // 手动点击播放
          .loop(false) // 关闭循环播放
          .width('100%')
          .height('100%')
        // VideoSlider({ controller: this.controller })
      }
      .width('100%').height('100%')

  }
}