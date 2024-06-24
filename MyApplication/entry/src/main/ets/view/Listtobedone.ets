import CommonConstants from "../common/contants/CommonConstant"
@Component
export struct ListItemComponent {
  @State isComplate:boolean=false;
  index?: number;
  name?:string;
  build(){
    Row(){
       if(this.isComplate){
         this.labelIcon($r('app.media.ic_ok'))
       }else{
         this.labelIcon($r('app.media.ic_default'))
       }
      Text(this.name).opacity(this.isComplate ? CommonConstants.OPACITY_COMPLETED : CommonConstants.OPACITY_DEFAULT)
        .decoration({ type: this.isComplate ? TextDecorationType.LineThrough : TextDecorationType.None })
    }.onClick(()=>{
      this.isComplate=!this.isComplate
    }).borderRadius(50).backgroundColor('#ffffff').width('100%')
  }
  @Builder labelIcon(url){
    Image(url)
      .objectFit(ImageFit.Contain)
      .width($r('app.float.checkbox_width'))
      .height($r('app.float.checkbox_width'))
      .margin($r('app.float.checkbox_margin'))
  }
}