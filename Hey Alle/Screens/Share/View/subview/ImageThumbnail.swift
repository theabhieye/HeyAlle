//
//  ImageThumbnail.swift
//  Hey Alle
//
//  Created by Abhishek kapoor on 10/10/23.
//

import SwiftUI

struct ImageThumbnail: View {
    var image: UIImage
    var isSelected: Bool
    
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(
                width: isSelected ? Constants.selectedThumbnailWidth : Constants.thumbnailWidth,
                height: isSelected ? Constants.selectedThumbnailHeight : Constants.thumbnailHeight
            )
            .padding(.all, isSelected ? Constants.thumbnailPadding : 0)
    }

    private struct Constants {
        static let thumbnailWidth: CGFloat = 36
        static let thumbnailHeight: CGFloat = 76
        static let selectedThumbnailWidth: CGFloat = 40
        static let selectedThumbnailHeight: CGFloat = 80
        static let thumbnailPadding: CGFloat = 6
    }
    
}
