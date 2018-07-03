//
//  HomeViewController.swift
//  ExampleMoya
//
//  Created by yana mulyana on 09/05/18.
//  Copyright © 2018 Rinjani. All rights reserved.
//

import UIKit
import IconFormattedDate

class HomeViewController: UIViewController {

    var formatDate = IconFormattedDate()
    
    fileprivate let viewModel = ContactViewModel()
    @IBOutlet weak var tableView: UITableView!
    let imageDashboard = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.transparentNavigationBar()
        self.viewModel.viewController = self
        self.viewModel.setupData()
        
        let dateNow = self.formatDate.formattedDateFromString(dateFormat: "dd/MM/yyyy", dateString: "21/07/2016", withFormat: "MMM dd, yyyy")
        print("today is => \(String(describing: dateNow))")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UINavigationBar {
    func transparentNavigationBar() {
        self.setBackgroundImage(UIImage(), for: .default)
        self.shadowImage = UIImage()
        self.isTranslucent = true
    }
}
