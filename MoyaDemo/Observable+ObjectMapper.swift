//
//  Observable+ObjectMapper.swift
//  operation4ios
//
//  Created by sungrow on 2017/2/18.
//  Copyright © 2017年 阳光电源股份有限公司. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import ObjectMapper

enum RxSwiftMoyaError : Swift.Error {
    case ParseJSONError
    case NoRepresentor
    case NotSuccessfulHTTP
    case NoData
    case CouldNotMakeObjectError
    case BizError(resultCode: String, resultMsg: String)
}

extension RxSwiftMoyaError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .ParseJSONError:
            return "数据解析失败"
        case .NoRepresentor:
            return "NoRepresentor."
        case .NotSuccessfulHTTP:
            return "NotSuccessfulHTTP."
        case .NoData:
            return "NoData."
        case .CouldNotMakeObjectError:
            return "CouldNotMakeObjectError."
        case .BizError(resultCode: let resultCode, resultMsg: let resultMsg):
            return "错误码: \(resultCode), 错误信息: \(resultMsg)"
        }
    }
}

extension Observable {
    func mapObject<T: Mappable>(type: T.Type) -> Observable<T> {
        return self.map { response in
            //if response is a dictionary, then use ObjectMapper to map the dictionary
            //if not throw an error
            guard let dict = response as? [String: Any] else {
                throw RxSwiftMoyaError.ParseJSONError
            }
            return Mapper<T>().map(JSON: dict)!
        }
    }
    
    func mapArray<T: Mappable>(type: T.Type) -> Observable<[T]> {
        return self.map { response in
            //if response is an array of dictionaries, then use ObjectMapper to map the dictionary
            //if not, throw an error
            guard let array = response as? [[String: Any]] else {
                throw RxSwiftMoyaError.ParseJSONError
            }
            return Mapper<T>().mapArray(JSONArray: array)
        }
    }
}
