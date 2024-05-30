//
//  TodayCell.swift
//  AppStoreApplication
//
//  Created by Yernar Baiginzheyev on 29.05.2024.
//

import UIKit

class TodayCell: UICollectionViewCell {
    // MARK: - Properties
    static let identifier = "TodayCell"
    private let imageView = UIImageView(cornerRadius: 16)
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        layer.cornerRadius = 16
        addSubview(imageView)
        imageView.image = UIImage(named: "garden")
        imageView.centerInSuperview(size: .init(width: 250, height: 250))
        imageView.contentMode = .scaleAspectFill
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Helpers
}
