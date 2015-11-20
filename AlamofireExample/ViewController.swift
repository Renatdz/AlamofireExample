//
//  ViewController.swift
//  AlamofireExample
//
//  Created by Renato Mendes on 31/10/15.
//  Copyright © 2015 Renato Mendes. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    let baseUrl = "http://yourbaseUrl"
    
    let headers = [
        "" : ""
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let paramsPost = [
            "" : ""
        ]
        
        let paramsPut = [
            "" : ""
        ]
        
        self.get("user/")
        self.post("user", params: paramsPost)
        self.put("user", params: paramsPut)
        self.delete("user", id: "27")
        
    }

    // HTTP METHOD GET
    func get(params: String) {
        Alamofire.request(.GET, "\(baseUrl)\(params)", headers: headers)
            .responseJSON { response in
                print("Status Operation: \(response.response!.statusCode)")
                print("Response JSON: \(response.result.value!)")
        }
    }
    
    // HTTP METHOD POST
    func post(section: String, params: [String : AnyObject]?) {
        Alamofire.request(.POST, "\(baseUrl)\(section)", parameters: params, encoding: .JSON, headers: headers)
            .responseJSON { response in
                print(response.debugDescription)
        }
    }
    
    // HTTP METHOD PUT
    func put(section: String, params: [String : AnyObject]?) {
        Alamofire.request(.PUT, "\(baseUrl)\(section)", parameters: params, encoding: .JSON, headers: headers)
            .responseJSON { response in
                print("Status Operation: \(response.response!.statusCode)")
        }
    }
    
    // HTTP METHOD DELETE
    func delete(section: String, id : String) {
        Alamofire.request(.DELETE, "\(baseUrl)\(section)/\(id)", headers: headers)
            .responseJSON { response in
                print("Status Operation: \(response.response!.statusCode)")
        }
    }
    
}

