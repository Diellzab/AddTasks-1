//
//  weatherAPI.swift
//  addtasks
//
//  Created by dardan bakiu on 7/17/20.
//  Copyright © 2020 dardan bakiu. All rights reserved.
//

import Foundation

final class weatherAPI {
    static let shared = weatherAPI()
    
    func fetchWeatherApiList(city:String) {
//        let city = textField.text
        let apiCode = "7fe8e4a145b82d9e952edc25e7ac6401"
        let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(city)&APPID=\(apiCode)&units=metric")!
        let task = URLSession.shared.dataTask(with: url) { (data,resp,error) in
            guard let data = data else {
                print("data was nil")
                return
            }
            
            guard let motiList = try? JSONDecoder().decode(weatherInfoList.self, from: data)
                else {
                    print("couldnt decode json")
                    return
            }
            
            print(motiList.main.temp)
        }
        
        task.resume()
    }
}

struct weatherInfoList : Codable{
    let main : mainTemp
}

struct mainTemp: Codable {
    let temp : Double
    let feels_like :Double
    let temp_min:Double
    let temp_max:Double
    let pressure:Double
    let humidity:Double
}
/*
 "weather":[{"id":803,"main":"Clouds","description":"broken clouds","icon":"04d"}],"base":"stations","main":{"temp":21.14,"feels_like":15.67,"temp_min":18.89,"temp_max":23.33,"pressure":1011,"humidity":56},"visibility":10000,"wind":{"speed":8.7,"deg":10},"clouds":{"all":75},"dt":1595006392,"sys":{"type":1,"id":95,"country":"XK","sunrise":1594955616,"sunset":1595009343},"timezone":7200,"id":784759,"name":"Ferizaj","cod":200}
 */
