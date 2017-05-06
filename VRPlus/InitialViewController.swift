//
//  InitialViewController.swift
//  VRPlus
//
//  Created by Daniel Burkhardt on 4/25/17.
//  Copyright © 2017 Giganom LLC. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {

    @IBAction func navButton(_ sender: Any) {
        self.performSegue(withIdentifier: "itemView", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
