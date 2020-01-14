//
//  ViewController.swift
//  expandingImage
//
//  Created by MacStudent on 2020-01-13.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    
    @IBAction func speedSlider(_ sender: UISlider) {
        switch sender.value{
        case 0:
            speed = 1.2
            print (speed)
            break
        case 1:
            speed = 1.0
            print(speed)
            break
        case 2:
            speed = 0.8
            print(speed)
            break
        case 3:
            speed = 0.6
            print(speed)
                break
        case 4:
            speed = 0.4
            print(speed)
            
        default:
            speed = 0.1
            print (speed)
        }
    }
    
    
    @IBOutlet var myView: UIView!
    
    @IBOutlet weak var lblCounter: UILabel!
    
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    var timer: Timer!
    var counter = 0
    var speed = 0.1
  override func viewDidLoad() {
    super.viewDidLoad()
    let mainViewHeight = view.frame.size.height
    let mainViewWidth = view.frame.size.width
    var myViewHeight = self.myView.frame.size.height
    var myViewWidth = self.myView.frame.size.width
    myView.center = view.center
    myView.backgroundColor = .red
    lblCounter.text = "\(counter)"
    var timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true)
    { timer in
          self.myView.backgroundColor = .random()
    }
    expand()
    }
 
   
  func expand(){
    var timer = Timer.scheduledTimer(withTimeInterval: speed, repeats: true)
    { timer in
         // self.myView.backgroundColor = .random()
              
    self.myView.frame.origin.x -= 5
    self.myView.frame.origin.y -= 5
    self.myView.frame.size.height += 10
    self.myView.frame.size.width += 10
    if(self.myView.frame.size.width == 390)
    {
      timer.invalidate()
      self.shrink()
    }
    }
    
  }
  func shrink(){
//    self.counter += 1
//    self.lblCounter.text = "\(self.counter)"
   var timer = Timer.scheduledTimer(withTimeInterval: speed, repeats: true)
   { timer in
     //self.myView.backgroundColor = .random()
         
    self.myView.frame.origin.x += 5
    self.myView.frame.origin.y += 5
    self.myView.frame.size.height -= 10
    self.myView.frame.size.width -= 10
    if(self.myView.frame.size.width == 50)
    {
       timer.invalidate()
       
      self.expand()
      self.counter += 1
      self.lblCounter.text = "\(self.counter)"
    }
  }
  }
}
extension UIColor {
  static func random() -> UIColor {
    func random() -> CGFloat { return .random(in:0...1) }
    return UIColor(red:  random(),
            green: random(),
            blue: random(),
            alpha: 1.0)
  }
}
