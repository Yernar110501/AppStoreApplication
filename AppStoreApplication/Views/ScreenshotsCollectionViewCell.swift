//
//  ScreenshotsCollectionViewCell.swift
//  AppStoreApplication
//
//  Created by Yernar Baiginzheyev on 09.05.2024.
//

import UIKit

class ScreenshotsCollectionViewCell: UICollectionViewCell {
    static let ifentifier = "ScreenshotsCollectionViewCell"
    
    let screenshotImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.backgroundColor = .blue
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .yellow
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
