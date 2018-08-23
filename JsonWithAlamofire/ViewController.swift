//
//  ViewController.swift
//  JsonWithAlamofire
//
//  Created by Anand on 21/08/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import UIKit
import Alamofire


class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let url = "https://jsonplaceholder.typicode.com/posts"
    
    var dataModel = [DataModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getMethod()
        tableView.estimatedRowHeight = 208.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    func getMethod() {
        Alamofire.request(url)
        .responseJSON { response in
            
            switch response.result {
            case .success:
                print(response.result.value as? [[String:Any]] ?? [])
                self.getResponse(response: (response.result.value as? [[String:Any]])!)
            case .failure:
                print("error")
            }
        }
    }
    
    func getResponse(response: [[String: Any]]) {
        DispatchQueue.main.async {
            for dic in response {
                self.dataModel.append(DataModel(dic))
            }
            self.tableView.reloadData()
        }
        
        
        
    }

}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CustomCell
        
        let dataObject = dataModel[indexPath.row]
        
        cell?.userIdLabel.text = dataObject.userId
        cell?.idLabel.text = dataObject.id
        cell?.titleLabel.text = dataObject.title
        cell?.bodyLabel.text = dataObject.body
        
        return cell!
    }
    
    
}




























