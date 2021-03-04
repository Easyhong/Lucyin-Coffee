//
//  MainViewController.swift
//  luckincoffee
//
//  Created by taozhang on 2020/4/29.
//  Copyright © 2020 Easyhong. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var headeView: UIView!
    @IBOutlet weak var headViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var itemView: UIView!
    @IBOutlet weak var itemViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var mainScrollerView: UIScrollView!
    
    
   lazy var headerMaskLayer: HeaderMaskLayer = {
        let headerMaskLayer = HeaderMaskLayer()
        headerMaskLayer.frame = CGRect.init(x: 0, y: 0, width: screenWidth, height: screenHeight * 0.4)
        return headerMaskLayer
             
      }()
    
   lazy var headScrollerView : MainHeadScrollerView = {
         let headScrollerView = MainHeadScrollerView()
         headScrollerView.backgroundColor = UIColor.white
         headScrollerView.layer.cornerRadius = 12
         headScrollerView.translatesAutoresizingMaskIntoConstraints = false
         return headScrollerView
   }()
    
   lazy var themeView: ThemeView = {
        let themeView = ThemeView.createFromXib()
        themeView?.layer.cornerRadius = 12
        themeView?.translatesAutoresizingMaskIntoConstraints = false
        return themeView! as! ThemeView
    }()
    
    lazy var recommendView: RecommendView = {
        let recommendView = RecommendView.createFromXib()
        recommendView?.layer.cornerRadius = 12
        recommendView?.translatesAutoresizingMaskIntoConstraints = false
        return recommendView! as! RecommendView
        
    }()
    
    lazy var freshView: FreshView = {
          let freshView = FreshView.createFromXib()
          freshView?.translatesAutoresizingMaskIntoConstraints = false
          return freshView! as! FreshView
          
    }()
    
    lazy var hotView: HotView = {
         let hotView = HotView.createFromXib()
         hotView?.translatesAutoresizingMaskIntoConstraints = false
         return hotView! as! HotView
             
    }()
      
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.headeView.layer.addSublayer(headerMaskLayer)

        mainScrollerView.delegate = self
        headViewHeightConstraint.constant = screenHeight * 0.4
        itemViewHeightConstraint.constant = 1500
        addHeadScrollerViewLayoutConstraint()
        addThemeViewLayoutConstraint()
        addRecommendViewLayoutConstraint()
        addFreshViewLayoutConstraint()
        addHotViewLayoutConstraint()
               
    }
    
   
    
    
    func addHeadScrollerViewLayoutConstraint() {
        self.headeView.addSubview(headScrollerView)
        self.headeView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[view]-10-|", options: [], metrics: nil, views: ["view": self.headScrollerView]))
        self.headeView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-40-[view]-40-|", options: [], metrics: nil, views: ["view": self.headScrollerView]))
    }
    
    func addThemeViewLayoutConstraint() {
        self.itemView.addSubview(themeView)
        self.itemView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[view]-10-|", options: [], metrics: nil, views: ["view": self.themeView]))
        self.itemView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-(-30)-[view(275)]|", options: [], metrics: nil, views: ["view": self.themeView]))
    }
    
    
    func addRecommendViewLayoutConstraint() {
        self.itemView.addSubview(recommendView)
        self.itemView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[view]-10-|", options: [], metrics: nil, views: ["view": self.recommendView]))
        self.itemView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-255-[view(275)]|", options: [], metrics: nil, views: ["view": self.recommendView]))
    }
    
    
    func addFreshViewLayoutConstraint() {
        self.itemView.addSubview(freshView)
        self.itemView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[view]-10-|", options: [], metrics: nil, views: ["view": self.freshView]))
        self.itemView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-540-[view(275)]|", options: [], metrics: nil, views: ["view": self.freshView]))
        
        
    }
    
    func addHotViewLayoutConstraint() {
        self.itemView.addSubview(hotView)
        self.itemView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[view]-10-|", options: [], metrics: nil, views: ["view": self.hotView]))
        self.itemView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-825-[view(700)]|", options: [], metrics: nil, views: ["view": self.hotView]))
    }
}

extension MainViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 0.5 {
            
            NSLog("下滑")
            
        } else if scrollView.contentOffset.y > 0 {
            
             NSLog("上滑")
        }
    }
}
