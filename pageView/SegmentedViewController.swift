//
//  SegmentedViewController.swift
//  pageView
//
//  Created by Harshvirsinh Parmar on 14/12/21.
//

import UIKit

class SegmentedViewController: UIViewController {

    @IBOutlet var viewContainer: UIView!
    @IBOutlet var segmentcontrol: UISegmentedControl!
    var views: [UIView]!
    var postview1: UIView!
    var newUserview2: UIView!
    var hotUser3: UIView!
    var tag4: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        views = [UIView]()
        views.append(PostVc().view)
        views.append(NewUserVc().view)
        views.append(HotUserVc().view)
        views.append(TagVc().view)
        
        for v in views{
            viewContainer.addSubview(v)
        }
        viewContainer.bringSubviewToFront(views[0])
//postview1 = PostVc().view
//        newUserview2 = NewUserVc().view
//        hotUser3 = HotUserVc().view
//        tag4 = TagVc().view
        
//        viewContainer.addSubview(postview1)
//        viewContainer.addSubview(newUserview2)
//        viewContainer.addSubview(hotUser3)
//        viewContainer.addSubview(tag4)
        navigationItem.title = "Segmented View"
        
        self.segmentcontrol.frame = CGRect(x: self.segmentcontrol.frame.minX, y: self.segmentcontrol.frame.minY, width: segmentcontrol.frame.width, height: 50)
        segmentcontrol.highlightSelectedesegment()
                
        // Do any additional setup after loading the view.
    }
    

    @IBAction func segmentValuechngd(_ sender: UISegmentedControl) {
        segmentcontrol.underLinePosition()
        self.viewContainer.bringSubviewToFront(views[sender.selectedSegmentIndex])
    }
    
    

}
