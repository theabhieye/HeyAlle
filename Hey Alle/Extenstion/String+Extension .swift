//
//  String+Extension .swift
//  Hey Alle
//
//  Created by Abhishek kapoor on 10/10/23.
//

import Foundation

extension String {
     var localized: String {
        NSLocalizedString(self, comment: "")
    }
    static func formattedCurrentDate(_ date: Date = Date()) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMMM yyyy h:mma"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        let formattedDate = dateFormatter.string(from: date)
        return formattedDate
    }

}
