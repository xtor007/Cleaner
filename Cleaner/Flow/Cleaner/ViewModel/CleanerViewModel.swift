//
//  CleanerViewModel.swift
//  Cleaner
//
//  Created by Anatoliy Khramchenko on 31.03.2023.
//

import Foundation

class CleanerViewModel {

    private(set) var cleanerActionElementsModel = [
        CleanerActionElementModel(
            avatar: Asset.dublicatePhotoImage,
            title: Strings.ActionElements.duplicatesPhotos,
            detectedDuplicateData: DetectedDuplicateValue(absoluteItem: Strings.ActionElements.files)
        ),
        CleanerActionElementModel(
            avatar: Asset.dublicateScreenshotsImage,
            title: Strings.ActionElements.duplicatesScreen,
            detectedDuplicateData: DetectedDuplicateValue(absoluteItem: Strings.ActionElements.files)
        ),
        CleanerActionElementModel(
            avatar: Asset.dublicateContactsImage,
            title: Strings.ActionElements.duplicatesContacts,
            detectedDuplicateData: DetectedDuplicateValue(absoluteItem: Strings.ActionElements.contacts)
        ),
        CleanerActionElementModel(avatar: Asset.secretStorageImage, title: Strings.ActionElements.secretStorage.uppercased()),
        CleanerActionElementModel(avatar: Asset.allPhotosImage, title: Strings.ActionElements.allPhotos.uppercased()),
        CleanerActionElementModel(avatar: Asset.allVideosImage, title: Strings.ActionElements.allVideos.uppercased())
    ]

    let service: StorageServiceProtocol

    init(service: StorageServiceProtocol) {
        self.service = service
    }

    func fetchData(onSuccess: @escaping (StorageInfo) -> Void) {
        Task {
            let storageData = await service.calculateStorageData()
            cleanerActionElementsModel[0].detectedDuplicateData = storageData.duplicatePhotos
            cleanerActionElementsModel[1].detectedDuplicateData = storageData.duplicateScreens
            cleanerActionElementsModel[2].detectedDuplicateData = storageData.duplicateContacts
            DispatchQueue.main.async {
                onSuccess(storageData.info)
            }
        }
    }

}
