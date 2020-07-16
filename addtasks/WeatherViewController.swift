//
//  WeatherViewController.swift
//  addtasks
//
//  Created by dardan bakiu on 7/15/20.
//  Copyright © 2020 dardan bakiu. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var cityEditText: UITextField!
    @IBOutlet weak var celsiusGradeTextView: UITextView!
    
    @IBAction func lookWeatherBtn(_ sender: UIButton) {
        var city = cityEditText.text
        
        celsiusGradeTextView.text = city
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

