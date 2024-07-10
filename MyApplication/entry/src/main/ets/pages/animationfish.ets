import router from '@ohos.router'
import curves from '@ohos.curves'
@Entry
@Component
struct Animationfish {
  @State isBegin: boolean = false
  @State fishX:number=200
  @State fishY:number=0
  // 小鱼的角度
  @State angle:number=0
  @State src:Resource=$r('app.media.fish')

  private centerX:number=120
  private centerY:number=120
 // 设置方向按键和指针
  private maxRadius:number=100
  private radius:number=20

  // 小球的坐标轴
  @State positionX:number=this.centerX
  @State positionY:number=this.centerY
  // 存储正弦与余弦
  @State sin:number=0
  @State cos:number=0
  // 小鱼移动速度
  @State speed:number=0
  // 小鱼移动定时器
  @State taskId:number=-1

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
              animateTo({duration:1000},()=>{
                this.isBegin=true
              })
            })
            .position({x:'50%'})
        }else{
          Image(this.src)
            .width(60)
            .position({x:this.fishX-20,y:this.fishY-20})
             .rotate({angle:this.angle,centerX:'50%',centerY:'50%'})
             .transition({
               type: TransitionType.Insert,
                opacity:0,
               translate:{x:-250},
             })
        }
        Row(){
          Circle({width:this.maxRadius*2,height:this.maxRadius*2})
            .position({x:this.centerX-this.maxRadius,y:this.centerY-this.maxRadius})
            .fill('#20101010')
          Circle({width:this.radius*2,height:this.radius*2})
            .position({x:this.positionX-this.radius,y:this.positionY-this.radius})
            .fill('#403A3A3A')
        }
        .width(240)
        .height(240)
        .justifyContent(FlexAlign.Center)
        .position({x:20,y:40})
        .onTouch(this.handChangeEvent.bind(this))
      }
      .width('100%')
    }

    .height('100%')
    .backgroundImage($r('app.media.fashbg'))
    .backgroundImageSize({width:'100%',height:'100%'})
  }
  handChangeEvent(event:TouchEvent){
    switch (event.type){
      case TouchType.Up:
        this.speed=0;
        clearInterval(this.taskId)
        animateTo({duration:500},()=>{
          this.positionX=this.centerX;
          this.positionY=this.centerY;
        })
        break;
      case TouchType.Down:
        // 视觉效果每帧25毫秒才能感觉到
       this.taskId= setInterval(()=>{
         this.fishX+=this.speed*this.cos;
         this.fishY+=this.speed*this.sin;
       },40)
        break;
      case TouchType.Move:
      // 获取手指位置
        const fingerX:number=event.touches[0].x
        const fingerY:number=event.touches[0].y

      // 计算手指与中心位置点得坐标差
        const chaX:number=fingerX-this.centerX
        const chaY:number=fingerY-this.centerY
      //   计算手指与中心点连线的正弦值
        let angle=Math.atan2(chaY,chaX)
      //   计算手指与中心点的距离
        let distance=this.getDistance(chaX,chaY)
      // 计算摇杆小球的坐标
        this.sin=Math.sin(angle)
        this.cos=Math.cos(angle)
      // curves手指跟随动画
        animateTo({curve:curves.responsiveSpringMotion()},()=>{
          this.positionX=this.centerX+this.cos*distance
          this.positionY=this.centerY+this.sin*distance
          // 判断小鱼的角度
          // if(Math.abs(angle*2)<Math.PI){
          //   this.src=$r('app.media.fish')
          // }else{
          //   this.src=$r('app.media.refish2')
          //   angle=angle<0?angle+Math.PI:angle-Math.PI
          // }
          if(fingerX<this.centerX){
            this.src=$r('app.media.refish2')
            angle=angle<0?angle+Math.PI:angle-Math.PI
          }else{
            this.src=$r('app.media.fish')
          }
          this.angle=angle*180/Math.PI
          this.speed=5
          // this.fishX+=this.cos*distance*20
        })
        break;
      case TouchType.Cancel:
        break;

    }
  }
  getDistance(x:number,y:number){
      const d=Math.sqrt(x*x+y*y)
      return Math.min(d,this.maxRadius)
  }
}