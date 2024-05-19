//
//  AppsController.swift
//  AppStoreApplication
//
//  Created by Yernar Baiginzheyev on 13.05.2024.
//

import UIKit

class AppsPageController: BaseListController {
    // MARK: - Properties
    var groups = [AppGroup]()
    // MARK: - Lyfecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .systemBackground
        collectionView.register(AppsGroupCell.self,
                                forCellWithReuseIdentifier: AppsGroupCell.identifier)
        
        collectionView.register(AppsPageHeader.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: AppsPageHeader.identifier)
        fetchData()
        
    }
    // MARK: - Helpers
    
    fileprivate func fetchData() {
        let dispatchGroup = DispatchGroup()
        var group1: AppGroup?
        var group2: AppGroup?
        
        dispatchGroup.enter()
        Service.shared.fetchTopFreeApps { appGroup, error in
            dispatchGroup.leave()
            if let error {
                print("Failed fetch AppGroup with: ", error)
                return
            }
            group1 = appGroup
        }
        
        dispatchGroup.enter()
        Service.shared.fetchTopPaydApps { appGroup, error in
            dispatchGroup.leave()
            if let error {
                print("Failed fetch AppGroup with: ", error)
                return
            }
            group2 = appGroup
        }
        dispatchGroup.notify(queue: .main) {
            if let group = group1 {
                self.groups.append(group)
            }
            if let group = group2 {
                self.groups.append(group)
                self.groups.append(group)
            }
            self.collectionView.reloadData()
        }
    }
    
    // MARK: - CollectionViewDelegate and DataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppsGroupCell.identifier, for: indexPath) as? AppsGroupCell {
            
            let group = groups[indexPath.item]
            cell.configure(with: group)
            
            return cell
        }
        return .init()
    }
    
    // MARK: - Header
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                     withReuseIdentifier: AppsPageHeader.identifier,
                                                                     for: indexPath)
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        .init(width: view.frame.width, height: 0)
    }
}
// MARK: - AppsPageController+UICollectionViewDelegateFlowLayout
extension AppsPageController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: view.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: 16, left: 0, bottom: 0, right: 0)
    }
}


