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
    @IBOutlet weak var centerBottomBlock: UIView!
    
    @IBOutlet weak var actionElementImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var arrowView: UIView!
    @IBOutlet weak var absoluteValuesLabel: UILabel!
    @IBOutlet weak var dublicateValuesLabel: UILabel!

    private var model: CleanerActionElementModel?

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

    func updateData(model: CleanerActionElementModel) {
        self.model = model
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
        guard let model else {
            return
        }
        actionElementImage.image = model.avatar.image
        titleLabel.text = model.title
        if let detectedDuplicate = model.detectedDuplicateData {
            titleLabel.font = FontFamily.Roboto.regular.font(size: 10)
            arrowView.isHidden = false
            absoluteValuesLabel.isHidden = false
            dublicateValuesLabel.isHidden = false
            leftBottomBlock.isHidden = false
            centerBottomBlock.isHidden = false
            rightBottomBlock.isHidden = false
            absoluteValuesLabel.text = "\(detectedDuplicate.absoluteValue ?? 0) \(detectedDuplicate.absoluteItem)"
            dublicateValuesLabel.text = "\(detectedDuplicate.duplicateValue ?? 0) \(Strings.ActionElements.duplicates)"
        } else {
            titleLabel.font = FontFamily.Roboto.regular.font(size: 13)
            arrowView.isHidden = true
            absoluteValuesLabel.isHidden = true
            dublicateValuesLabel.isHidden = true
            leftBottomBlock.isHidden = true
            centerBottomBlock.isHidden = true
            rightBottomBlock.isHidden = true
        }
    }

}
