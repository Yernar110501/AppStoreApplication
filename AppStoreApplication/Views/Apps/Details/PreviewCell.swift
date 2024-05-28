//
//  PreviewCell.swift
//  AppStoreApplication
//
//  Created by Yernar Baiginzheyev on 26.05.2024.
//

import UIKit

class PreviewCell: UICollectionViewCell {
    // MARK: - Properties
    static let identifier = "PreviewCell"
    let horizontalController = PreviewScreenshotsController()
    private let previewLabel = UILabel(text: "Preview", font: .boldSystemFont(ofSize: 24))
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews(horizontalController.view, previewLabel)
        previewLabel.anchor(top: topAnchor,
                            leading: leadingAnchor,
                            bottom: nil,
                            trailing: trailingAnchor,
                            padding: .init(top: 10,
                                           left: 16,
                                           bottom: 0,
                                           right: 16
                                          )
        )
        horizontalController.view.anchor(top: previewLabel.bottomAnchor,
                                         leading: leadingAnchor,
                                         bottom: bottomAnchor,
                                         trailing: trailingAnchor,
                                         padding: .init(top: 20,
                                                        left: 0,
                                                        bottom: 0,
                                                        right: 0
                                                       )
        )
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
