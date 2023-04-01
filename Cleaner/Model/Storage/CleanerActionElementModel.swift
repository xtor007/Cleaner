//
//  CleanerActionElementModel.swift
//  Cleaner
//
//  Created by Anatoliy Khramchenko on 01.04.2023.
//

import Foundation

struct CleanerActionElementModel {

    let avatar: ImageAsset
    let title: String
    var detectedDuplicateData: DetectedDuplicateValue?

    init(avatar: ImageAsset, title: String, detectedDuplicateData: DetectedDuplicateValue? = nil) {
        self.avatar = avatar
        self.title = title
        self.detectedDuplicateData = detectedDuplicateData
    }

}

struct DetectedDuplicateValue {

    let absoluteValue: Int?
    let absoluteItem: String
    let duplicateValue: Int?

    init(absoluteValue: Int? = nil, absoluteItem: String, duplicateValue: Int? = nil) {
        self.absoluteValue = absoluteValue
        self.absoluteItem = absoluteItem
        self.duplicateValue = duplicateValue
    }

}
