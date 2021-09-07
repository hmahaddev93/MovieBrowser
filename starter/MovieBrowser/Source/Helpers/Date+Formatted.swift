//
//  Date+Formatted.swift
//
//  Created by Khateeb Mahad H. on 8/4/21.
//

import Foundation
extension Date {
    var formatted: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: self)
    }
    
    var formatted1: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yy"
        return formatter.string(from: self)
    }
}
