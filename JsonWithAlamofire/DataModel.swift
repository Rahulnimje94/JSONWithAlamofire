//
//  DataModel.swift
//  JsonWithAlamofire
//
//  Created by Anand on 21/08/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import Foundation

struct DataModel {
    var userId: String
    var id: String
    var title: String
    var body: String
    
    init(_ dic: [String: Any]) {
        self.userId = String(dic["userId"] as? Int ?? 0)
        self.id = String(dic["id"] as? Int ?? 0)
        self.title = dic["title"] as? String ?? ""
        self.body = dic["body"] as? String ?? ""
    }
}
