//
//  ZDQFlowView.swift
//  TestFlowView
//
//  Created by Zhang on 8/2/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

import UIKit

protocol ZDQFlowViewDelegate {
    func flowViewDidSelectItem(flowView:ZDQFlowView, selectItem:NSInteger) -> Void
}

protocol ZDQFlowViewDataSource {
    
    /**
     总共有多少个Item
    */
    func numberOfFlowViewItemCount(flowView:ZDQFlowView) -> NSInteger
    /**
     每个item的样式
     
     - parameter flowView:
     - parameter index:
     这里可以自定义视图的样式
     - returns: ZDQFlowViewItem
     */
    func numberOfFlowViewItem(flowView:ZDQFlowView, index:NSInteger) -> ZDQFlowViewItem
    /**
     每个item的宽高
     
     - parameter flowView:
     
     - returns:
     */
    func flowViewItemSize(flowView:ZDQFlowView) -> CGSize
}


class ZDQFlowView: UIView {

    internal var delegate:ZDQFlowViewDelegate!
    internal var dataSource:ZDQFlowViewDataSource!
    internal var spaceWidthX:CGFloat = 0
    
    var itemSelectFont:UIFont!
    var itemSelectTextColor:UIColor = UIColor.blackColor()
    
    var itemNomalFont:UIFont!
    var itemNomalTextColor:UIColor = UIColor.lightGrayColor()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
        
    }
    //MARK: ===============
    func setDataSource(dataSource:ZDQFlowViewDataSource) {
        self.dataSource = dataSource
        self.reloadData()
    }
    
    func getDataSource() -> ZDQFlowViewDataSource{
        return dataSource
    }
    
    func reloadData() {
        let size = self.dataSource.flowViewItemSize(self)
        let number = self.dataSource.numberOfFlowViewItemCount(self)
        let itemWith:CGFloat = size.width * CGFloat(number)
        let count = CGFloat(number) - 1
        spaceWidthX = (self.frame.size.width - itemWith) / count
        for subviews in self.subviews {
            subviews.removeFromSuperview()
        }
        /**
         *  计算每个Item的位置信息
         */
        for index in 0...number - 1 {
            let item = self.dataSource.numberOfFlowViewItem(self, index: index) 
            item.frame = CGRectMake((size.width + spaceWidthX) * CGFloat(index), 0, size.width, size.height)
            let label = UILabel()
            label.frame = CGRectMake(CGRectGetMaxX(item.frame) + 2, 14, spaceWidthX - 4, 1)
            
            if item.itemType == ZDQFlowViewItemType.ItemSelect {
                label.backgroundColor = itemSelectTextColor
                item.titleLabel.textColor = itemSelectTextColor
            }else{
                item.titleLabel.textColor = itemNomalTextColor
                label.backgroundColor = itemNomalTextColor
            }
            if index < number - 1 {
                self.addSubview(label)
            }
            item.updateConstraints()
            self.addSubview(item)
        }
    }
    
}


