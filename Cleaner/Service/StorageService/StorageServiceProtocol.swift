//
//  StorageServiceProtocol.swift
//  Cleaner
//
//  Created by Anatoliy Khramchenko on 01.04.2023.
//

import Foundation

protocol StorageServiceProtocol {
    func calculateStorageData() async -> StorageData
}
