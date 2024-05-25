//
//  AppDetailsController.swift
//  AppStoreApplication
//
//  Created by Yernar Baiginzheyev on 24.05.2024.
//

import UIKit

class AppDetailsController: BaseListController {
    // MARK: - Propeties
    var appId: String! {
        didSet {
            let urlString = "https://itunes.apple.com/lookup?id=\(appId ?? "")"
            Service.shared.fetchGenericJsonData(urlString: urlString) { (result: SearchResult?, error) in
                if let error {
                    print("Failed to fetch data with: ", error)
                }
                self.app = result?.results.first
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }
    var app: Result?
    // MARK: - Lyfecycle
    override func viewDidLoad() {
        collectionView.backgroundColor = .systemBackground
        collectionView.register(AppDetailCell.self, forCellWithReuseIdentifier: AppDetailCell.identifier)
        self.navigationItem.largeTitleDisplayMode = .never
    }
    // MARK: - Delegate and DataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppDetailCell.identifier, for: indexPath) as? AppDetailCell {
            if let app {
                cell.configure(with: app)
            }
            return cell
        }
        return .init()
    }
}
// MARK: - AppDetailsController+UICollectionViewDelegateFlowLayout
extension AppDetailsController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let dummyCell = AppDetailCell(frame: .init(x: 0,
                                                   y: 0,
                                                   width: view.frame.width,
                                                   height: 1000))
        dummyCell.setReleaseNotes(with: app?.releaseNotes ?? "")
        dummyCell.layoutIfNeeded()
        let estimatedSize = dummyCell.systemLayoutSizeFitting(.init(width: view.frame.width,
                                                                   height: 1000))
        
        return .init(width: view.frame.width, height: estimatedSize.height)
    }
}
