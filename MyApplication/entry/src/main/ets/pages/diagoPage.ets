@Entry
@Component
struct DiagoPage {
  @State message: string = 'Hello World'

  build() {
    Column(){
      Button('警告类弹窗')
        .onClick(()=>{
          AlertDialog.show({
            title:'删除联系人',
            message: '是否需要删除所选联系人?', // 内容
            autoCancel: false, // 点击遮障层时，是否关闭弹窗。
            alignment: DialogAlignment.Bottom, // 弹窗在竖直方向的对齐方式
            offset: { dx: 0, dy: -10 }, // 弹窗相对alignment位置的偏移量
            primaryButton: {
              value: '取消',
              action: () => {
                console.info('Callback when the first button is clicked');
              }
            },
            secondaryButton: {
              value: '删除',
              fontColor: '#D94838',
              action: () => {
                console.info('Callback when the second button is clicked');
              }
            },
            cancel: () => { // 点击遮障层关闭dialog时的回调
              console.info('Closed callbacks');
            }
          })
        })
      Button('只有一个操作按钮的确认框')
        .onClick(()=>{
          AlertDialog.show(
            {
              title: '提示',
              message: '提示信息',
              autoCancel: true,
              alignment: DialogAlignment.Bottom,
              offset: { dx: 0, dy: -20 },
              confirm: {
                value: '确认',
                action: () => {
                  console.info('Callback when confirm button is clicked');
                }
              },
              cancel: () => {
                console.info('Closed callbacks')
              }
            }
          )
        })
    }
  }
}