//
//  PreviewScreenshotsController.swift
//  AppStoreApplication
//
//  Created by Yernar Baiginzheyev on 26.05.2024.
//

import UIKit

class PreviewScreenshotsController: HorizontalSnappingController {
    // MARK: - Properties
    private var app: Result?
    // MARK: - Lyfecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .systemBackground
        collectionView.register(ScreenshotCell.self, forCellWithReuseIdentifier: ScreenshotCell.identifier)
        collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
    }
    // MARK: - Delegate+DataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return app?.screenshotUrls?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ScreenshotCell.identifier, for: indexPath) as? ScreenshotCell {
            cell.configure(with: app?.screenshotUrls?[indexPath.item])
            return cell
        }
        return .init()
    }
    // MARK: - Helpers
    public func configure(with model: Result?) {
        self.app = model
    }
}

extension PreviewScreenshotsController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 250, height: view.frame.height)
    }
}
