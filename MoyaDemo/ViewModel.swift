//
//  ViewModel.swift
//  MoyaDemo
//
//  Created by sungrow on 2017/2/23.
//  Copyright © 2017年 sungrow. All rights reserved.
//

import Foundation
import RxSwift

class ViewModel {
    
    func login(username: String, pwd: String) -> Observable<LoginModel> {
        return appServiceProvider.request(.login(username: username, pwd: pwd))
            .filterSuccessfulStatusCodes()
            .mapJSON()
            .showAPIErrorToast()
            .mapObject(type: LoginModel.self)
    }
    
    func video() -> Observable<VideoModel> {
        return appServiceProvider.request(.video)
            .filterSuccessfulStatusCodes()
            .mapJSON()
            .showAPIErrorToast()
            .mapObject(type: VideoModel.self)
    }
}
