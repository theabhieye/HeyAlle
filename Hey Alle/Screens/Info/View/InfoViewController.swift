//
//  InfoViewController.swift
//  Hey Alle
//
//  Created by Abhishek kapoor on 10/10/23.
//

import UIKit
import SwiftUI

final class InfoViewController: UIHostingController<InfoView> {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

struct InfoView: View {
    @StateObject var viewModel: InfoViewModel
    @FocusState private var isFocused: Bool
    @State private var isExpanded: Bool = false
    @State private var textfieldText = ""
    @State private var isSheetPresented = false
    @State private var text: String = ""
    @State private var settingsDetent = PresentationDetent.medium

    
    var body: some View {
        ScrollView {
            VStack(spacing: Constants.bodySpacing) {
                if let image = viewModel.image, !isFocused {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width,
                               height: UIScreen.main.bounds.height * 0.6)
                        .animation(Animation.easeInOut(duration: Constants.animationDuration),
                                   value: UUID())
                }
                
                TextField(LocalizedText.enterText.rawValue.localized,
                          text: $textfieldText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .focused($isFocused)
                
                HStack {
                    Text(LocalizedText.collection.rawValue.localized)
                        .font(.largeTitle)
                        .padding(.leading)
                    
                    Spacer()
                }
               
                WStack(Constants.chipData) { chipText in
                    ChipView(text: chipText)
                }
                .padding(.leading)
                
                HStack {
                    Text(LocalizedText.desc.rawValue.localized)
                        .font(.headline)
                        .padding(.leading)
                    Spacer()
                    Button(LocalizedText.edit.rawValue.localized) {
                        isSheetPresented = true
                    }
                    .padding(.trailing)
                    .foregroundColor(.black)
                }
                bottomContainView
                Spacer()
                    .frame(height: Constants.spacerHeight)
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
        .onAppear {
            viewModel.fetchImage()
        }
        .blur(radius: isSheetPresented ?
              Constants.blurRadius :
                CGFloat.zero)
        .sheet(isPresented: $isSheetPresented){
            TagBottomSheet(viewModel: viewModel)
            .presentationDetents([.medium], selection: $settingsDetent)
        }
    }
    
    private var bottomContainView: some View {
        VStack {
            Text(isExpanded ? LocalizedText.loremText.rawValue.localized : LocalizedText.loremText.rawValue.localized.prefix(Constants.prefixCount) + "")
                .lineLimit(isExpanded ? nil : 3)
                .onTapGesture {
                    hideKeyboard()
                    isExpanded.toggle()
                }
            HStack {
                Button(isExpanded ?
                        LocalizedText.readMore.rawValue.localized :
                        LocalizedText.readLess.rawValue.localized) {
                    isExpanded.toggle()
                }
                .tint(Color.black)
                .bold()
                Spacer()
            }
        }
        .padding(.horizontal)

    }
    
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                        to: nil, 
                                        from: nil,
                                        for: nil)
    }
    
    private enum Constants {
        static let blurRadius: CGFloat = 5.0
        static let spacerHeight: CGFloat = 40.0
        static let prefixCount: Int = 99
        static let chipData: [String] = ["Animal", "Rabbit"]
        static let bodySpacing: CGFloat = 10
        static let animationDuration:CGFloat = 10.0
        
    }
    
    enum LocalizedText: String {
        case loremText = "HeyAlle.Tabbar.lorem.text"
        case desc = "HeyAlle.Tabbar.description"
        case edit = "HeyAlle.Tabbar.edit"
        case readLess = "HeyAlle.Tabbar.read.less"
        case readMore = "HeyAlle.Tabbar.read.more"
        case collection = "HeyAlle.Tabbar.read.collection"
        case enterText = "HeyAlle.Tabbar.read.enter.text"
    }
}

 



 
 
