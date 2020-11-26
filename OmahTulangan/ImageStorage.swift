//
//  ImageStorage.swift
//  OmahTulangan
//
//  Created by Rizqi Imam Gilang Widianto on 21/05/20.
//  Copyright © 2020 Rizqi Imam Gilang Widianto. All rights reserved.
//

import Foundation

struct ImageCategory {
    var categoryImageName: String
    var title: String
    var imageNames: [String]
    
}


class imagesLibrary{
    
    class func fetchImages() -> [ImageCategory]{
        var categories = [ImageCategory]()
        let imagesData = imagesLibrary.downloadImages()
        
        for(categoryTitle, dict) in imagesData{
            if let dict = dict as? [String : Any]{
                let categoryImageName = dict["categoryImageName"] as! String
                if let imageNames = dict ["imageNames"] as? [String]{
                    let newCategory = ImageCategory(categoryImageName: categoryImageName, title: categoryTitle, imageNames: imageNames)
                    categories.append(newCategory)
                }
            }
        }
        return categories 
    }
    
    
    
    class func downloadImages() -> [String : Any]{
        return [
            "Dekorasi": [
                "categoryImageName" : "dekorasi", "imageNames" : imagesLibrary.generateImage(categoryPrefix: "de", numberOfImages: 4),
            ],
            "Cuci": [
            "categoryImageName" : "cuci", "imageNames" : imagesLibrary.generateImage(categoryPrefix: "cu", numberOfImages: 4),
            ],
            "Bersih": [
                "categoryImageName" : "bersih", "imageNames" : imagesLibrary.generateImage(categoryPrefix: "be", numberOfImages: 4),
            ],
            "Mandi": [
                "categoryImageName" : "mandi", "imageNames" : imagesLibrary.generateImage(categoryPrefix: "ma", numberOfImages: 4),
            ],
            "Dapur": [
                "categoryImageName" : "dapur", "imageNames" : imagesLibrary.generateImage(categoryPrefix: "dap", numberOfImages: 4),
            ],
            "Extra": [
                "categoryImageName" : "extra", "imageNames" : imagesLibrary.generateImage(categoryPrefix: "ex", numberOfImages: 4),
            ]
        ]
        
    }
    
    private class func generateImage(categoryPrefix: String, numberOfImages:Int) -> [String]
    {
        var imageNames = [String]()
        
        for i in 1...numberOfImages {
            imageNames.append("\(categoryPrefix)\(i)")
        }
        return imageNames
    }
    
    
    
}
