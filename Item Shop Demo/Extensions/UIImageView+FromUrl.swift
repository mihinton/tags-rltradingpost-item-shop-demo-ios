//
//  UIImageView+FromUrl.swift
//  RL Trading Post
//
//  Created by Michael Hinton on 3/1/21.
//  Copyright © 2021 HinTech, LLC. All rights reserved.
//

import UIKit

extension UIImageView {

    func imageFromUrl(_ urlString: String, placeHolder: UIImage? = nil) {
        if let unwraped = placeHolder {
            self.image = unwraped
        } else {
            self.image = nil
        }
        
        guard let imageName = URL(string: urlString)?.lastPathComponent else {
            self.image = nil
            return
        }
        
        let cachedLocation = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(imageName)
        if FileManager().fileExists(atPath: cachedLocation.path) {
            let image = UIImage(contentsOfFile: cachedLocation.path)
            DispatchQueue.main.async(execute: {
                self.image = image
            })
            return
        }
        
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url, completionHandler: { data, _, error in
                if let error = error {
                    print("ERROR LOADING IMAGES FROM URL: \(error.localizedDescription)")
                    DispatchQueue.main.async {
                        self.image = placeHolder
                    }
                    return
                }
                
                if let data = data, let downloadedImage = UIImage(data: data) {
                    let destination = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(imageName)
                    do {
                        try data.write(to: destination)
                    } catch {
                        print("error saving file:", error)
                    }
                    DispatchQueue.main.async {
                        self.image = downloadedImage
                    }
                }
            }).resume()
        }
    }

}
