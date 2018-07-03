//
//  ContactViewModel.swift
//  ExampleMoya
//
//  Created by izul on 02/05/18.
//  Copyright © 2018 Rinjani. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import JGProgressHUD
import CoreData

class ContactViewModel: NSObject {
    let networkManager = NetworkManager()
    var viewController: HomeViewController!
    var contactResult: ContactResult!
    
    override init() { //optional
        super.init()
    }
    
    func setupData() {
        //Strechy Header
        self.viewController.tableView.contentInset = UIEdgeInsetsMake(250, 0, 0, 0)
        self.viewController.imageDashboard.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 300)
        self.viewController.imageDashboard.image = UIImage.init(named: "poster.jpg")
        self.viewController.imageDashboard.contentMode = .scaleAspectFill
        self.viewController.imageDashboard.clipsToBounds = true
        self.viewController.view.addSubview(self.viewController.imageDashboard)
        
        self.viewController.imageDashboard.contentMode = .scaleAspectFill
        self.viewController.imageDashboard.clipsToBounds = true
        self.viewController.tableView.separatorColor = UIColor.clear
        
        self.networkManager.getContacts(controller: self.viewController) { (response) in
            self.contactResult = response
            self.viewController.tableView.delegate = self
            self.viewController.tableView.dataSource = self
            self.viewController.tableView.reloadData()
            self.viewController.tableView.separatorColor = UIColor.lightGray            
        }
        
        //        let params: Parameters = [
        //            "title": "ini judul",
        //            "body": "ini body",
        //            "userId": "101"
        //        ]
        //
        //        self.networkManager.createComment(param: params) { (response) in
        //            print("-----------")
        //            print(response.id)
        //            print(response.title)
        //            print(response.body)
        //            print(response.userId)
        //        }
        
        // Core data
        //            self.saveUser()
        //            self.deleteCoreData()
        //            self.fetchCoreData()
        //            self.updateCoreData()
        
    }
    
    
    //Example Core Data
    //MARK: CORE DATA
    
    func saveUser() {
        let context = self.getContext()
        let entity = NSEntityDescription.entity(forEntityName: "Users", in: context)
        
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
        newUser.setValue("28", forKey: "age")
        newUser.setValue("yana", forKey: "username")
        newUser.setValue("qwerty", forKey: "password")
        
        do {
            try context.save()
        } catch  {
            print("Failed saving")
        }
    }
    
    func fetchCoreData() {
        let fetchRequest = self.getRequest(entityName: "Users")
        do {
            let context = self.getContext()
            let result = try context.fetch(fetchRequest)
            for data in result as! [NSManagedObject] {
                print("datanya => \(data.value(forKey: "username") as! String)")
            }
        } catch  {
            print("Failed")
        }
    }
    
    func updateCoreData() {
        let context = self.getContext()
        let fetchRequest = self.getRequest(entityName: "Users")
        fetchRequest.predicate = NSPredicate(format: "username = %@", "yana")
        let result = try? context.fetch(fetchRequest)
        let resultData = result as! [Users]
        for object in resultData {
            if object.username == "yana" {
                object.setValue("yana mulyana", forKey: "username")
            }
        }
        do {
            try context.save()
            print("update saved!")
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    func deleteCoreData() {
        let moc = getContext()
        let fetchRequest = self.getRequest(entityName: "Users")
        
        let result = try? moc.fetch(fetchRequest)
        let resultData = result as! [Users]
        
        for object in resultData {
            if object.username == "yana mulyana" {
                moc.delete(object)
            }
        }
        
        do {
            try moc.save()
            print("delete saved!")
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        } catch {
            
        }
    }
    
    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    func getRequest(entityName: String) -> NSFetchRequest<NSFetchRequestResult> {
        return NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
    }
    
}

extension ContactViewModel: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contactResult.contact.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ContactTableViewCell {
            cell.item = self.contactResult.contact[indexPath.row]
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = 300 - (scrollView.contentOffset.y + 300)
        let height = min(max(y + 50, 60), 400)
        self.viewController.imageDashboard.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: height)
    }
}



