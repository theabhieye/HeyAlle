//
//  NavigationBar.swift
//  Hey Alle
//
//  Created by Abhishek kapoor on 10/10/23.
//

import SwiftUI

struct NavigationBar: View {
    var title: String
    
    var body: some View {
        HStack {
            Image(systemName: "chevron.left")
                .font(.title)
                .foregroundColor(.black)
            Spacer()
            Text(title)
                .font(.headline)
            Spacer()
        }
    }
}

