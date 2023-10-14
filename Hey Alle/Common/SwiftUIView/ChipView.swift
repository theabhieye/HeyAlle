//
//  ChipView.swift
//  Hey Alle
//
//  Created by Abhishek kapoor on 13/10/23.
//

import SwiftUI

struct ChipView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(Color.yellow.opacity(0.2))
            .foregroundColor(Color.black)
            .cornerRadius(16)
    }
}
