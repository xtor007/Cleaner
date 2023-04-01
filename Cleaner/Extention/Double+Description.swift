//
//  Double+Description.swift
//  Cleaner
//
//  Created by Anatoliy Khramchenko on 01.04.2023.
//

import Foundation

extension Double {
    var description: String {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 0
        return formatter.string(from: self as NSNumber) ?? "0"
    }
}
