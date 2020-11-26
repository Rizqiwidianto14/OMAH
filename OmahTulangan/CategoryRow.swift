//
//  CategoryRow.swift
//  OmahTulangan
//
//  Created by Rizqi Imam Gilang Widianto on 26/05/20.
//  Copyright © 2020 Rizqi Imam Gilang Widianto. All rights reserved.
//

import UIKit


let dekorRumah = [
    Content(contentName: "Dekor1", contentTitle: "Jenis-Jenis Cat Tembok"),
    Content(contentName: "Dekor2", contentTitle: "Cara Mengecat Tembok"),
    Content(contentName: "Dekor3", contentTitle: "Cara Memasang Paku Tembok"),
    Content(contentName: "Dekor4", contentTitle: "Jenis Atap Rumah")
]
let bersihRumah = [
    Content(contentName: "Bersih1", contentTitle: "Jenis-Jenis Vacuum Cleaner"),
    Content(contentName: "Bersih2", contentTitle: "Cara Memilah Sampah"),
    Content(contentName: "Bersih3", contentTitle: "Membersihkan Kerak WC"),
    Content(contentName: "Bersih4", contentTitle: "Membersihkan Kerak Wajan")
]
let cuciRumah = [
    Content(contentName: "Cuci1", contentTitle: "Cara Mencuci Baju Dengan Tangan"),
    Content(contentName: "Cuci2", contentTitle: "Menghindari Baju Apek"),
    Content(contentName: "Cuci3", contentTitle: "Jenis-Jenis Mesin Cuci"),
    Content(contentName: "Cuci4", contentTitle: "Jenis-Jenis Deterjen")
]
let dapurRumah = [
    Content(contentName: "Dapur1", contentTitle: "Menghilangkan Kerak Pada Wajan"),
    Content(contentName: "Dapur2", contentTitle: "Jenis-Jenis Panci"),
    Content(contentName: "Dapur3", contentTitle: "8 Jenis Pisau"),
    Content(contentName: "Dapur4", contentTitle: "Menghilangkan Bau Pada Kulkas")
]
let toiletRumah = [
    Content(contentName: "Toilet1", contentTitle: "Jenis-Jenis Kaca Kamar Mandi"),
    Content(contentName: "Toilet2", contentTitle: "Membersihkan Kerak WC"),
    Content(contentName: "Toilet3", contentTitle: "Membersihkan Toilet yang Tersumbat"),
    Content(contentName: "Toilet4", contentTitle: "Membersihkan Keran Tersumbat")
]
let extraRumah = [
    Content(contentName: "Extra1", contentTitle: "Cara Melipat Baju"),
    Content(contentName: "Extra2", contentTitle: "Cara Mencuci Sepatu"),
    Content(contentName: "Extra3", contentTitle: "Cara Membereskan Kabel"),
    Content(contentName: "Extra4", contentTitle: "Membersihkan Keyboard Komputer")
]

let x = [dekorRumah,bersihRumah,toiletRumah,cuciRumah,dapurRumah,extraRumah]


var contentList = [Content]()
//func getContent(forCategoryTitle title:String) -> [Content] {
//    switch categories.description {
//    case "Dekor Rumah Yuk!":
//        return dekorRumah
//    case "Bersih Pangkal Sehat":
//        return bersihRumah
//    case "Biar Mandi Lebih Byur~":
//        return toiletRumah
//    case "Nyuci, nyuci sendiri~":
//        return cuciRumah
//    case "Penakluk Dapur Di Sayang Mama":
//        return dapurRumah
//    default:
//        return extraRumah
//    }
//}


class CategoryRow: UITableViewCell,UICollectionViewDataSource,UICollectionViewDelegate {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var data: [Content] = []
    
    

//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "contentCell", for: indexPath) as! ContentCell
            cell.layer.cornerRadius = 15
            let image = "\(data[indexPath.row].contentName)"
            print (indexPath)
    //        print("section \(indexPath.section) , \(indexPath.row)")
            cell.contentImage.image = UIImage(named: image)
            cell.contentLabel.text = "\(data[indexPath.row].contentTitle)"
            return cell

        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 4
        }
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
            
        }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        findViewController()?.performSegue(withIdentifier: "contentVC", sender: self)
        let parentVC = findViewController()
        guard let contentVC = parentVC?.storyboard?.instantiateViewController(identifier: "contentVC") as? CARDViewController else {
            return
        }
        
        parentVC?.navigationController?.pushViewController(contentVC, animated: true)
    }
    

    
    

    
    
 
    
    
    
}

extension UIView {
    func findViewController() -> UIViewController? {
        if let nextResponder = self.next as? UIViewController {
            return nextResponder
        } else if let nextResponder = self.next as? UIView {
            return nextResponder.findViewController()
        } else {
            return nil
        }
    }
}



extension CategoryRow : UICollectionViewDelegateFlowLayout {

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let itemsPerRow:CGFloat = 4
        let hardCodedPadding:CGFloat = 5
        let itemWidth = (collectionView.bounds.width / itemsPerRow) - hardCodedPadding
        let itemHeight = collectionView.bounds.height - (2 * hardCodedPadding)
        return CGSize(width: itemWidth, height: itemHeight)
    }

}

