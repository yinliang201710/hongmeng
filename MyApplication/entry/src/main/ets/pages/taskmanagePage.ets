
class titleOption{
  current:number
  total:number

  constructor(props) {
    this.current=props.current
    this.total=props.total
  }
}

@Observed
class Task {
  static id:number=1;// 静态变量
  taskName:string=`任务${Task.id++}`
  status:boolean=false
}
@Styles function card(){
  .width('95%')
  .padding(20)
  .backgroundColor(Color.White)
  .borderRadius(15)
  .shadow({radius:6,color:'#1F000000',offsetX:2,offsetY:4})
}
@Entry
@Component
struct TaskmanagePage {
  @State current:number=0;
  @State total:number=0;
  build() {
      Column() {
        TitleComponent({current:this.current,total:this.total})
        AddTask({current:$current,total:$total})
        // TaskList({tasks:$tasks})
      }
      .width('100%').height('100%').padding(20).backgroundColor('#F1F2F3')
  }
}

@Component
struct  TitleComponent{
  @Prop current:number;
  @Prop total:number;
  build() {
    Row(){
      Text('任务进度:').fontSize(18)
      Stack(){
        Progress({ value: 20, total: 100, type: ProgressType.ScaleRing })
          .style({strokeWidth:5})
        Row(){
          Text(this.current.toString())
          Text('/')
          Text(this.total.toString())
        }
      }
    }
    .border({radius:30}).width('100%').justifyContent(FlexAlign.Center).backgroundColor('#ffffff')
  }
}

@Component
struct  AddTask{
  @Link current:number
  @Link total:number
  @State tasks:Task[]=[];
  build() {
     Column(){
       Row(){
         Button('新增任务').type(ButtonType.Capsule).width('50%')
           .onClick(()=>{
             this.tasks.push(new Task())
             this.total++;
           })
       }.justifyContent(FlexAlign.Center).margin(20)
       TaskList({tasks:$tasks,current:$current,total:$total})
     }.width('100%').height('100%')
  }
}

@Component
struct  TaskList{
  @Link tasks:Task[]
  @Link current:number
  @Link total:number
  build() {
    Column(){
      List({space:20,initialIndex:0}){
        ForEach(this.tasks,(item,index)=>{
          ListItem(){
            Row(){
              Text(item.taskName)
              Checkbox()
                .select(item.status)
                .onChange(val=>{
                  if(val){
                    this.current++
                  }else{
                    this.current--
                  }
                })
            }
            .justifyContent(FlexAlign.SpaceBetween).card()
          }
          .swipeAction({end:this.DeleteButton(index)})
        },(item)=> JSON.stringify(item.taskName))
      }
      .width('100%')
      .layoutWeight(1)
      .alignListItem(ListItemAlign.Center)
    }
  }
  @Builder DeleteButton(index:number){
      Button(){
        Image($r('app.media.circle'))
          .fillColor(Color.White)
          .width(20)
      }
    .width(40)
    .height(40)
    .type(ButtonType.Circle)
    .backgroundColor(Color.Red)
    .margin(5)
    .onClick(()=>{

        this.tasks.splice(index,1)
    })
  }
}