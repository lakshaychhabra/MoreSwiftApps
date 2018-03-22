//
//  ViewController.swift
//  instagram
//
//  Created by Lakshay Chhabra on 08/03/18.
//  Copyright © 2018 Lakshay Chhabra. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let comment = PFObject(className: "comment")
//        comment["Text"] = "Nice SHot!!"
//
//        comment.saveInBackground { (success, error) in
//
//            if(success){
//                print("Succesul saved")
//
//            }else{
//                print("Failed")
//            }
//        }
        
//        let query = PFQuery(className: "comment")
//
//        query.getObjectInBackground(withId: "VzFuboVleI") { (object, error) in
//
//            if let comment = object {
//
//                comment["Text"] = "Fuck DAMMMMMMM Yeeah!!"
//                comment.saveInBackground(block: { (success, error) in
//                    if(success) {
//                        print("updated")
//                    }
//                    else{
//                        print("Not updted")
//                    }
//                })
//
//                print(comment)
//            }
//        }

        //Creating and Retrieving a Tweet
        
        let tweet = PFObject(className: "Tweet")

        tweet["Text"] = "Hey The Mother Fucka"
        tweet.saveInBackground { (success, error) in
            if(success){
                print("successfully added")
            }
            else{
                print("Error Saving")
            }
        }
        
        let find = PFQuery(className: "Tweet")
        
        find.getObjectInBackground(withId: "PcQwm0T5JH") { (object, error) in
            if let found = object {
                print(found["Text"])
            }
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

