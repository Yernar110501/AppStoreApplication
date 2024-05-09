//
//  SearchResultsCollectionViewCell.swift
//  AppStoreApplication
//
//  Created by Yernar Baiginzheyev on 05.05.2024.
//

import UIKit

class SearchResultsCollectionViewCell: UICollectionViewCell {
    // MARK: - Properties
    static let identifier = "SearchResultsCollectionViewCell"
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .red
        iv.layer.cornerRadius = 12
        iv.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 64).isActive = true
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "APP NAME"
        label.backgroundColor = .yellow
        return label
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Photo &video"
        label.backgroundColor = .yellow
        return label
    }()
    
    let ratingsLabel: UILabel = {
        let label = UILabel()
        label.text = "9.26M"
        label.backgroundColor = .yellow
        return label
    }()
    
    let getButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.setTitle("GET", for: .normal)
        button.backgroundColor = .init(white: 0.95, alpha: 1)
        button.layer.cornerRadius = 16
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        return button
    }()
    
    lazy var screenshot1ImageView = createScreenshots()
    lazy var screenshot2ImageView = createScreenshots()
    lazy var screenshot3ImageView = createScreenshots()
    
    private func createScreenshots() -> UIImageView {
        let imageView = UIImageView()
        imageView.backgroundColor = .blue
        return imageView
    }
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        
        let infoTopStackView = UIStackView(
            arrangedSubviews: [
                imageView,
                VerticalStackView(arrangedSubviews: [
                    nameLabel,
                    categoryLabel,
                    ratingsLabel
                ]),
                getButton
            ]
        )
        infoTopStackView.spacing = 12
        infoTopStackView.alignment = .center
        
        let screenShotsStackView = UIStackView(
            arrangedSubviews: [
                screenshot1ImageView,
                screenshot2ImageView,
                screenshot3ImageView
            ])
        
        screenShotsStackView.axis = .horizontal
        screenShotsStackView.distribution = .fillEqually
        screenShotsStackView.spacing = 12
        
        let overallStackView = VerticalStackView(arrangedSubviews: [
            infoTopStackView,
            screenShotsStackView
        ], spacing: 16)
        
        addSubview(overallStackView)
        
        overallStackView.fillSuperview(padding:
                .init(
                    top: 16,
                    left: 16,
                    bottom: 16,
                    right: 16
                )
        )
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lyfecycle
    // MARK: - Helpers
    
}
