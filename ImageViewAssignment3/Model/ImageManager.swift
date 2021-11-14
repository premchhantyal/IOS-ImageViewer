//
//  ImageManager.swift
//  ImageViewAssignment3
//
//  Created by user193216 on 11/11/21.
//

import Foundation

class ImageManager {
    private var imageList = [Image]()
    
    func getAllImages()-> [Image] {
        return imageList
    }
    
    func addImage(img: Image) {
        imageList.append(img)
    }
    
}
