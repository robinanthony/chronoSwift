//
//  ViewController.swift
//  chrono
//
//  Created by tp on 31/01/2020.
//  Copyright © 2020 univ-orleans. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myTime: UILabel!
    var chrono : Int = 3616101
    var timer = Timer()
    
    @IBAction func start(_ sender: UIButton) {
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.incrementer), userInfo: nil, repeats: true)
    }
    
    @IBAction func pause(_ sender: UIButton) {
        timer.invalidate()
    }
    
    @IBAction func stop(_ sender: UIButton) {
        pause(sender)
        chrono = 0
        printChrono()
    }
    
    @objc func incrementer(){
        chrono += 1
        printChrono()
    }
    
    func printChrono(){
        let hour : Int = chrono/360000
        let min : Int = (chrono-hour*360000)/6000
        let sec : Int = (chrono-min*6000)/100
        let decisec : Int = chrono-sec*100
        
        myTime.text = "\(hour):\(min):\(sec).\(decisec)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        printChrono()
    }


}

