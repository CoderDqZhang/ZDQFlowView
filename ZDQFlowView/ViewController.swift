//
//  ViewController.swift
//  ZDQFlowView
//
//  Created by Zhang on 8/24/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

import UIKit

let ScreenWidth = UIScreen.mainScreen().bounds.size.width

class ViewController: UIViewController {

    var flowView1:ZDQFlowView!
    var flowView2:ZDQFlowView!
    var flowView3:ZDQFlowView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpFlowView()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func setUpFlowView() {
        flowView1 = ZDQFlowView(frame: CGRectMake(0,110,ScreenWidth,90))
        flowView1.delegate = self
        flowView1.dataSource = self
        flowView1.tag = 1
        flowView1.itemNomalTextColor = UIColor.lightGrayColor()
        flowView1.itemSelectTextColor = UIColor.orangeColor()
        self.view.addSubview(flowView1)
        flowView1.reloadData()
        
        flowView2 = ZDQFlowView(frame: CGRectMake(0,210,ScreenWidth,90))
        flowView2.delegate = self
        flowView2.dataSource = self
        flowView2.tag = 2
        flowView2.itemNomalTextColor = UIColor.lightGrayColor()
        flowView2.itemSelectTextColor = UIColor.orangeColor()
        self.view.addSubview(flowView2)
        flowView2.reloadData()
        
        
        flowView3 = ZDQFlowView(frame: CGRectMake(0,310,ScreenWidth,90))
        flowView3.delegate = self
        flowView3.dataSource = self
        flowView3.tag = 3
        flowView3.itemNomalTextColor = UIColor.lightGrayColor()
        flowView3.itemSelectTextColor = UIColor.orangeColor()
        self.view.addSubview(flowView3)
        flowView3.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController : ZDQFlowViewDelegate {
    func flowViewDidSelectItem(flowView: ZDQFlowView, selectItem: NSInteger) {
        
    }
}

extension ViewController : ZDQFlowViewDataSource {
    func numberOfFlowViewItemCount(flowView: ZDQFlowView) -> NSInteger {
        if flowView.tag == 2 {
            return 3
        }else if flowView.tag == 3 {
            return 5
        }
        return 4
    }
    
    func flowViewItemSize(flowView: ZDQFlowView) -> CGSize {
        return CGSizeMake(60, 60)
    }
   
    func  numberOfFlowViewItem(flowView: ZDQFlowView, index: NSInteger) -> ZDQFlowViewItem {
        let viewItem = ZDQFlowViewItem()
        if flowView.tag == 2  {
            switch index {
            case 0:
                viewItem.setData("已确认",image: UIImage.init(),type: ZDQFlowViewItemType.ItemSelect)
            case 1:
                viewItem.setData("已取消",image: UIImage.init(),type: ZDQFlowViewItemType.ItemSelect)
            
            default:
                viewItem.setData("见面",image: UIImage.init(),type: ZDQFlowViewItemType.ItemWaitSelect)
            }
        }else if flowView.tag == 3 {
            switch index {
            case 0:
                viewItem.setData("已确认",image: UIImage.init(),type: ZDQFlowViewItemType.ItemSelect)
            case 1:
                viewItem.setData("已取消",image: UIImage.init(),type: ZDQFlowViewItemType.ItemSelect)
            case 2:
                viewItem.setData("付款",image: UIImage.init(),type: ZDQFlowViewItemType.ItemWaitSelect)
            case 3:
                viewItem.setData("付款",image: UIImage.init(),type: ZDQFlowViewItemType.ItemNext)
            default:
                viewItem.setData("见面",image: UIImage.init(),type: ZDQFlowViewItemType.ItemNext)
            }
        }else{
            
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
        }
        return viewItem
    }
}