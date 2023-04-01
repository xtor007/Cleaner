//
//  StorageService.swift
//  Cleaner
//
//  Created by Anatoliy Khramchenko on 01.04.2023.
//

import Foundation

final class StorageService: StorageServiceProtocol {
    func calculateStorageData() async -> StorageData {
        do {
            try await Task.sleep(nanoseconds: 5_000_000_000)
        } catch {}
        return StorageData(
            info: StorageInfo(
                totalMemory: MemorySize(value: 128 * 1024),
                availableMemory: MemorySize(value: 24 * 1024),
                trashSize: MemorySize(value: 470)
            ),
            duplicatePhotos: DetectedDuplicateValue(absoluteValue: 120, absoluteItem: Strings.ActionElements.files, duplicateValue: 20),
            duplicateScreens: DetectedDuplicateValue(absoluteValue: 12, absoluteItem: Strings.ActionElements.files, duplicateValue: 2),
            duplicateContacts: DetectedDuplicateValue(absoluteValue: 30, absoluteItem: Strings.ActionElements.contacts, duplicateValue: 7)
        )
    }
}
