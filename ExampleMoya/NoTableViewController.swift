//
//  NoTableViewController.swift
//  ExampleMoya
//
//  Created by yana mulyana on 02/07/18.
//  Copyright © 2018 Rinjani. All rights reserved.
//

import UIKit

class NoTableViewController: UIViewController, DelegateNoTableView {
    
    fileprivate let viewModel = NoTableViewModel()
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelEmail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.viewModel.viewController = self
        self.viewModel.delegateData = self
        self.viewModel.setupData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Navigation Delegate ViewModel
    
    func getDataViewModel(user: ContactResult) {
        self.labelName.text = user.contact[0].name
        self.labelEmail.text = user.contact[0].email
    }
    
}
