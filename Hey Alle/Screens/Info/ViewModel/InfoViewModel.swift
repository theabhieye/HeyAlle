//
//  InfoViewModel.swift
//  Hey Alle
//
//  Created by Abhishek kapoor on 10/10/23.
//

import SwiftUI

final class InfoViewModel: ObservableObject {
    @Published var isLoading: Bool = true
    @Published var image: UIImage?
    @Published var chipOptions: [String] = ["Option 1", "Option 2", "Option 3"]

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
    
    private func fetchUserImages() async {
        if let images = await service.getAllImages() {
            DispatchQueue.main.async { [self] in
                if !images.isEmpty {
                    image = images.first
                } else {
                    image = UIImage(systemName: "photo")
                }
            }
        }
    }

}
