# ZDQFlowView

```类似淘宝交易流程图
支持pod
pod 'ZDQFlowView'
```
`项目效果图`
![](QQ20160824-0@2x.png =375*1168)

cocoaPods 安装 [地址](http://www.tuicool.com/articles/7VvuAr3"Title") 

创建ZDQFlowView对象

```swift
flowView = ZDQFlowView(frame: CGRectMake(0,110,ScreenWidth,90))
flowView.delegate = self
flowView.dataSource = self
//设置未选中颜色
flowView.itemNomalTextColor = UIColor.lightGrayColor()
//设置选择颜色
flowView.itemSelectTextColor = UIColor.orangeColor()
self.view.addSubview(flowView1)
flowView.reloadData()
```

设置代理方法Delegate

```swift
 /**
     当前点击在哪一项
     
     - parameter flowView:
     - parameter selectItem: 选中的第几个
     */
    func flowViewDidSelectItem(flowView: ZDQFlowView, selectItem: NSInteger) {
        
    }
```

设置数据源DataSource

```swift
/**
 总共有多少个流程

 - parameter flowView:

 - returns: 流程个数
 */
func numberOfFlowViewItemCount(flowView: ZDQFlowView) -> NSInteger {
        return 4
    }
 /**
 每个item的高度和宽度

 - parameter flowView:

 - returns: Item高度和宽度
 */  
func flowViewItemSize(flowView: ZDQFlowView) -> CGSize {
    return CGSizeMake(60, 60)
}
   /**
     每个item的高度和宽度
     
     - parameter flowView:
     
     - returns: Item高度和宽度
     */
    func  numberOfFlowViewItem(flowView: ZDQFlowView, index: NSInteger) -> ZDQFlowViewItem {
        let viewItem = ZDQFlowViewItem()
        switch index {
            case 0:
                viewItem.setData("已确认",image: UIImage.init(),type: ZDQFlowViewItemType.ItemCancelDone)
            case 1:
                viewItem.setData("已取消",image: UIImage.init(),type: ZDQFlowViewItemType.ItemCancel)
            case 2:
                viewItem.setData("付款",image: UIImage.init(),type: ZDQFlowViewItemType.ItemSelect)
            default:
                viewItem.setData("见面",image: UIImage.init(),type: ZDQFlowViewItemType.ItemNext)
        }
        return viewItem
    }
```

