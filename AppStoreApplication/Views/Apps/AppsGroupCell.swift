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
    let horizontalController = AppsHorizontalController()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemBackground
        
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor,
                          leading: leadingAnchor,
                          bottom: nil,
                          trailing: trailingAnchor, 
                          padding: .init(top: 0, left: 16, bottom: 0, right: 0))
        
        addSubview(horizontalController.view)
        horizontalController.view.anchor(top: titleLabel.bottomAnchor,
                                         leading: leadingAnchor,
                                         bottom: bottomAnchor,
                                         trailing: trailingAnchor)
        horizontalController.view.backgroundColor = .systemBackground
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
