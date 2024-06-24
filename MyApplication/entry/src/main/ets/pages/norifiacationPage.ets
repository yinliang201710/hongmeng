import notification from '@ohos.notificationManager';
import image from '@ohos.multimedia.image'
// import resourceManager from '@ohos.resourceManager';
@Entry
@Component

struct NorifiacationPage {
  @State message: string = 'Hello World'
  publishInfoNotification() {
    let notificationRequest: notification.NotificationRequest = { // 描述通知的请求
      id: 1, // 通知ID
      slotType: notification.SlotType.SERVICE_INFORMATION,
      content: { // 通知内容
        contentType: notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT, // 普通文本类型通知
        normal: { // 基本类型通知内容
          title: '通知内容标题',
          text: '通知内容详情',
          additionalText: '通知附加内容', // 通知附加内容，是对通知内容的补充。
        }
      }
    }
    notification.publish(notificationRequest).then(() => { // 发布通知
      console.info('publish success');
    }).catch((err) => {
      console.error(`publish failed, dcode:${err.code}, message:${err.message}`);
    });
  }
  async publishImgNotification(){ // 没有发送成功
    // 1.获取资源管理器
    let resourceManager=getContext(this).resourceManager;
  //   2.获取文件buff
    let imageArray=await  resourceManager.getMediaContent($r("app.media.love").id)
  //   3.创建ImageSource实例对象
    let imageSource=image.createImageSource(imageArray.buffer)
  //   4.将图片转成pixelMap对象
    let pixelMap=await imageSource.createPixelMap();
    let notificationRequest:notification.NotificationRequest={
      id:2,
      slotType: notification.SlotType.SERVICE_INFORMATION,
      // @ts-ignore
      contentType: notification.ContentType.NOTIFICATION_CONTENT_PICTURE,
      picture:{
        title: '好物热销中', // 通知内容标题
        text: '展开查看详情', // 通知内容
        expandedTitle: '今日热门推荐', // 通知展开时的内容标题
        briefText: '这里一定有您喜欢的', // 通知概要内容，是对通知内容的总结
        picture: pixelMap // 通知的图片内容
      }
    }
    notification.publish(notificationRequest).then(() => { // 发布通知
      console.info('publish success');
    }).catch((err) => {
      console.error(`publish failed, dcode:${err.code}, message:${err.message}`);
    });
  }
  publishPressNotification(){
    // 先判断是否支持进度条模板
    notification.isSupportTemplate('downloadTemplate').then((data)=>{
      console.info(`[ANS] isSupportTemplate success`);
      let isSupportTpl:Boolean=data;
    }).catch((err)=>{
      console.error(`[ANS] isSupportTemplate failed, error[${err}]`);
    })
    // 定义下载模板
    let template={
      name:'downloadTemplate',
      data:{
        progressValue:60,
        ProgressMaxValue:100,
      }
    }
    let notificationRequest = {
      id: 1,
      content: {
        contentType: notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
        normal: {
          title: '文件下载：music.mp4',
          text: 'senTemplate',
          additionalText: '60%'
        }
      },
      template: template
    }
    // 发布通知
    notification.publish(notificationRequest).then(() => {
      console.info(`publish success`);
    }).catch(error => {
      console.error(`[ANS] publish failed, code is ${error.code}, message is ${error.message}`);
    })
  }
  build() {
    Row() {
      Column() {
        Button('发送普通通知')
          .onClick(() => {
            this.publishInfoNotification()
          })
        Button('发送图片通知')
          .onClick(() => {
            this.publishImgNotification()
          })
        Button('发送进度条通知')
          .onClick(() => {
            this.publishPressNotification()
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}