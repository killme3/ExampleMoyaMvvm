//
//  NoTableViewModel.swift
//  ExampleMoya
//
//  Created by yana mulyana on 02/07/18.
//  Copyright © 2018 Rinjani. All rights reserved.
//

import Foundation

protocol DelegateNoTableView {
    func getDataViewModel(user: ContactResult) -> Void
}

class NoTableViewModel: NSObject {
    
    let networkManager = NetworkManager()
    var viewController: NoTableViewController!
    var delegateData: DelegateNoTableView?
    
    override init() {
        super.init()
    }
    
    func setupData() {
        self.networkManager.getContacts(controller: self.viewController) { (response) in
            self.delegateData?.getDataViewModel(user: response)
        }
    }
    
}
