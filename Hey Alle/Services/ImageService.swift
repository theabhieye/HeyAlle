//
//  ImageService.swift
//  Hey Alle
//
//  Created by Abhishek kapoor on 10/10/23.
//

import Photos
import UIKit

protocol ImageService {
    func getAllImages(completion: @escaping ([UIImage]?) -> Void)
    func getAllImages() async -> [UIImage]?
}

final class ImageServiceImpl: ImageService {
    
    func getAllImages() async -> [UIImage]? {
        var images: [UIImage] = []
        
        let status = await PHPhotoLibrary.requestAuthorization(for: PHAccessLevel.readWrite)
        
        if status == .authorized {
            let fetchOptions = PHFetchOptions()
            let fetchResult = PHAsset.fetchAssets(with: .image, options: fetchOptions)
            
            let height = await UIScreen.main.bounds.height * 0.75
            let width = await UIScreen.main.bounds.width - 32
            
            let size = CGSize(width: width, height: height)
            
            for index in 0..<fetchResult.count {
                let asset = fetchResult.object(at: index)
                let requestOptions = PHImageRequestOptions()
                requestOptions.isSynchronous = true
                
                PHImageManager.default().requestImage(for: asset,
                                                      targetSize: size,
                                                      contentMode: .default,
                                                      options: requestOptions) { image, metaData in
                    if let image = image {
                        images.append(image)
                    }
                    if let metaData = metaData {
                        Log.d(metaData)
                    }
                }
            }
            
            return images
        } else {
            return nil
        }
    }
    
    func getAllImages(completion: @escaping ([UIImage]?) -> Void) {
        var images: [UIImage] = []
        
        PHPhotoLibrary.requestAuthorization { (status) in
            if status == .authorized {
                let fetchOptions = PHFetchOptions()
                
                let fetchResult = PHAsset.fetchAssets(with: .image, options: fetchOptions)
                
                let height = UIScreen.main.bounds.height * 0.75
                let width = UIScreen.main.bounds.width - 32
                
                let size = CGSize(width: width,
                                  height: height)
                
                
                for index in 0..<fetchResult.count {
                    let asset = fetchResult.object(at: index)
                    let requestOptions = PHImageRequestOptions()
                    requestOptions.isSynchronous = true
                    PHImageManager.default().requestImage(for: asset,
                                                          targetSize: size,
                                                          contentMode: .default,
                                                          options: requestOptions) { (image, metaData) in
                        if let image = image {
                            images.append(image)
                        }
                    }
                }
                DispatchQueue.main.async {
                    completion(images)
                }
            } else {
                completion(nil)
            }
        }
    }
}
