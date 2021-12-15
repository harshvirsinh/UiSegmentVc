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
    var counter = 0
    var views: [UIView]!
    var postview1: UIView!
    var newUserview2: UIView!
    var hotUser3: UIView!
    var tag4: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: -pageViewController
    
        
        //MARK: -Swipe Gesture
        segmentcontrol.selectedSegmentIndex = counter
        let swipeleft = UISwipeGestureRecognizer(target: self, action: #selector(handlegesture(getrure:)))
        self.view.addGestureRecognizer(swipeleft)
        swipeleft.direction = .left
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handlegesture(getrure:)))
        swipeRight.direction = .right
        self.viewContainer.addGestureRecognizer(swipeRight)
        views = [UIView]()
        views.append(PostVc().view)
        views.append(NewUserVc().view)
        views.append(HotUserVc().view)
        views.append(TagVc().view)
        
        for v in views{
            viewContainer.addSubview(v)
        }
        viewContainer.bringSubviewToFront(views[0])
        
        navigationItem.title = "Segmented View"

        
        self.segmentcontrol.frame = CGRect(x: self.segmentcontrol.frame.minX, y: self.segmentcontrol.frame.minY, width: segmentcontrol.frame.width, height: 50)
        segmentcontrol.highlightSelectedesegment()
    }
    //MARK: -pageViewController code
   
    //MARK: -SwipeGesture
    @objc func handlegesture(getrure:UISwipeGestureRecognizer){
        if counter >= 0 && counter < views.count{
            if getrure.direction == UISwipeGestureRecognizer.Direction.right
            {
                if counter != 0{
                    counter = counter - 1
                  
                    segmentcontrol.selectedSegmentIndex = counter
                    segmentcontrol.underLinePosition()
                    self.viewContainer.bringSubviewToFront(views[counter])

                }
            }
            if getrure.direction == UISwipeGestureRecognizer.Direction.left
            {
                if counter != views.count-1
                {
                    counter = counter+1
                    segmentcontrol.selectedSegmentIndex = counter
                    segmentcontrol.underLinePosition()

                    self.viewContainer.bringSubviewToFront(views[counter])
                }
            }
        }
    }

    @IBAction func segmentValuechngd(_ sender: UISegmentedControl) {
        segmentcontrol.underLinePosition()
        self.viewContainer.bringSubviewToFront(views[sender.selectedSegmentIndex])
        counter = segmentcontrol.selectedSegmentIndex
    }
    
    

}
