//
//  ViewController.swift
//  MoyaDemo
//
//  Created by sungrow on 2017/2/23.
//  Copyright © 2017年 sungrow. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewModel = ViewModel()
        viewModel.login(username: "520it", pwd: "520it").subscribe(onNext: { (loginModel) in
            print("---\(loginModel.success)")
        }).addDisposableTo(disposeBag)
        
        viewModel.video().subscribe(onNext: { (videoModel) in
            guard let videos = videoModel.videos else {
                return
            }
            for video in videos {
                print("----id:\(video.id)---length:\(video.length)---name:\(video.name)---url:\(video.url)")
            }
        }).addDisposableTo(disposeBag)
    }
}

