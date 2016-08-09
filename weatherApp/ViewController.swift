//
//  ViewController.swift
//  weatherApp
//
//  Created by Admin on 8/7/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var cityTextField: UITextField!
   
    @IBOutlet var resultLabel: UILabel!

    @IBAction func getWeather(_ sender: AnyObject) {
    
        if let url = URL(string: "http://www.weather-forecast.com/locations/" + cityTextField.text!.replacingOccurrences(of: " ", with: "-") + "/forecasts/latest") {
        
            let request = NSMutableURLRequest(url: url)
        
            let task = URLSession.shared.dataTask(with: request as URLRequest) {
            
                data, response, error in
            
                var message = ""
            
                if error != nil {
                
                    print("There was an error")
            
                } else {
                
                    if let unwrappedData = data {
                    
                        let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                    
                        var stringSeparator = "Weather Forecast Summary:</b><span class=\"read-more-small\"><span class=\"read-more-content\"> <span class=\"phrase\">"
                    
                        if let contentArray = dataString?.components(separatedBy: stringSeparator) {
                        
                            if contentArray.count > 1 {
                            
                                stringSeparator = "</span>"
                            
                                let newContentArray = contentArray[1].components(separatedBy: stringSeparator)
                            
                                if newContentArray.count > 1 {
                                
                                message = newContentArray[0].replacingOccurrences(of: "&deg;", with: "°")
                                
                                print(message)
                            
                            }
                            
                        }
                        
                    }
                    
                }
                
            }
            
            if message == "" {
                
                message = "The weather at that location could not be found. Please try again."
                
            }
            
            DispatchQueue.main.sync(execute: {
                
                self.resultLabel.text = message
                
            })
        }
        
        task.resume()
        
        } else {
            
            resultLabel.text = "Please enter a different city. The weather at that location could not be found."
            
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
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
