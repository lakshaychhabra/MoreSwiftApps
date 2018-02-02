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

    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var loginButton: UIButton!
   
    
    
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
                    textField.alpha = 0
                    loginButton.alpha = 0
                    label.alpha = 1
                    label.text  = "Hi There \(username) !"
                    
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
        
        let newUsers = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context!)
        
        newUsers.setValue(textField.text, forKey: "username")
        
        do{
            try context?.save()
            textField.alpha = 0
            loginButton.alpha = 0
            label.alpha = 1
            label.text  = "Hi There \(textField.text!) !"
            print("Saved")
        }
        catch{
            print(error)
        }
    }
    
}

