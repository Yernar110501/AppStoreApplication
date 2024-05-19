//
//  AppsHeaderCollectionViewCell.swift
//  AppStoreApplication
//
//  Created by Yernar Baiginzheyev on 19.05.2024.
//

import UIKit

class AppsHeaderCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let identifier = "AppsHeaderCollectionViewCell"
    
    private let companyLabel = UILabel(text: "Facebook", font: .boldSystemFont(ofSize: 14))
    private let titleLabel = UILabel(text: "Keeping up with friends is faster than ever", font: .systemFont(ofSize: 24 ))
    private let imageView = UIImageView(cornerRadius: 12)
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        let stackView = VerticalStackView(arrangedSubviews: [
            companyLabel,
            titleLabel,
            imageView
        ], spacing: 12)
        
        titleLabel.numberOfLines = 2
        companyLabel.textColor = .blue
        imageView.backgroundColor = .red
        
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 12, left: 0, bottom: 0, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
}
