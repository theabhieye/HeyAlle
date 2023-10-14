//
//  TagBottomSheet.swift
//  Hey Alle
//
//  Created by Abhishek kapoor on 13/10/23.
//

import SwiftUI

struct TagBottomSheet: View {

    @State private var text: String = ""
    @ObservedObject var viewModel: InfoViewModel

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.gray.opacity(0.8))
                    .frame(width: 50, height: 8)

                Spacer()
            }
            .padding(.top, 20)

            Text("Collections")
                .font(.largeTitle)
                .bold()
                
            
            TextField("Enter something", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle.roundedBorder)
                .padding(.leading)
                
            HStack {
                ForEach(0 ..< viewModel.chipOptions.count, id: \.self) { index in
                    ChipView(text: viewModel.chipOptions[index])
                        .padding(.horizontal, 5)
                }
            }
            .padding(.vertical)
            Spacer()
        }
        .background(Color.white)
        .cornerRadius(20)
        .padding(.leading, 20)
    }
}
 
