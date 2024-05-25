//
//  AppDetailCell.swift
//  AppStoreApplication
//
//  Created by Yernar Baiginzheyev on 24.05.2024.
//

import UIKit
import SDWebImage

class AppDetailCell: UICollectionViewCell {
    // MARK: - Properties
    static let identifier = "AppDetailCell"
    
    private let appIconImageView = UIImageView(cornerRadius: 16)
    private let nameLabel = UILabel(text: "App name",
                                    font: .boldSystemFont(ofSize: 24),
                                    numberOfLines: 2)
    private let priceButton = UIButton(title: "Get")
    private let whatsNewLabel = UILabel(text: "What's new",
                                        font: .boldSystemFont(ofSize: 20))
    private let releaseNotesLabel = UILabel(text: "Release Notes",
                                            font: .systemFont(ofSize: 16),
                                            numberOfLines: 0)
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        configureViews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Helpers
    private func configureConstraints() {
        appIconImageView.constrainWidth(constant: 140)
        appIconImageView.constrainHeight(constant: 140)
        priceButton.constrainHeight(constant: 32)
        priceButton.constrainWidth(constant: 80)
    }
    
    private func configureViews() {
        priceButton.backgroundColor = .systemBlue
        priceButton.tintColor = .white
        priceButton.layer.cornerRadius = 32 / 2
        priceButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        priceButton.tintColor = .white
        
        let stackView = VerticalStackView(arrangedSubviews: [
            UIStackView(arrangedSubviews: [
                appIconImageView,
                VerticalStackView(arrangedSubviews: [
                    nameLabel,
                    UIStackView(arrangedSubviews: [
                        priceButton, UIView()
                    ]),
                    UIView()
                ], spacing: 12)
            ], customSpacing: 20),
            whatsNewLabel,
            releaseNotesLabel
        ], spacing: 16)
        
        addSubview(stackView)
        
        stackView.fillSuperview(padding: .init(top: 20,
                                               left: 20,
                                               bottom: 20,
                                               right: 20))
    }
    
    public func configure(with model: Result) {
        self.appIconImageView.sd_setImage(with: model.artworkUrl100)
        self.nameLabel.text = model.trackName
        self.releaseNotesLabel.text = model.releaseNotes
        self.priceButton.setTitle(model.formattedPrice ?? "GET" , for: .normal)
    }
    
    public func setReleaseNotes(with text: String) {
        self.releaseNotesLabel.text = text
    }
}
