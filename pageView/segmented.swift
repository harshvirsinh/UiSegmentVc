//
//  segmented.swift
//  pageView
//
//  Created by Harshvirsinh Parmar on 14/12/21.
//

import UIKit

class segmented: UISegmentedControl {

   
}
extension UIImage{
    //MARK: -UiImage Exetnsion code
    class func getsegrect(color: CGColor,andSize size: CGSize)->UIImage{
      
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color)
        let rectangle = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
        context?.fill(rectangle)
        
        let rectangleImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return rectangleImage!
    }
    
   
}
extension UISegmentedControl{
    //MARK: -uisegmentedControl extension Code
    
    func removeBorder(){
        let background = UIImage.getsegrect(color: UIColor.clear.cgColor, andSize: self.bounds.size)
        self.setBackgroundImage(background, for: .normal, barMetrics: .default)
        self.setBackgroundImage(background, for: .selected, barMetrics: .default)
        self.setBackgroundImage(background, for: .highlighted, barMetrics: .default)

        let deviderLine = UIImage.getsegrect(color: UIColor.clear.cgColor, andSize: CGSize(width: 2.0, height: 2))
        self.setDividerImage(deviderLine, forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.lightGray], for: .normal)
        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        
        
    }
    
    func highlightSelectedesegment(){
        removeBorder()
        let lineWidth: CGFloat = self.bounds.size.width / CGFloat(self.numberOfSegments)
        let lineHeight:CGFloat = 0.9
        let lineXPosition = CGFloat(selectedSegmentIndex * Int(lineWidth))
        let lineYPosition = self.bounds.size.height - 0.7
        let underLineFrame = CGRect(x: lineXPosition, y: lineYPosition, width: lineWidth, height: lineHeight)
        let underLine = UIView(frame: underLineFrame)
        underLine.backgroundColor = .white
        underLine.tag = 1
        self.addSubview(underLine)
        
        
    }
    func underLinePosition(){
        guard let underLine = self.viewWithTag(1) else {return}
        let xPosition = (self.bounds.width / CGFloat(self.numberOfSegments))*CGFloat(selectedSegmentIndex)
        
        UIView.animate(withDuration: 0.8, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.8, options: .curveEaseInOut,animations: {
            underLine.frame.origin.x = xPosition})
 
    }
    
}
