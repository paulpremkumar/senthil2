//
//  ViewController.swift
//  Hubblesindia
//
//  Created by senthil kumar on 09/12/20.
//  Copyright © 2020 senthil kumar. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource, UIViewControllerTransitioningDelegate {
   var Serv = SingletonClass()
    @IBOutlet weak var Movielisttableview: UITableView!
    var loginarray = NSArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        Serv.delegate = self
        Serv.getdict()
    }
    func Responseforlogin (Loginarray:NSArray) {
        loginarray = Loginarray
        Movielisttableview.reloadData()
    }
  /// tableview data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return loginarray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath) as? DynamicCell
        let Moviedict = loginarray.object(at: indexPath.row) as? NSDictionary
        let title = Moviedict?.object(forKey: "title") as? String
        let imageURL = "\(String(describing: Moviedict?.object(forKey: "posterurl") as? String ?? ""))"
        Alamofire.request(imageURL).responseImage { response in
            if case .success(let image) = response.result {
                let size = CGSize(width: 300.0, height: 200.0)
                let imageFilter = ScaledToSizeFilter(size: size)
                Cell?.Movieimg.image =  imageFilter.filter(image)
            }
            
        }
        Cell?.Movienamelb.text = title ?? ""
        Cell?.Movienamelb.backgroundColor = UIColor.black
        Cell?.Movienamelb.textColor = UIColor.white
        Cell?.Movienamelb.font = UIFont.boldSystemFont(ofSize: 20.0)
        return Cell!
    }
    // tablevie delegates
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //  Converted to Swift 5.3 by Swiftify v5.3.24606 - https://swiftify.com/
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailsControllerID") as! DetailsController
        vc.transitioningDelegate = self
        navigationController?.pushViewController(vc, animated: true)
    }

}

