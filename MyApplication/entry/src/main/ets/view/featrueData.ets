export default class feaTrueData{
  backgroundUrl:ResourceStr;
  title:Resource;
  content:Resource;

  constructor(title:Resource,backgroundUrl:ResourceStr,content:Resource) {
    this.backgroundUrl=backgroundUrl;
    this.title=title;
    this.content=content;
  }
}