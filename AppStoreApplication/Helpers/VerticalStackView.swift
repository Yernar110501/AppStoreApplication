//
//  VerticalStackView.swift
//  AppStoreApplication
//
//  Created by Yernar Baiginzheyev on 09.05.2024.
//

import UIKit

class VerticalStackView: UIStackView {
    // MARK: - Init
    
    init(arrangedSubviews: [UIView], spacing: CGFloat = 0) {
        super.init(frame: .zero)
        arrangedSubviews.forEach{ addArrangedSubview($0) }
        self.spacing = spacing
        self.axis = .vertical
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
