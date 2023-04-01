//
//  UIViewController+NavigationBar.swift
//  Cleaner
//
//  Created by Anatoliy Khramchenko on 01.04.2023.
//

import UIKit

extension UIViewController {

    func createBackButton() -> UIBarButtonItem {
        let button = UIButton(type: .system)
        button.setImage(Asset.backButtonImage.image.withRenderingMode(.alwaysTemplate), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        return UIBarButtonItem(customView: button)
    }

    func createTitleView(_ title: String, image: UIImage) -> UIView {

        let spacingLeft: CGFloat = 40
        let imageWidth: CGFloat = 25
        let textWidth: CGFloat = 100
        let spacing: CGFloat = 10

        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - spacingLeft, height: 41)

        let imageView = UIImageView()
        imageView.image = image
        imageView.frame = CGRect(
            x: UIScreen.main.bounds.width - spacingLeft - imageWidth - spacing - textWidth,
            y: 10, width: imageWidth, height: imageWidth
        )
        view.addSubview(imageView)

        let titleLabel = UILabel()
        titleLabel.text = title.uppercased()
        titleLabel.frame = CGRect(
            x: UIScreen.main.bounds.width - spacingLeft - textWidth,
            y: 10, width: textWidth, height: 20
        )
        titleLabel.font = FontFamily.Roboto.medium.font(size: 14)
        titleLabel.textColor = Asset.secondaryColor.color
        view.addSubview(titleLabel)

        return view

    }

    @objc
    func backAction() {
        navigationController?.popViewController(animated: true)
    }

}
