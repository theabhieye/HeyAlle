//
//  ShareView.swift
//  Hey Alle
//
//  Created by Abhishek kapoor on 10/10/23.
//
import SwiftUI

struct ShareView: View {
    @StateObject var viewModel: ShareViewViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            NavigationBar(title: String.formattedCurrentDate())
                .padding([.bottom, .leading], 20)
            content
        }
        .onAppear {
            viewModel.fetchImage()
        }
    }
    
    @ViewBuilder
    private var content: some View {
        VStack(spacing: 0) {
            if !viewModel.fetchedImages.isEmpty {
                ImageCarousel(viewModel: viewModel)
            } else if !viewModel.isLoading {
                Spacer()
                Text(LocalizedText.noImageFound.rawValue)
            } else {
                Spacer()
                ProgressView()
            }
            Spacer()
        }
    }
    
    private enum LocalizedText: String {
        case noImageFound = "HeyAlle.Tabbar.no.image.found"
    }
}
