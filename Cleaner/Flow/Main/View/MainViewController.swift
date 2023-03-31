//
//  MainViewController.swift
//  Cleaner
//
//  Created by Anatoliy Khramchenko on 31.03.2023.
//

import UIKit

class MainViewController: UIViewController {

    private let viewModel: MainViewModel

    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
