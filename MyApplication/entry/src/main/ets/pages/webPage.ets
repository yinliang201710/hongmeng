@Entry
@Component
struct WebPage {
  @State message: string = 'Hello World'
  controller: WebController = new WebController();

  build() {
    Row() {
      Column() {
        Web({
          src:$rawfile('index.html'),
          controller:this.controller
        })
          .javaScriptAccess(true)
      }
      .width('100%')
    }
    .height('100%')
  }
}