import ItemData from './ItemData'
import FeatureData from './featrueData'
import SettingData from './settingData'
export class SourceData{
  getSwiperImages(): Array<Resource> {
    let swiperImages: Resource[] = [
    $r('app.media.fig1'),
    $r('app.media.fig2'),
    $r('app.media.fig3'),
    $r('app.media.fig4')
    ];
    return swiperImages;
  }
  getGridData():Array<ItemData>{
      let firstGridData: ItemData[] = [
      new ItemData($r('app.string.my_love'), $r('app.media.love')),
      new ItemData($r('app.string.history_record'), $r('app.media.record')),
      new ItemData($r('app.string.message'), $r('app.media.message')),
      new ItemData($r('app.string.shopping_cart'), $r('app.media.shopping')),
      new ItemData($r('app.string.my_goal'), $r('app.media.target')),
      new ItemData($r('app.string.group'), $r('app.media.circle')),
      new ItemData($r('app.string.favorites'), $r('app.media.favorite')),
      new ItemData($r('app.string.recycle_bin'), $r('app.media.recycle'))
    ];
    return firstGridData;
  }
  getFeaTrue():Array<FeatureData>{
    let feature:FeatureData[]=[
      new FeatureData($r('app.string.mainPage_top'), $r('app.media.top'), $r('app.string.mainPage_text_top')),
      new FeatureData($r('app.string.mainPage_new'), $r('app.media.new'), $r('app.string.mainPage_text_new')),
      new FeatureData($r('app.string.mainPage_brand'), $r('app.media.brand'), $r('app.string.mainPage_text_brand')),
      new FeatureData($r('app.string.mainPage_found'), $r('app.media.found'), $r('app.string.mainPage_text_found'))
    ]
    return feature
  }
  getSetting():Array<SettingData>{
    let setting:SettingData[]=[
      new SettingData($r('app.string.setting_list_news'), $r('app.media.news'),true),
      new SettingData($r('app.string.setting_list_data'), $r('app.media.data')),
      new SettingData($r('app.string.setting_list_menu'), $r('app.media.menu')),
      new SettingData($r('app.string.setting_list_about'), $r('app.media.about')),
      new SettingData($r('app.string.setting_list_storage'), $r('app.media.storage')),
      new SettingData($r('app.string.setting_list_privacy'), $r('app.media.privacy'))
    ]
    return setting
  }
}

export default new SourceData()