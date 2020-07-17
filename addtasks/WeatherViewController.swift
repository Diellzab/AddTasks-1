//
//  WeatherViewController.swift
//  addtasks
//
//  Created by dardan bakiu on 7/15/20.
//  Copyright © 2020 dardan bakiu. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
//
//    @IBOutlet weak var cityEditText: UITextField!
//    @IBOutlet weak var celsiusGradeTextView: UITextView!
    
// qeto dy posht duhet mi shti mrena butonit
//
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func searchButton(_ sender: Any) {
        let cityy = textField.text
        weatherAPI.shared.fetchWeatherApiList(city:cityy!)
    
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    


}





