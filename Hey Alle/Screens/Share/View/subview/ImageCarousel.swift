//
//  ImageCarousel.swift
//  Hey Alle
//
//  Created by Abhishek kapoor on 10/10/23.
//

import SwiftUI

struct ImageCarousel: View {
    @ObservedObject var viewModel: ShareViewViewModel
    
    var body: some View {
        if let currentImage = viewModel.currentImage {
            VStack(spacing: 0) {
                Image(uiImage: currentImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        Spacer().frame(width: Constants.horizontalSpacing)
                        
                        ForEach(viewModel.fetchedImages, id: \.self) { image in
                            ImageThumbnail(image: image, isSelected: image == currentImage)
                                .onTapGesture {
                                    viewModel.onTap(image)
                                }
                            Spacer().frame(width: Constants.horizontalSpacing)
                        }
                    }
                    .frame(height: Constants.thumbnailHeight)
                }
                .frame(width: UIScreen.main.bounds.width)
            }
        }
    }
    
    private struct Constants {
        static let horizontalSpacing: CGFloat = 40
        static let thumbnailHeight: CGFloat = 76
    }
    
}
