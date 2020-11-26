//
//  CARDViewController.swift
//  OmahTulangan
//
//  Created by Nathanael Evan on 27/05/20.
//  Copyright © 2020 Rizqi Imam Gilang Widianto. All rights reserved.
//

import UIKit

class CARDViewController: UIViewController {
    
    let images = [
        "img01",
        "img02",
        "img03",
        "img04",
        "img05",
        "img06",
        "img07",
        "img08"
    ]
    
    let texts: [String] = [
        "Bread Knife merupakan sebuah pisau yang biasa digunakan khusus untuk memotong roti. CIri khas dari pisau ini dapat dibedakan dengan bagian bawah pisau yang bergerigi",
        "Pisau ini memiliki panjang sekitar 20-30 cm. Pisau ini juga dikenal sebagai pisau serbaguna karena dapat digunakan untuk memotong buah, sayur, hingga daging.",
        "Bentuk Paring Knife menyerupai Chef Knife, namun ukurannya lebih kecil, yaitu sekitar 10-17cm. Fungsi dari Paring Knife ini adalah mengupas kulit buah atau membuat hiasan yang berasal dari buah dan sayuran.",
        "Cleaver atau yang dikenal sebagai pisau daging merupakan sebuah pisau yang biasanya digunakan untuk memotong daging hingga memotong tulang-tulang hewan.",
        "Meski mirip dengan Carving Knife, Paring KNife memiliki berat yang lebih ringan dan memiliki ujung yang melengkung serta lebih tipis. Fungsi dari pisau ini adalah untuk mengukir buah dan sayuran.",
        "Boning knife meupakan pisau yang digunakan untuk memisahkan daging dari tulang. Ciri khas pisau ini adalah bagian ujung yang runcing dan melengkung yang ditujukan untuk mempermudah memisahkan daging dari tulangnya",
        "Mincing knife merupakan pisau yang digunakan untuk mencacah halu sayur dan daging. Kedua gagang pisau digunakan untuk kedua belah tangan, sehingga memudahkan pengguna untuk mencacah hingga bahan makanan halus.",
        "Cheese Knife digunakan untuk memotong keju. Lubang-lubang pada pisau berfungsi agar potongan keju tidak lengket di badan pisau"
    ]
    
    let titles = [
        "Bread Knife",
        "Chef Knife",
        "Pairing Knife",
        "Cleaver",
        "Carving Knife",
        "Boning Knife",
        "Mincing Knife",
        "Cheese Knife"
    ]
    
    var index = 0
    
    
    @IBOutlet weak var pageLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var textLbl: UILabel!
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var cardBG: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
        
    }
    
   func setUp() {
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        leftSwipe.direction = .left
        
        view.addGestureRecognizer(rightSwipe)
        view.addGestureRecognizer(leftSwipe)
    
    pageLbl.text = "\(index+1) / \(texts.count)"
    titleLbl.text = titles[index]
    textLbl.text = texts[index]
    
    img.image = UIImage(named: images[index])
    
    }
    
    @objc func handleSwipe(sender: UISwipeGestureRecognizer){
        if sender.state == .ended{
            switch sender.direction {
                
            case .right:
                if index - 1 != -1 {
                    index -= 1
                    let generator = UIImpactFeedbackGenerator(style: .medium)
                    generator.impactOccurred()

                    setCard()
                    
                }
                
            case .left:
                if index + 1 < texts.count {
                    index += 1
                    let generator = UIImpactFeedbackGenerator(style: .medium)
                    generator.impactOccurred()

                    setCard()
                    
                }
            default:
                break
            }
        }
    }
    
    func setCard() {
        
        if index == texts.endIndex-1{
            cardBG.image = UIImage(named: "K1")
        }
        else if index == texts.endIndex-2{
            cardBG.image = UIImage(named: "K2")
        }
        else {
            cardBG.image = UIImage(named: "K3")
        }
        
        pageLbl.text = "\(index+1) / \(texts.count)"
        titleLbl.text = titles[index]
        textLbl.text = texts[index]

        img.image = UIImage(named: images[index])
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
