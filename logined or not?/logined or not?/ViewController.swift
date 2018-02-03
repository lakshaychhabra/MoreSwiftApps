//
//  ViewController.swift
//  logined or not?
//
//  Created by Lakshay Chhabra on 03/02/18.
//  Copyright © 2018 Lakshay Chhabra. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    var isloogedIn = false
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var loginButton: UIButton!
   
    
    @IBAction func logout(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        let context = appDelegate?.persistentContainer.viewContext
        
          let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        do {
            
            let results = try context?.fetch(request)
            
            for result in results! {
                
                context?.delete(result as! NSManagedObject)
                
                do{
                    try context?.save()
                }
                catch{
                    print("Individual delete fail")
                }
                
            }
//            textField.alpha = 1
            loginButton.setTitle("Log In", for: [])
            label.alpha = 0
            logoutButton.alpha = 0
            isloogedIn = false
            
            
        }
        catch{
            print("Delete Failed")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        let context = appDelegate?.persistentContainer.viewContext
        
        
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        do{
            
            let results = try context?.fetch(request)
            
            for result in (results as? [NSManagedObject])! {
                if let username = result.value(forKey: "username") as? String {
                    textField.alpha = 1
                    loginButton.setTitle("Update Username", for: [])
                    label.alpha = 1
                    label.text  = "Hi There \(username) !"
                    logoutButton.alpha = 1
                    
                }
                
            }
            
        }
        catch{
            print("Enable to Fetch")
        }
        

    
        
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func login(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        let context = appDelegate?.persistentContainer.viewContext
       
        if isloogedIn {
            
             let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
            
            do{
                let results = try context?.fetch(request)
                
                if results!.count > 0 {
                    
                    for result in results as! [NSManagedObject]
                    {
                        result.setValue(textField.text, forKey: "username")
                    
                        do{
                            try context?.save()
                        }
                        catch{
                            print("Update username Failed")
                        }
                    }
                label.text = "Hey there " + textField.text! + "!"
                    
             }
            }
            catch{
                print("Update Failes")
            }
            
        }
        else{
            let newUsers = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context!)
            
            newUsers.setValue(textField.text, forKey: "username")
            
            do{
                try context?.save()
                
                loginButton.setTitle("Update Username", for: [])
                label.alpha = 1
                
                label.text  = "Hi There \(textField.text!) !"
                print("Saved")
                isloogedIn = true
                logoutButton.alpha = 1 
            }
            catch{
                print("error failed to save")
                }
            }
    }
    
}

