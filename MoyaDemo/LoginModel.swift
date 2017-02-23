//
//  LoginModel.swift
//  MoyaDemo
//
//  Created by sungrow on 2017/2/23.
//  Copyright © 2017年 sungrow. All rights reserved.
//

import Foundation
import ObjectMapper

class LoginModel: Mappable {
    var error: String?
    var success: String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        error <- map["error"]
        success <- map["success"]
    }
}
