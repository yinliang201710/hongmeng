export default class SettingData{
  img:ResourceStr;
  title:Resource;
  isMore?:Boolean;

  constructor(title:Resource,img:ResourceStr,isMore?:Boolean) {
    this.img=img;
    this.title=title;
    this.isMore=isMore;
  }
}