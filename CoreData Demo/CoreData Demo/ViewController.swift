//
//  ViewController.swift
//  CoreData Demo
//
//  Created by Lakshay Chhabra on 03/02/18.
//  Copyright © 2018 Lakshay Chhabra. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        let context = appDelegate?.persistentContainer.viewContext
        
        let newUsers = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context!)
        
        newUsers.setValue("lakshay 1234", forKey: "username")
        newUsers.setValue("123", forKey: "password")
        newUsers.setValue(20, forKey: "age")
        
        do{
            try context?.save()
            print("Saved")
        }
        catch{
            print(error)
        }
        
        //Restore The Data
        
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        request.returnsObjectsAsFaults = false
        
        do{
                let results = try context?.fetch(request)
            if results!.count > 0 {
                for result in results as! [NSManagedObject] {
                    if let username = result.value(forKey: "username") as? String {
                        print(username)
                    }
                }
            }
            else{
                
            }
            
        }
        catch{
            print("couldnot fetch")
        }
        
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

