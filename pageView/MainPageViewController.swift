//
//  MainPageViewController.swift
//  pageView
//
//  Created by Harshvirsinh Parmar on 15/12/21.
//

import UIKit

class MainPageViewController: UIViewController {
    
    let segmentedControl = segmented()
    
    private var lineView = UIView()
    
    var items:[String] = []
    var pages: [UIViewController] = []
    var pageController: UIPageViewController?
    var lastIndex: Int = 0
    
    var heightTabMenu:NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let vc1 = PostVc(nibName: "PostVc", bundle: nil)
        let vc2 = NewUserVc(nibName: "NewUserVc", bundle: nil)
        let vc3 = HotUserVc(nibName: "HotUserVc", bundle: nil)
        let vc4 = TagVc(nibName: "TagVc", bundle: nil)
        pages.append(vc1)
        pages.append(vc2)
        pages.append(vc3)
        pages.append(vc4)
        
        segmentedControl.insertSegment(withTitle: "TaG", at: 0, animated: false)
        segmentedControl.insertSegment(withTitle: "Hot User", at: 0, animated: false)
        segmentedControl.insertSegment(withTitle: "New User", at: 0, animated: false)
        segmentedControl.insertSegment(withTitle: "Post", at: 0, animated: false)
        
        setTopBar()
        setUpPageController()
            
        // Do any additional setup after loading the view.
    }
    
    private func setTopBar() {
        
        lineView.backgroundColor = .white
    
        
        self.view.addSubview(lineView)
        self.view.addSubview(segmentedControl)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        lineView.translatesAutoresizingMaskIntoConstraints = false
        
        let tHeight:CGFloat = pages.count == 1 ? 0 : 44
        heightTabMenu = segmentedControl.heightAnchor.constraint(equalToConstant: tHeight)
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
            segmentedControl.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            segmentedControl.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            heightTabMenu,
            lineView.heightAnchor.constraint(equalToConstant: 1),
            lineView.leadingAnchor.constraint(equalTo: segmentedControl.leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: segmentedControl.trailingAnchor),
            lineView.bottomAnchor.constraint(equalTo: segmentedControl.bottomAnchor)
        ])
        
        segmentedControl.addTarget(self, action: #selector(didChangeMenu), for: .valueChanged)
        DispatchQueue.main.async {
            self.segmentedControl.selectedSegmentIndex = 0
        }
    }
    
    private func setUpPageController() {
        
        self.pageController = UIPageViewController(transitionStyle: .pageCurl, navigationOrientation: .horizontal, options: nil)
        self.pageController?.dataSource = self
        self.pageController?.delegate = self
        self.pageController?.view.backgroundColor = .clear
        self.pageController?.view.frame = CGRect(x: 0,y: 0,width: self.view.frame.width,height: self.view.frame.height)
        self.addChild(self.pageController!)
        let pageView = self.pageController!.view!
        self.view.addSubview(pageView)
        pageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor),
            pageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            pageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            pageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        self.pageController?.setViewControllers([pages.first!], direction: .forward, animated: true, completion: nil)
        self.pageController?.didMove(toParent: self)
    }
    
    @objc func didChangeMenu() {
        var direction:UIPageViewController.NavigationDirection = .forward
        if lastIndex > segmentedControl.selectedSegmentIndex {
            direction = .reverse
        }
        pageController?.setViewControllers([pages[Int(segmentedControl.selectedSegmentIndex)]], direction: direction, animated: true, completion: nil)
        lastIndex = segmentedControl.selectedSegmentIndex
    }
}

extension MainPageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard var index = pages.firstIndex(of: viewController) else {
            return nil
        }
        if index == 0 {
            return nil
        }
        index -= 1
        return pages[index]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard var index = pages.firstIndex(of: viewController) else {
            return nil
        }
        
        if index >= self.pages.count - 1 {
            return nil
        }
        
        index += 1
        return pages[index]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if (!completed) {
            return
        }
        if let vc = pageViewController.viewControllers!.first, let index:Int = pages.firstIndex(of: vc) {
            segmentedControl.selectedSegmentIndex = index
            lastIndex = index
        }
    }
}
