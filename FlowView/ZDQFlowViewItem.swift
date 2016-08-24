//
//  ZDQFlowViewItem.swift
//  TestFlowView
//
//  Created by Zhang on 8/2/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

import UIKit

enum ZDQFlowViewItemType {
    case ItemSelect
    case ItemUnSelect
    case ItemWaitSelect
    case ItemCancel
    case ItemNext
    case ItemCancelDone
}

class ZDQFlowViewItem: UIView {

    var titleLabel:UILabel!
    var imageView:UIImageView!
    var itemType:ZDQFlowViewItemType!
    var itemSelectTextColor:UIColor = UIColor.orangeColor()
    var itemSelectFont:UIFont!
    var itemNomalTextColor:UIColor = UIColor.lightGrayColor()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView = UIImageView()
        self.addSubview(imageView)
        
        titleLabel = UILabel()
        titleLabel.font = UIFont.systemFontOfSize(11.0)
        titleLabel.textAlignment = .Center
        self.addSubview(titleLabel)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(title:String,image:UIImage, type:ZDQFlowViewItemType){
        itemType = type
        switch type {
        case .ItemSelect:
            imageView.image = UIImage.init(named: "item_select")
            titleLabel.textColor = itemSelectTextColor
        case .ItemUnSelect:
            imageView.image = UIImage.init(named: "item_unselect")
            titleLabel.textColor = itemNomalTextColor
        case .ItemWaitSelect:
            imageView.image = UIImage.init(named: "item_wait_select")
            titleLabel.textColor = itemSelectTextColor
        case .ItemNext:
            imageView.image = UIImage.init(named: "item_next")
            titleLabel.textColor = itemNomalTextColor
        case .ItemCancelDone:
            imageView.image = UIImage.init(named: "item_unselect")
            titleLabel.textColor = itemNomalTextColor
        default:
            imageView.image = UIImage.init(named: "item_cancel")
            titleLabel.textColor = itemNomalTextColor
        }
        titleLabel.text = title
    }
    
    override func updateConstraints() {
        imageView.frame = CGRectMake((frame.size.width - 29)/2, 0, 29, 29)
        titleLabel.frame = CGRectMake(0, CGRectGetMaxY(imageView.frame) + 6, frame.size.width, 16)
        super.updateConstraints()
    }
}
