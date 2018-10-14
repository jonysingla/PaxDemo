//
//  ViewController.swift
//  PaxDemo
//
//  Created by PanshulK on 06/05/18.
//  Copyright © 2018 Jony Singla. All rights reserved.
//

import UIKit

class ViewController: UIViewController, iCarouselDataSource, iCarouselDelegate {

    @IBOutlet var carouselView: iCarousel!
    
    var imagesArray = [URL]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imagesArray = ImageLoad.loadImagesFromAlbum(folderName: "Photos")
        carouselView.reloadData()
        carouselView.type = .rotary     // Type of image rotation, we can change according to our requirement this.
        
    }
    
    // MARK: - iCarousel Data Source
    func numberOfItems(in carousel: iCarousel) -> Int {
        return imagesArray.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        
        // Create a custom view
        let tempView = UIView(frame: CGRect(x:0, y:0, width: 200, height: 200))

        // Create a UIImage View
        let frameImageView = CGRect(x:0, y:0, width: 200, height: 200)
        let imageView = UIImageView()
        imageView.frame = frameImageView
        imageView.contentMode = .scaleAspectFit
        
        print(imagesArray[index])
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: self.imagesArray[index]) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            DispatchQueue.main.async {
                imageView.image = UIImage(data: data!)
            }
        }
        tempView.addSubview(imageView)
        return tempView
    }
    
    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        if (option == .spacing) {
            return value * 1.2
        }
        return value
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

