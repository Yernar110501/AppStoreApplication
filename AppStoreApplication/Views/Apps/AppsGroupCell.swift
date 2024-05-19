//
//  AppsGroupCell.swift
//  AppStoreApplication
//
//  Created by Yernar Baiginzheyev on 13.05.2024.
//

import UIKit

class AppsGroupCell: UICollectionViewCell {
    // MARK: - Properties
    static let identifier = "AppsGroupCell"
    
    let titleLabel = UILabel(text: "Apps Section", font: .boldSystemFont(ofSize: 30))
    let seeAllButton = UIButton(title: "See All")
    let horizontalController = AppsHorizontalController()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemBackground
        confiureView()
        seeAllButton.addTarget(self, action: #selector(didTapSeeAll), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Lyfecycle
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
    }
    // MARK: - Helper
    
    private func confiureView() {
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor,
                          leading: leadingAnchor,
                          bottom: nil,
                          trailing: nil,
                          padding: .init(top: 0, left: 16, bottom: 0, right: 0))
        
        addSubview(seeAllButton)
        seeAllButton.anchor(top: topAnchor,
                          leading: nil,
                          bottom: nil,
                          trailing: trailingAnchor,
                          padding: .init(top: 0, left: 0, bottom: 0, right: 16))
        
        addSubview(horizontalController.view)
        horizontalController.view.anchor(top: titleLabel.bottomAnchor,
                                         leading: leadingAnchor,
                                         bottom: bottomAnchor,
                                         trailing: trailingAnchor)
        horizontalController.view.backgroundColor = .systemBackground
    }
    
    public func configure(with model: AppGroup) {
        self.titleLabel.text = model.feed.title
        self.horizontalController.configure(with: model)
        DispatchQueue.main.async {
            self.horizontalController.collectionView.reloadData()
        }
    }
    
    @objc private func didTapSeeAll() {
        //pushViewController(UIViewController(), animated: true)
        print("see all")
        
    }
    
}
