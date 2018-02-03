//
//  ViewController.swift
//  downloadingSavingImagesFromWeb
//
//  Created by Lakshay Chhabra on 04/02/18.
//  Copyright © 2018 Lakshay Chhabra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    
    
    @IBOutlet weak var selenaImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://pmchollywoodlife.files.wordpress.com/2016/03/selena-gomez-sleek-shiny-hair-paris-fashion-week-ftr.jpg")
        
        let request = NSMutableURLRequest(url: url!)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest){
            data, response, error in
            
            if error != nil {
                print(error!)
                
            }
            else{
                if let data = data {
                    if let selenaImage = UIImage(data: data){
                        
                        self.selenaImageView.image = selenaImage
                        
                        let documentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
                        
                        if documentPath.count > 0 {
                            let documentDir = documentPath[0]
                                let savePath = documentDir + "/selena.jpg"
                                
                                do{
                                    try UIImageJPEGRepresentation(selenaImage, 1)?.write(to: URL(fileURLWithPath: savePath))
                                }
                                catch{
                                    print("Enable to save to path")
                                    }
                            }
                        }
                        
                    }
                }
            }
            
        task.resume()
       
        
        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    
    //to reload without downloading i.e to retrieve localy
//    let documentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
//
//    if documentPath.count > 0 {
//    let documentDir = documentPath[0]
//    let restorePath = documentDir + "/selena.jpg"
//
//    self.selenaImageView.image = UIImage(contentsOfFile: restorePath)
//
//    }
    

}

