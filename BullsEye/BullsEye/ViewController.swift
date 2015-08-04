//
//  ViewController.swift
//  BullsEye
//
//  Created by Alex Beltyukov on 7/26/15.
//  Copyright (c) 2015 Alex Beltyukov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentValue = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAlert() {
        let message = "The value of the slider is: \(currentValue)"
        
        let alert = UIAlertController(title: "Hello, World!", message: message, preferredStyle: .Alert)
        
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(sender: UISlider) {
        currentValue = lroundf(sender.value)
    }
}
