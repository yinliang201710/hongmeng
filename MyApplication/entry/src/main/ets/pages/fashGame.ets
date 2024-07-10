import router from '@ohos.router'
@Entry
@Component
struct FashGame {
  @State isBegin: boolean = true
  @State fishX:number=200
  @State fishY:number=0
  @State angle:number=0
  @State src:Resource=$r('app.media.fish')
  build() {
    Row() {
     Stack(){
       Button('返回')
         .position({x:0,y:'-48%'})
         .backgroundColor('#20101010')
         .onClick(()=>{
            router.back()
         })
       if(!this.isBegin){
         Button('开始游戏')
           .onClick(()=>{
             this.isBegin=true
           })
           .position({x:'50%'})
       }else{
          Image(this.src)
            .width(60)
            .position({x:this.fishX-20,y:this.fishY-20})
         Row(){
           Button('←').backgroundColor('#20101010')
           .onClick(()=>{
             animateTo({duration:500},()=>{
               this.fishX-=20
               this.src=$r('app.media.refish2')
             })
           })
           Column({space:40}){
             Button('↑').backgroundColor('#20101010')
               .onClick(()=>{
                 animateTo({duration:500},()=>{
                   this.fishY-=20
                 })
               })
             Button('↓').backgroundColor('#20101010')
               .onClick(()=>{
                 animateTo({duration:500},()=>{
                   this.fishY+=20
                 })
               })
           }
           Button('→').backgroundColor('#20101010')
             .onClick(()=>{
               animateTo({duration:500},()=>{
                 this.fishX+=20
                 this.src=$r('app.media.fish')
               })
             })
         }.position({x:20,y:0})
       }
     }
     .width('100%')
         }

    .height('100%')
    .backgroundImage($r('app.media.fashbg'))
    .backgroundImageSize({width:'100%',height:'100%'})
  }
}