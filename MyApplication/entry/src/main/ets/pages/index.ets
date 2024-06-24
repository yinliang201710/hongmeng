import ResourceDs from '../view/resourceData'
import ItemData from '../view/ItemData'
import FeatureData from '../view/featrueData'
import SettingData from '../view/settingData'
@Entry
@Component
struct Index {
  @State title: string = '首页'
  @State currentIndex: number = 0
  private controller: TabsController = new TabsController()
  private swiperController: SwiperController = new SwiperController()
  @State datasource: Array<Resource> = [$r('app.media.fig1'),
  $r('app.media.fig2'),
  $r('app.media.fig3'),
  $r('app.media.fig4')]
  private  gridDs: ItemData[] = [
    new ItemData($r('app.string.my_love'), $r('app.media.love')),
    new ItemData($r('app.string.history_record'), $r('app.media.record')),
    new ItemData($r('app.string.message'), $r('app.media.message')),
    new ItemData($r('app.string.shopping_cart'), $r('app.media.shopping')),
    new ItemData($r('app.string.my_goal'), $r('app.media.target')),
    new ItemData($r('app.string.group'), $r('app.media.circle')),
    new ItemData($r('app.string.favorites'), $r('app.media.favorite')),
    new ItemData($r('app.string.recycle_bin'), $r('app.media.recycle'))]
  private settings: SettingData[]=[
    new SettingData($r('app.string.setting_list_news'), $r('app.media.news'),true),
    new SettingData($r('app.string.setting_list_data'), $r('app.media.data')),
    new SettingData($r('app.string.setting_list_menu'), $r('app.media.menu')),
    new SettingData($r('app.string.setting_list_about'), $r('app.media.about')),
    new SettingData($r('app.string.setting_list_storage'), $r('app.media.storage')),
    new SettingData($r('app.string.setting_list_privacy'), $r('app.media.privacy'))
  ]
  private username:string='yinliang'
  private email:string='liangyin6@huawei.com'

  build() {
    Tabs({ barPosition: BarPosition.End, controller: this.controller }) {
      TabContent() {
        Column() {
          Column() {
            Text('首页').width('100%').textAlign(TextAlign.Start).fontSize(30)
            this.swiperComponent()
            this.gridComponent()
            Text('列表').width('100%').textAlign(TextAlign.Start).fontSize(20).margin({top:30,bottom:10})
            this.getFeature()
          }.padding(10).height('100%').width('100%')
        }.height('100%').width("100%").justifyContent(FlexAlign.Start).backgroundColor("#F3F5F6")
      }.tabBar(this.tabsBuilder(0,'首页',$r('app.media.home_selected'), $r('app.media.home_normal')))
      TabContent() {
        Column() {
          Column(){
            Text('我的').width('100%').textAlign(TextAlign.Start).fontSize(30)
            this.getUserComponent()
          }.padding(10).height('100%').width('100%')
        }.height('100%').width("100%").justifyContent(FlexAlign.Start).backgroundColor("#fff3f3f6")
      }.tabBar(this.tabsBuilder(1,'我的',$r('app.media.mine_selected'), $r('app.media.mine_normal')))
    }
    .vertical(false)
    .barMode(BarMode.Fixed)
    .onChange((index:number)=>{
      this.currentIndex=index;
    })
  }
  @Builder tabsBuilder(index:number,title:string,selectImg:Resource,nomalImg:Resource){
    Column(){
        Image(this.currentIndex===index?selectImg:nomalImg).width(24)
        Text(title)
    }
  }
  @Builder swiperComponent() {
    Column(){
      Swiper(this.swiperController) {
        ForEach(this.datasource, (img: Resource) => {
          Image(img).width('100%')
        }, (img: Resource) => JSON.stringify(img.id))
      }.margin({ top: 30 })
      .autoPlay(true)
    }
    .width('100%').height(240)
  }
  @Builder gridComponent(){
    Column(){
      Grid(){
        ForEach(this.gridDs,(item:ItemData)=>{
            GridItem(){
              Column(){
                Image(item.img).width(28)
                Text(item.title)
              }
            }
        },(item)=>JSON.stringify(item))
      }
      .rowsTemplate('1fr 1fr')
      .columnsTemplate('1fr 1fr 1fr 1fr')
      .rowsGap(12)
      .columnsGap(8)
    }
    .width('100%')
    .height(120)
    .border({radius:10})
    .backgroundColor("#ffffff")
    .padding(5)
  }
  @Builder getFeature(){
    Column(){
      Grid(){
        ForEach(ResourceDs.getFeaTrue(),(item:FeatureData)=>{
            GridItem(){
              Column(){
                Column(){
                  Text(item.title).fontWeight(600).width("100%").textAlign(TextAlign.Start).fontSize(16)
                  Text(item.content).textAlign(TextAlign.Start).fontSize(12).width('100%').padding({top:5})
                }.justifyContent(FlexAlign.Start)
                .width('100%')
                .border({radius:5})
                .padding(5)
                .backgroundImage(item.backgroundUrl,ImageRepeat.X)
                .backgroundImageSize({width:200,height:100})
                .height('100%')
              }
              .width('100%')
            }
        },(item:FeatureData)=>JSON.stringify(item))
      }
      .columnsTemplate('1fr 1fr')
      .rowsTemplate('1fr 1fr')
      .rowsGap(12)
      .columnsGap(8)
      .width('100%')
    }
    .width('100%')
    .height(200)
  }
  @Builder getUserComponent(){
    Column(){
      Row(){
        Image($r("app.media.account")).width(50).margin(20)
        Column(){
            Text(this.username).width('100%').textAlign(TextAlign.Start).padding({bottom:5})
            Text(this.email).width('100%').textAlign(TextAlign.Start)
        }
      }.backgroundColor("#ffffff").border({radius:10})
      Column(){
        List(){
          ForEach(ResourceDs.getSetting(),(item:SettingData)=>{
            ListItem(){
              Column(){
                Row(){
                  Row(){
                    Image(item.img).width(24).height(24).margin({right:5})
                    Text(item.title)
                  }
                  if(item.isMore){
                    Toggle({type:ToggleType.Switch,isOn:true})
                      .selectedColor(0xed6f21)
                      .switchPointColor(0xe5ffffff)
                      .height(16)
                  }else{
                    Image($r("app.media.right_grey")).width(16).height(16)
                  }
                }.justifyContent(FlexAlign.SpaceBetween).width('100%').margin(10).backgroundColor('#ffffff')
              }
            }
          },(item:SettingData)=>JSON.stringify(item))
        }.divider({ strokeWidth: 2, color: '#fff3f3f6', startMargin: 20, endMargin: 20 })
      }.margin({top:20}).backgroundColor("#ffffff").border({radius:10}).padding({left:10,right:10})
      Button('退出登录').margin({top:180}).width('100%').backgroundColor("#E8E9EB").fontColor('#E28D78')
    }.width('100%').margin({top:30})
  }
}