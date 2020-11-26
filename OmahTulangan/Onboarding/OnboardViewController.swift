//
//  OnboardViewController.swift
//  OmahTulangan
//
//  Created by Nathanael Evan on 27/05/20.
//  Copyright © 2020 Rizqi Imam Gilang Widianto. All rights reserved.
//

import UIKit

class OnboardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func nextDidTap(_ sender: UIButton) {
        
        performSegue(withIdentifier: "toMain", sender: self)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
