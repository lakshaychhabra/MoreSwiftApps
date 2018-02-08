//
//  DetailViewController.swift
//  Blog Reader
//
//  Created by Lakshay Chhabra on 04/02/18.
//  Copyright © 2018 Lakshay Chhabra. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet var webView: WKWebView!
    
    
    func configureView() {
        
       
        
        
        // Update the user interface for the detail item.
        if let detail = detailItem {
             self.title = detail.value(forKey: "title") as? String
            if let blogwebView = self.webView {
                
                blogwebView.loadHTMLString((detail.value(forKey: "content") as? String)!, baseURL: nil)
                
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: Event? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

