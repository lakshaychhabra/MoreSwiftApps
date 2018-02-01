//
//  ViewController.swift
//  music player
//
//  Created by Lakshay Chhabra on 02/02/18.
//  Copyright © 2018 Lakshay Chhabra. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    var player = AVAudioPlayer()
  let audioPath = Bundle.main.path(forResource: "kill", ofType: "mp3")
    
        var timer = Timer()
    
    @objc func updateScrubber(){
        
        scrubberlabel.value = Float(player.currentTime)
        
    }
    @IBAction func play(_ sender: Any) {
        
        player.play()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateScrubber), userInfo: nil, repeats: true)
    }
    @IBOutlet weak var volumelabel: UISlider!
   
    @IBAction func volumeSlider(_ sender: Any) {
        
        player.volume = volumelabel.value
    }
    
    
    @IBOutlet weak var scrubberlabel: UISlider!
    @IBAction func scrubberSlider(_ sender: Any) {
        
        player.currentTime = TimeInterval(scrubberlabel.value)
        
    }
    
    @IBAction func pause(_ sender: Any) {
        player.pause()
        timer.invalidate()
    }
    
    @IBAction func stop(_ sender: Any) {
        player.pause()
        timer.invalidate()
        scrubberlabel.value = 0
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            
            
            
        }
        catch{
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            
            scrubberlabel.maximumValue = Float(player.duration)
            
        }
        catch{
        
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

