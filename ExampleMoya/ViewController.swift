//
//  ViewController.swift
//  ExampleMoya
//
//  Created by izul on 30/04/18.
//  Copyright © 2018 Rinjani. All rights reserved.
//

import UIKit
import SkeletonView

class ViewController: UIViewController {

    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var img: UIImageView! {
        didSet {
            img.layer.cornerRadius = img.frame.width/2
            img.layer.masksToBounds = true
        }
    }
    
    override func viewDidLoad() {
        self.img.showAnimatedGradientSkeleton()
        
        //Example Bridging-Header
        let instanceOfCustomObject: CustomObject = CustomObject()
        instanceOfCustomObject.someProperty = "Hello World"
        print(instanceOfCustomObject.someProperty)
        instanceOfCustomObject.someMethod()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func noTableTapped(_ sender: Any) {
        let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NoTableViewController") as! NoTableViewController
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    
    @IBAction func showList(_ sender: Any) {
        let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    
    @IBAction func exampleSearchTable(_ sender: Any) {
        let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SearchTableViewController") as! SearchTableViewController
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        
        //Example pop up TextField
        // 1.
        var usernameTextField: UITextField?
        var passwordTextField: UITextField?
        
        // 2.
        let alertController = UIAlertController(
            title: "Log in",
            message: "Please enter your credentials",
            preferredStyle: UIAlertControllerStyle.alert)
        
        // 3.
        let loginAction = UIAlertAction(
        title: "Log in", style: UIAlertActionStyle.default) {
            (action) -> Void in
            
            if let username = usernameTextField?.text {
                print(" Username = \(username)")
            } else {
                print("No Username entered")
            }
            
            if let password = passwordTextField?.text {
                print("Password = \(password)")
            } else {
                print("No password entered")
            }
        }
        
        // 4.
        alertController.addTextField {
            (txtUsername) -> Void in
            usernameTextField = txtUsername
            usernameTextField!.placeholder = "<Your username here>"
        }
        
        alertController.addTextField {
            (txtPassword) -> Void in
            passwordTextField = txtPassword
            passwordTextField?.isSecureTextEntry = true
            passwordTextField!.placeholder = "<Your password here>"
        }
        
        // 5.
        alertController.addAction(loginAction)
        self.present(alertController, animated: true, completion: nil)
    }
}



