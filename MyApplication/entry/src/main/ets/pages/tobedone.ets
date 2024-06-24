import { ListItemComponent } from '../view/Listtobedone'
import router from '@ohos.router';
@Entry
@Component
struct Tobedone {
  @State message: string = '待办'
  @State dataSource: string[] = ["早期晨练", "准备早餐", "阅读名著", "学习ARKTS"]
  build() {
    Column() {
      Row(){
        this.labelIcon($r('app.media.ic_public_back'))
        Text(this.message)
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
          .textAlign(TextAlign.Start)
      }
      .justifyContent(FlexAlign.Start)
      .width('100%')
      this.todolist()
    }
    .backgroundColor('#fff6f4f4')
    .height('100%')
  }

  @Builder todolist() {
    Column() {
      List() {
        ForEach(this.dataSource,
          (item: string, index?: number) => {
            ListItem() {
              ListItemComponent({ index: (Number(index) + 1), name: item
              }).width('100%').padding(10)
            }
          }, (item:string) => JSON.stringify(item))
      }
    }
    .height('100%')
    // .padding({top:5})
    .justifyContent(FlexAlign.SpaceEvenly)

    // .alignItems(HorizontalAlign.Center)
  }
  @Builder labelIcon(url){
    Image(url)
      .objectFit(ImageFit.Contain)
      .width($r('app.float.checkbox_width'))
      .height($r('app.float.checkbox_width'))
      .margin($r('app.float.checkbox_margin'))
  }
}