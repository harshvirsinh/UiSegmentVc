//
//  ViewController.swift
//  pageView
//
//  Created by Harshvirsinh Parmar on 13/12/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var postBtn: UIButton!
    @IBOutlet var newUserBtn: UIButton!
    @IBOutlet var hotUserBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func postBtnClicked(_ sender: Any) {
        changeBtntxtColor(postbtnbg: .lightGray, postbtnclr: .white)
    }
    
    @IBAction func newUserBtnClicked(_ sender: Any) {
        changeBtntxtColor(newUserbg: .lightGray, newuserbtnclr: .white)
    }
    @IBAction func hotUserBtnClicked(_ sender: Any) {
        changeBtntxtColor(hotUserbg: .lightGray,hotuserbtnclr: .white)
    }
    func changeBtntxtColor(postbtnbg: UIColor = .white,newUserbg: UIColor = .white,hotUserbg: UIColor = .white,postbtnclr: UIColor = .blue,newuserbtnclr: UIColor = .blue,hotuserbtnclr: UIColor = .blue){
        
        postBtn.backgroundColor = postbtnbg
        newUserBtn.backgroundColor = newUserbg
        hotUserBtn.backgroundColor = hotUserbg
        
        
        
        postBtn.setTitleColor(postbtnclr, for: .normal)
        newUserBtn.setTitleColor(newuserbtnclr, for: .normal)
        hotUserBtn.setTitleColor(hotuserbtnclr, for: .normal)
    }
}

