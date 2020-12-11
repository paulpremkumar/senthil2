//
//  UrlClass.swift
//  Hubblesindia
//
//  Created by admin on 09/12/20.
//  Copyright © 2020 senthil kumar. All rights reserved.


import UIKit

class UrlClass: NSObject {
    //ARRAY DECLARATION
//    var Leavestatusarray = NSArray()
//    var Holiday_Listarray = NSArray()
//    var HRPolicyarray = NSArray()
//    var Leavetypearray = NSArray()
//    var Attendanceteamemberlistarray = NSArray()
    // MARK: Local Variable
    var LoginUrl:String?
    
    
    private override init() { }
    // MARK:
    static let sharedInstance: UrlClass = {

        let Url = ""
        
        let instance = UrlClass()
        //login Url
        instance.LoginUrl = "https://raw.githubusercontent.com/FEND16/movie-json-data/master/json/top-rated-indian-movies-01.json"
        return instance
    }()
}
