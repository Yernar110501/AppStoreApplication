//
//  AppDetailsController.swift
//  AppStoreApplication
//
//  Created by Yernar Baiginzheyev on 24.05.2024.
//

import UIKit


class AppDetailsController: BaseListController {
    // MARK: - Propeties
    //private var appId: String!
    var app: Result?
    var reviews: Reviews?
    // MARK: - Lyfecycle
    override func viewDidLoad() {
        collectionView.backgroundColor = .systemBackground
        collectionView.register(AppDetailCell.self, forCellWithReuseIdentifier: AppDetailCell.identifier)
        collectionView.register(PreviewCell.self, forCellWithReuseIdentifier: PreviewCell.identifier)
        collectionView.register(ReviewRowCell.self, forCellWithReuseIdentifier: ReviewRowCell.identifier)
        
        self.navigationItem.largeTitleDisplayMode = .never
        
    }
    // MARK: - Delegate and DataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppDetailCell.identifier, for: indexPath) as? AppDetailCell {
                if let app {
                    cell.configure(with: app)
                }
                return cell
            }
        } else if indexPath.item == 1 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PreviewCell.identifier, for: indexPath) as? PreviewCell {
                cell.horizontalController.configure(with: app)
                DispatchQueue.main.async {
                    cell.horizontalController.collectionView.reloadData()

                }
                return cell
            }
        }
        else if indexPath.item == 2 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReviewRowCell.identifier, for: indexPath) as? ReviewRowCell {
                cell.horizontalController.configure(with: reviews)
                DispatchQueue.main.async {
                    cell.horizontalController.collectionView.reloadData()
                }
                return cell
            }
        }
        
        return .init()
    }
    
    // MARK: - Helpers
    
    public func configure(with appId: String) {
        let urlString = "https://itunes.apple.com/lookup?id=\(appId)"
        Service.shared.fetchGenericJsonData(urlString: urlString) { (result: SearchResult?, error) in
            if let error {
                print("Failed to fetch data with: ", error)
            }
            self.app = result?.results.first
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        
        let reviewsUrlString = "https://itunes.apple.com/rss/customerreviews/page=1/id=\(appId)/sortby=mostrecent/json?l=en&cc=us"
        Service.shared.fetchGenericJsonData(urlString: reviewsUrlString) { (result: Reviews?, error) in
            if let error {
                print("Failed to fetch data with: ", error)
            }
            self.reviews = result
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        
    }
}
// MARK: - AppDetailsController+UICollectionViewDelegateFlowLayout
extension AppDetailsController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 0 {
            let dummyCell = AppDetailCell(frame: .init(x: 0,
                                                       y: 0,
                                                       width: view.frame.width,
                                                       height: 1000))
            dummyCell.setReleaseNotes(with: app?.releaseNotes ?? "")
            dummyCell.layoutIfNeeded()
            let estimatedSize = dummyCell.systemLayoutSizeFitting(.init(width: view.frame.width,
                                                                        height: 1000))
            
            return .init(width: view.frame.width, height: estimatedSize.height)
        } else if indexPath.item == 1 {
            return .init(width: view.frame.width, height: 500)
        } else if indexPath.item == 2 {
            return .init(width: view.frame.width, height: 280)
        }
        return .init()
    }
}
