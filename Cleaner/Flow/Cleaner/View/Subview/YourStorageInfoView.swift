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
        emptyStoragePercentLabel.text = "0%"
        totalMemoryLabel.text = Strings.YourStorage.totalMemory
        totalMemoryValueLabel.text = "0 GB"
        availabelMemoryLabel.text = Strings.YourStorage.available
        avaliableMemoryValueLabel.text = "0 GB"
        trashSizeLabel.text = Strings.YourStorage.trashSize
        trashSizeValueLabel.text = "0 MB"
    }

}
