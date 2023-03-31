//
//  GradientView.swift
//  Cleaner
//
//  Created by Anatoliy Khramchenko on 31.03.2023.
//

import UIKit

@IBDesignable
class GradientView: UIView {

    @IBInspectable var topColor: UIColor = Asset.backgroundGradientTopColor.color {
        didSet {
            updateView()
        }
    }

    @IBInspectable var mediumColor: UIColor = Asset.backgroundGradientMediumColor.color {
        didSet {
            updateView()
        }
    }

    @IBInspectable var bottomColor: UIColor = Asset.backgroundGradientBottomColor.color {
        didSet {
            updateView()
        }
    }

    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }

    func updateView() {
        guard let layer = self.layer as? CAGradientLayer else {
            return
        }
        layer.colors = [topColor, mediumColor, bottomColor].map { $0.cgColor }
    }

}
