import router from '@ohos.router';
@Entry
@Component
struct EntryS {
  private controller: TabsController = new TabsController()
  routers:string[]=[
    "pages/RankPage",
    "pages/tobedone",
    "pages/login",
    "pages/index",
    "pages/videoPage",
    "pages/diagoPage",
    "pages/animationPage",
    "pages/webPage",
    "pages/norifiacationPage",
    "pages/entry"]
  build() {
      Column() {
        Button('tobedone')
        .onClick(()=>{
          router.replaceUrl({url:"pages/tobedone"})
        })
        Button('Index')
          .onClick(()=>{
            router.replaceUrl({url:'pages/Index'})
          })
        Button('RankPage')
          .onClick(()=>{
            router.pushUrl({url:'pages/RankPage'})
          })
        Button('login')
          .onClick(()=>{
            router.pushUrl({url:'pages/login'})
          })
        Button('videoPage')
          .onClick(()=>{
            router.pushUrl({url:'pages/videoPage'})
          })
        Button('diagoPage')
          .onClick(()=>{
            router.pushUrl({url:'pages/diagoPage'})
          })
        Button('norifiacationPage')
          .onClick(()=>{
            router.pushUrl({url:'pages/norifiacationPage'})
          })
        Button('animationPage')
          .onClick(()=>{
            router.pushUrl({url:'pages/animationPage'})
          })
        Button('webPage')
        .onClick(()=>{
          router.pushUrl({url:'pages/webPage'})
        })
      }.justifyContent(FlexAlign.SpaceEvenly)
      .width('100%').height('100%')
    }
}