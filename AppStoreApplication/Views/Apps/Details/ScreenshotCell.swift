//
//  ScreenshotCell.swift
//  AppStoreApplication
//
//  Created by Yernar Baiginzheyev on 26.05.2024.
//

import UIKit
import SDWebImage

class ScreenshotCell: UICollectionViewCell {
    // MARK: - Properties
    static let identifier = "ScreenshotCell"
    
    private let imageView = UIImageView(cornerRadius: 12)
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        imageView.fillSuperview()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lyfecycle
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    
    // MARK: - Helpers
    
    public func configure(with url: URL?) {
        imageView.sd_setImage(with: url)
    }
    
}
