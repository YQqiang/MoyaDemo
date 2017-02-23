//
//  Observable+Extension.swift
//  operation4ios
//
//  Created by sungrow on 2017/2/18.
//  Copyright © 2017年 阳光电源股份有限公司. All rights reserved.
//

import Foundation
import RxSwift

extension Observable {
    func showAPIErrorToast() -> Observable<Element> {
        return self.do(onNext: { (event) in
        }, onError: { (error) in
            // TODO: 可以在此处做一些网络错误的时候的提示信息
            print("\(error.localizedDescription)")
        }, onCompleted: {
        }, onSubscribe: {
        }, onDispose: {
        })
    }
}
