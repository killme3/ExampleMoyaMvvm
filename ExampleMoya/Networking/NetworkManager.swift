//
//  NetworkManager.swift
//  ExampleMoya
//
//  Created by izul on 02/05/18.
//  Copyright © 2018 Rinjani. All rights reserved.
//

import Foundation
import Moya
import Alamofire
import JGProgressHUD

enum APIEnvironment {
    case development
    case production
    case jsonPlaceholder
}

struct NetworkManager {
    typealias failureBlock  = (NSError) -> Void
    var provider = MoyaProvider<MyServerAPI>(plugins: [NetworkLoggerPlugin(verbose: true)])
    static let environment: APIEnvironment = .development
    let hud = JGProgressHUD(style: .dark)
    
    func getContacts(controller: UIViewController ,completion: @escaping(ContactResult)->()) {
        self.showHud(controller: controller)
        provider.request(.contacts) { (result) in
            self.hud.dismiss()
            switch result {
            case .success(let response):
                do {
                    let contactResult = try JSONDecoder().decode(ContactResult.self, from: response.data)
                    completion(contactResult)
                } catch let err {
                    print(err)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func createComment(param: Parameters, completion: @escaping(Comment)->()) {
        provider.request(.createComment(parameter: param)) { (result) in
            switch result {
            case .success(let response):
                do {
                    let commentResult = try JSONDecoder().decode(Comment.self, from: response.data)
                    completion(commentResult)
                } catch let err {
                    print(err)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func showHud(controller: UIViewController) {
        hud.textLabel.text = "Loading"
        hud.show(in: controller.view)
    }
    
}

