//
//  CleanerActionElement.swift
//  Cleaner
//
//  Created by Anatoliy Khramchenko on 01.04.2023.
//

import UIKit

class CleanerActionElement: UIView {

    let xibName = "CleanerActionElement"
    @IBOutlet weak var contentView: UIView!

    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var leftBottomBlock: UIView!
    @IBOutlet weak var rightBottomBlock: UIView!

    @IBOutlet weak var actionElementImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var arrowView: UIView!
    @IBOutlet weak var absoluteValuesLabel: UILabel!
    @IBOutlet weak var dublicateValuesLabel: UILabel!

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
        setUpBackground(frame: rect)
        setUpLabels()
    }

    func updateData(storageInfo: StorageInfo) {
        // self.storageInfo = storageInfo
        draw(frame)
    }

    // MARK: SET UP

    private func loadViewFromNib() {
        Bundle.main.loadNibNamed(xibName, owner: self, options: nil)
        contentView.fixInView(self)
    }

    private func setUpBackground(frame: CGRect) {
        backgroundView.layer.cornerRadius = frame.width / 2
        backgroundView.layer.masksToBounds = true
        leftBottomBlock.transform = .init(rotationAngle: -(.pi / 12))
        rightBottomBlock.transform = .init(rotationAngle: .pi / 12)
    }

    private func setUpLabels() {
        
    }

}
