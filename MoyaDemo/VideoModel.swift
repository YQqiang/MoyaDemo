//
//  VideoModel.swift
//  MoyaDemo
//
//  Created by sungrow on 2017/2/23.
//  Copyright © 2017年 sungrow. All rights reserved.
//

import Foundation
import ObjectMapper

class VideoModel: Mappable {
    var videos: [Video]?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        videos <- map["videos"]
    }
}

class Video: Mappable {
    var id: Int?
    var length: Float?
    var name: String?
    var url: String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        length <- map["length"]
        name <- map["name"]
        url <- map["url"]
    }
}

