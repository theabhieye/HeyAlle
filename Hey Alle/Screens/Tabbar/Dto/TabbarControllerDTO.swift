//
//  TabbarControllerDTO.swift
//  Hey Alle
//
//  Created by Abhishek kapoor on 10/10/23.
//

import UIKit

struct TabbarItem {
    let viewController: UIViewController
    let selectedImage: UIImage?
    let unselectedImage: UIImage?
    let title: LocalizedText
    
    enum LocalizedText: String {
        case share = "HeyAlle.Tabbar.share"
        case info = "HeyAlle.Tabbar.info"
        case delete = "HeyAlle.Tabbar.delete"
    }
}
