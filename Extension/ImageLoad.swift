//
//  ImageLoad.swift
//  PaxDemo
//
//  Created by PanshulK on 06/05/18.
//  Copyright © 2018 Jony Singla. All rights reserved.
//

import UIKit
import Foundation

class ImageLoad: NSObject {

    class func loadImagesFromAlbum(folderName:String) -> [URL]{
        
        var arrayImages = [URL]()
        if let path = Bundle.main.resourcePath {
            
            let imagePath = path + "/Photos"
            let imageURL = NSURL(fileURLWithPath: imagePath)
            let fileManager = FileManager.default
            let properties = [URLResourceKey.localizedNameKey,
                              URLResourceKey.creationDateKey, URLResourceKey.localizedTypeDescriptionKey]
            
            do {
                print(imageURL)
                arrayImages = try fileManager.contentsOfDirectory(at: imageURL as URL, includingPropertiesForKeys: properties, options:FileManager.DirectoryEnumerationOptions.skipsHiddenFiles)
                return arrayImages
            } catch let error as NSError {
                print(error.localizedDescription)
                return arrayImages
            }
        }
        return arrayImages
    }

}
