//
//  ViewController.swift
//  VRPlus
//
//  Created by Daniel Burkhardt on 4/15/17.
//  Copyright © 2017 Giganom LLC. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class ViewController: UIViewController {

    let testURL = "https://www.youtube.com/playlist?list=PL762an06h83gOxyhn0rfRnho-tyIolkuP"
    let playListURL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&maxResults=10&key=AIzaSyDLfTi6w5hGf1KFLYpz0Y5FaTCec1ye248&playlistId="
    
    // MARK: - Outlets
    @IBAction func navButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "vrViewController") as! VRViewController
        
        // Set all necessary params
        vc.url = "\(self.playListURL)PL762an06h83jwiiCscMR5MvP5PnTlDxqD"
        
        self.present(vc, animated: true)
    }
    
    
    // MARK: - Default Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

