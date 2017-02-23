//
//  API.swift
//  operation4ios
//
//  Created by sungrow on 2017/2/17.
//  Copyright © 2017年 阳光电源股份有限公司. All rights reserved.
//

import Foundation
import Moya

let API_PRO = "http://120.25.226.186:32812"

let headerFields: [String: String] = ["system": "iOS","sys_ver": String(UIDevice.version())]
let publicParameters: [String: String] = ["language": "_zh_CN"]
