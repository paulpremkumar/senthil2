//
//  SingletonClass.swift
//  Hubblesindia
//
//  Created by admin on 09/12/20.
//  Copyright © 2020 senthil kumar. All rights reserved.
//

import UIKit
import Alamofire

class SingletonClass: NSObject {
    var appDelegate = UIApplication.shared.delegate as? AppDelegate
    var delegate: Any?
    func getdict(){
//        Alamofire.request(UrlClass.sharedInstance.LoginUrl!).res{ response in
//            print("\(response)")
//
//        }
        Alamofire.request(UrlClass.sharedInstance.LoginUrl!).responseJSON { (response) in
            print("\(response)")
            let array =  response.value as? NSArray
            print("array=\(String(describing: array))")
            let tempObj = self.delegate as? ViewController
            tempObj?.Responseforlogin(Loginarray: array ?? [])
        }
    }
    func requestforLogin(){
//        GIFHUD.shared.show()
//        (eno:String,e_pass:String,FCM_DeviceID:String,e_imsi:String,Frameview:UIView){
        Alamofire.upload(multipartFormData: { (multipartFormData) in
//            multipartFormData.append(eno.data(using: .utf8)!, withName :"e_code")
//            multipartFormData.append(e_pass.data(using: .utf8)!, withName :"e_pass")
//            multipartFormData.append(FCM_DeviceID.data(using: .utf8)!, withName :"FCM_DeviceID")
//            multipartFormData.append(e_imsi.data(using: .utf8)!, withName :"e_imsi")
            
        }, to:UrlClass.sharedInstance.LoginUrl!)
        { (result) in
            switch result {
            case .success(let upload, _ , _):
                upload.uploadProgress(closure: { (progress) in
                    
                    print("uploding")
                })
                
                upload.responseJSON { response in
                    
                    let login_dict = response.value as? NSDictionary
                    print("login dict=\(String(describing: login_dict))")
//
//                      let tempObj = self.delegate as? ViewController
//                       tempObj?.Responseforlogindict(Logindict: login_dict ?? [:])
                    
                    DispatchQueue.main.async {
                        
//                        GIFHUD.shared.removeFromSuperview()
                    }
                }
                
            case .failure(let encodingError):
                
                print("failed response=")
                print(encodingError)
                
                DispatchQueue.main.async {
                    
//                    GIFHUD.shared.removeFromSuperview()
                }
                
            //  self.ServerErrorAlert()
            
            }
            
        }
    }
}

