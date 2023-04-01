//
//  MemorySize.swift
//  Cleaner
//
//  Created by Anatoliy Khramchenko on 01.04.2023.
//

import Foundation

struct MemorySize {

    private enum MemoryMeasurement: String {
        case gigabytes = "GB"
        case megabytes = "MB"
    }

    /// value in mb
    let value: Double

    var description: String {
        let showedValue = value >= 1024 ? value / 1024 : value
        let measurement = value >= 1024 ? MemoryMeasurement.gigabytes : .megabytes
        return "\(showedValue.description) \(measurement.rawValue)"
    }

}
