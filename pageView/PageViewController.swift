//
//  PageViewController.swift
//  pageView
//
//  Created by Harshvirsinh Parmar on 15/12/21.
//

import UIKit

class PageViewController: UIViewController {
    
    var vcList: [UIViewController] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        let vc1 = PostVc(nibName: "PostVc", bundle: nil)
        let vc2 = NewUserVc(nibName: "NewUserVc", bundle: nil)
        let vc3 = HotUserVc(nibName: "HotUserVc", bundle: nil)
        let vc4 = TagVc(nibName: "TagVc", bundle: nil)
        vcList.append(vc1)
        vcList.append(vc2)
        vcList.append(vc3)
        vcList.append(vc4)
        //self.delegate = self
        //self.dataSource = self
       
    }
    
}

extension PageViewController: UIPageViewControllerDelegate,UIPageViewControllerDataSource {
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return vcList.count
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = vcList.lastIndex(of: viewController) else { return nil }
        let previousIndex = index - 1
        guard previousIndex >= 0 else {return nil}
        guard previousIndex < vcList.count else {return nil}
        return vcList[previousIndex]
        
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = vcList.lastIndex(of: viewController) else { return nil }
        let previousIndex = index + 1
        guard previousIndex >= 0 else {return nil}
        guard previousIndex < vcList.count else {return nil}
        return vcList[previousIndex]
        
        
    }

}










//var views: [UIView]!
//override func viewDidLoad() {
//    super.viewDidLoad()
//    views = [UIView]()
//    self.dataSource = self
//    self.delegate = self
//    // Do any additional setup after loading the view.
//}
//func pageController(for index: Int)-> SegmentedViewController?{
//    if index < 0{
//        return nil
//    }
//    if index >= views.count{
//        return nil
//    }
//    let vc = (storyboard?.instantiateViewController(withIdentifier: "SegmentedViewController")as! SegmentedViewController)
//
//    return vc
//}
//
//
//}
//

