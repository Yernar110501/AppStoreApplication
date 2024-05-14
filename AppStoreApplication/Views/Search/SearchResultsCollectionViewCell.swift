//
//  SearchResultsCollectionViewCell.swift
//  AppStoreApplication
//
//  Created by Yernar Baiginzheyev on 05.05.2024.
//

import UIKit
import SDWebImage

class SearchResultsCollectionViewCell: UICollectionViewCell {
    // MARK: - Properties
    static let identifier = "SearchResultsCollectionViewCell"
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 12
        iv.clipsToBounds = true
        iv.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 64).isActive = true
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "APP NAME"
        return label
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Photo &video"
        return label
    }()
    
    let ratingsLabel: UILabel = {
        let label = UILabel()
        label.text = "9.26M"
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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.categoryLabel.text = nil
        self.ratingsLabel.text = nil
        self.categoryLabel.text = nil
        self.imageView.image = nil
        self.screenshot1ImageView.image = nil
        self.screenshot2ImageView.image = nil
        self.screenshot3ImageView.image = nil
        
    }
    // MARK: - Helpers
    public func configire(with model: Result) {
        self.nameLabel.text = model.trackName
        self.categoryLabel.text = model.primaryGenreName
        self.ratingsLabel.text = "\(model.averageUserRating ?? 0)"
        self.imageView.sd_setImage(with: model.artworkUrl100)
        
        self.screenshot1ImageView.sd_setImage(with: model.screenshotUrls?[0])
        
        if model.screenshotUrls?.count ?? 0 > 1 {
            self.screenshot2ImageView.sd_setImage(with: model.screenshotUrls?[1])
        }
        if model.screenshotUrls?.count ?? 0 > 2 {
            self.screenshot3ImageView.sd_setImage(with: model.screenshotUrls?[2])
        }
        
    }
}
