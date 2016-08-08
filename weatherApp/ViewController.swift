//
//  ViewController.swift
//  weatherApp
//
//  Created by Admin on 8/7/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var cityTextField: UITextField!
    
    @IBOutlet var resultLabel: UILabel!
    
    
    
    @IBAction func getWeather(_ sender: AnyObject) {
    
    
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        let url = URL(string: "http://www.weather-forecast.com/locations/New-York/forecasts/latest")!
        
        let request = NSMutableURLRequest(url: url)
    
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            
            if error != nil {
                
                print("Test this is an error test message")
            
            } else {
                
                if let unwrappedData = data {
                    
                    let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                
                    print(dataString)
                }
                
                
            }
        
        
        
        
        
        
        }
    
        task.resume()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

