//
//  CleanerViewController.swift
//  Cleaner
//
//  Created by Anatoliy Khramchenko on 31.03.2023.
//

import UIKit

class CleanerViewController: UIViewController {

    private let viewModel: CleanerViewModel

    @IBOutlet weak var yourStorageInfoView: YourStorageInfoView!
    @IBOutlet var actionElements: [CleanerActionElement]!

    init(viewModel: CleanerViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateElements()
        viewModel.fetchData { storageInfo in
            self.updateElements()
            self.yourStorageInfoView.updateData(storageInfo: storageInfo)
        }
    }

    private func updateElements() {
        for elementIndex in 0..<actionElements.count {
            actionElements[elementIndex].updateData(model: viewModel.cleanerActionElementsModel[elementIndex])
        }
    }

}
