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

    private var spinner = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)

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
        activateSpinner()
        viewModel.fetchData { storageInfo in
            self.updateElements()
            self.yourStorageInfoView.updateData(storageInfo: storageInfo)
            self.deactivateSpinner()
        }
    }

    private func updateElements() {
        for elementIndex in 0..<actionElements.count {
            actionElements[elementIndex].updateData(model: viewModel.cleanerActionElementsModel[elementIndex])
        }
    }

    // MARK: SPINNER

    private func activateSpinner() {
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        view.addSubview(spinner)
        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    private func deactivateSpinner() {
        spinner.removeFromSuperview()
        spinner.stopAnimating()
    }

}
