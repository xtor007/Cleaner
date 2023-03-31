//
//  YourStorageInfoView.swift
//  Cleaner
//
//  Created by Anatoliy Khramchenko on 31.03.2023.
//

import UIKit

class YourStorageInfoView: UIView {

    let xibName = "YourStorageInfoView"
    @IBOutlet var contentView: UIView!

    @IBOutlet var backgroundView: UIView!
    @IBOutlet var yourStorageLabel: UILabel!
    @IBOutlet var emptyStoragePercentLabel: UILabel!
    @IBOutlet var totalMemoryLabel: UILabel!
    @IBOutlet var totalMemoryValueLabel: UILabel!
    @IBOutlet var availabelMemoryLabel: UILabel!
    @IBOutlet var avaliableMemoryValueLabel: UILabel!
    @IBOutlet var trashSizeLabel: UILabel!
    @IBOutlet var trashSizeValueLabel: UILabel!

    private var storageInfo: StorageInfo?

    // MARK: LIFECYCLE

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViewFromNib()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadViewFromNib()
    }

    override func draw(_ rect: CGRect) {
        setUpBackground(frame: frame)
        setUpLabels()
    }

    func updateData(storageInfo: StorageInfo) {
        self.storageInfo = storageInfo
        draw(frame)
    }

    // MARK: SET UP

    private func loadViewFromNib() {
        Bundle.main.loadNibNamed(xibName, owner: self, options: nil)
        contentView.fixInView(self)
    }

    private func setUpBackground(frame: CGRect) {
        backgroundView.backgroundColor = Asset.secondaryColor.color.withAlphaComponent(0.15)
        backgroundView.layer.cornerRadius = frame.width / 2
        backgroundView.layer.borderWidth = 1
        backgroundView.layer.borderColor = Asset.secondaryColor.color.cgColor
    }

    private func setUpLabels() {
        yourStorageLabel.text = Strings.YourStorage.title
        totalMemoryLabel.text = Strings.YourStorage.totalMemory
        availabelMemoryLabel.text = Strings.YourStorage.available
        trashSizeLabel.text = Strings.YourStorage.trashSize
        if let storageInfo {
            let percent = (storageInfo.totalMemory.value - storageInfo.availableMemory.value) / storageInfo.totalMemory.value
            emptyStoragePercentLabel.text = "\((percent * 100).description)%"
            totalMemoryValueLabel.text = storageInfo.totalMemory.description
            avaliableMemoryValueLabel.text = storageInfo.availableMemory.description
            trashSizeValueLabel.text = storageInfo.trashSize.description
        } else {
            emptyStoragePercentLabel.text = "0%"
            totalMemoryValueLabel.text = "0 GB"
            avaliableMemoryValueLabel.text = "0 GB"
            trashSizeValueLabel.text = "0 MB"
        }
    }

}
