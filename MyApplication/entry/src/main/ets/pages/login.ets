import router from '@ohos.router';
@Entry
@Component
struct Login {
  @State name: string = ''
  @State password: string = ''
  @State isshowprogress:boolean=false
  build() {
      Column() {
        Image($r('app.media.logo')).width('80fp').margin({top:80})
        Text('登录界面').fontSize(28).padding(5)
        Text('登录账号以使用更多服务')
        // @ts-ignore
        TextInput({ placeholder: 'Accout'})
          .fontSize(30)
          .fontWeight(FontWeight.Medium)
          .fontColor('#1890ff')
          .height(50)
          .backgroundColor('#fff')
          .border({width:{bottom:1|1},color:'#ccc'})
          .onChange((value: string) => {
            this.name = value
          })
          .margin({top:40})
        TextInput({ placeholder: 'Password'})
          .fontSize(30)
          .fontWeight(FontWeight.Medium)
          .backgroundColor('#fff')
          .height(50)
          .border({width:{bottom:1|1},color:'#ccc'})
          .type(InputType.Password)
          .padding({top:5,bottom:5})
          .onChange((value: string) => {
            this.password = value
          })
        Row(){
          Text('短信验证码登录').fontColor("#1890ff")
          Text('忘记密码').fontColor("#1890ff")
        }.justifyContent(FlexAlign.SpaceBetween)
        .width('100%')
        .padding({left:10,right:10})
        .margin({top:10})
        Button('登录',{type:ButtonType.Capsule}).width('80%').margin({top:80})
          .onClick(()=>{
            router.pushUrl({url:'pages/index'})
          })
        Text('注册账号').fontColor("#1890ff").margin(10)
        if(this.isshowprogress){
          LoadingProgress().color('#1890ff').margin({top:40})
        }
        Text('其他登陆方式').margin({top:100,bottom:20})
        Row(){
          Button('方式一',{stateEffect:true}).type(ButtonType.Circle).width(64).backgroundColor('#ffffff').fontColor('1890ff').border({width:1})
          Button('方式二',{stateEffect:true}).type(ButtonType.Circle).width(64).backgroundColor('#ffffff').fontColor('1890ff').border({width:1}).margin({left:5,right:5})
          Button('方式三',{stateEffect:true}).type(ButtonType.Circle).width(64).backgroundColor('#ffffff').fontColor('1890ff').border({width:1})
        }.justifyContent(FlexAlign.Center).width('100%')
      }
      .width('100%')
      .height('100%')
    }
}