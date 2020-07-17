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
    var weatherMainTemp : mainTemp!
    let tableView = UITableView()
    var moti: Double!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func searchButton(_ sender: Any) {
        let cityy = textField.text
       
      
        let anonymousFunction = { (fetchedWeatherInfo: mainTemp) in
            self.weatherMainTemp = fetchedWeatherInfo
            self.moti = fetchedWeatherInfo.temp
            self.tableView.reloadData()
            
            print(fetchedWeatherInfo.temp)
           
         
        }
        
        weatherAPI.shared.fetchWeatherApiList(city:cityy! , onCompletion: anonymousFunction)
        do {
            sleep(4)
        }
        var motiString = "\(moti)"
        var newMotiString = motiString.replacingOccurrences(of: "Optional(", with: "") //
        newMotiString = newMotiString.replacingOccurrences(of: ")", with: "")
//        textView.text = newMotiString
        
        var motiDbl = Double(newMotiString)
        let motiNumber = Double(round(100*motiDbl!)/100)
        textView.text = "\(motiNumber) °C"
        
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    


}





