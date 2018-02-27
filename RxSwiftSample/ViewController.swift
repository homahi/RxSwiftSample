//
//  ViewController.swift
//  RxSwiftSample
//
//  Created by 原野誉大 on 2018/02/26.
//  Copyright © 2018年 原野誉大. All rights reserved.
//

import UIKit
import Moya
import RxSwift

class ViewController: UIViewController {
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let provider = MoyaProvider<WeatherAPI>()
        provider.rx.request(.getWeather(q: "London", APIKEY: ""))
            .subscribe { event in
                switch event {
                case let .success(response):
                    let jsonString = try? response.mapString()
                    print(jsonString!)
                case let .error(error):
                    print(error)
                default:
                    break
                }
                
        }.disposed(by: disposeBag)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

