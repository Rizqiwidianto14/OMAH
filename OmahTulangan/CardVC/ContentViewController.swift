//
//  ContentViewController.swift
//  OmahTulangan
//
//  Created by Rizqi Imam Gilang Widianto on 27/05/20.
//  Copyright © 2020 Rizqi Imam Gilang Widianto. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {
    
    let images: [String] = []
    
    let texts: [String] = []
    
    var index = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController!.navigationBar.isTranslucent = true
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.view.backgroundColor = UIColor.clear
        
    }
    
    func s() {
        
        
    }
    
    @objc func handleSwipe(sender: UISwipeGestureRecognizer){
        if sender.state == .ended{
            switch sender.direction {
            case .right:
                if index - 1 != -1 {
                    index -= 1
                    cardCaller()
                    let generator = UISelectionFeedbackGenerator()
                    generator.selectionChanged()

                }
                
            case .left:
                if index + 1 < texts.count {
                    index += 1
                    cardCaller()
                    let generator = UISelectionFeedbackGenerator()
                    generator.selectionChanged()

                }
            default:
                break
            }
        }
        
        
    }
    
    func setUp() {
      
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        leftSwipe.direction = .left
        
        
        view.addGestureRecognizer(rightSwipe)
        view.addGestureRecognizer(leftSwipe)

        
    }
    
    func cardCaller() {
        
        
        
    }


}
