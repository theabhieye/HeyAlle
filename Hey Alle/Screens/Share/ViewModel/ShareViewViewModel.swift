//
//  ShareViewViewModel.swift
//  Hey Alle
//
//  Created by Abhishek kapoor on 10/10/23.
//

import SwiftUI

final class ShareViewViewModel: ObservableObject {
    
    @Published var fetchedImages: [UIImage] = []
    @Published var currentImage: UIImage?
    @Published var isLoading: Bool = true
    
    private let service: ImageService
    
    init(service: ImageService = ImageServiceImpl()) {
        self.service = service
    }
    
    func fetchImage() {
        isLoading  = true
        Task {
            await fetchUserImages()
        }
        isLoading = false
    }
    
    func onTap(_ image: UIImage) {
        self.currentImage = image
    }
    
    private func fetchUserImages() async {
        if let images = await service.getAllImages() {
            DispatchQueue.main.async { [self] in
                self.fetchedImages = images

                if !self.fetchedImages.isEmpty {
                    currentImage = self.fetchedImages.first
                }
            }
        }
    }
}
