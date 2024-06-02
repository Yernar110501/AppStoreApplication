//
//  TodayControlle.swift
//  AppStoreApplication
//
//  Created by Yernar Baiginzheyev on 29.05.2024.
//

import UIKit

class TodayController: BaseListController {
    // MARK: - Properties
    var startingFrame: CGRect?
    var appFullScreenController: AppFullScreenController!
    var topConstraint, leadingConstraint, widthConstraint, heightConstraint: NSLayoutConstraint?
    // MARK: - Lyfecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)
        navigationController?.isNavigationBarHidden = true
        collectionView.register(TodayCell.self, forCellWithReuseIdentifier: TodayCell.identifier)
    }
    
    // MARK: - Delegate+DataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TodayCell.identifier, for: indexPath) as? TodayCell {
            return cell
        }
        
        return .init()
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let appFullScreenController = AppFullScreenController()
        let redView = appFullScreenController.view!
        redView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleRemoveRedView)))
        view.addSubview(redView)
        addChild(appFullScreenController)
        self.appFullScreenController = appFullScreenController
        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
        print(cell.frame)
        guard let startingFrame = cell.superview?.convert(cell.frame, to: nil) else { return }
//        redView.frame = startingFrame
        self.startingFrame = startingFrame
        redView.translatesAutoresizingMaskIntoConstraints = false
        topConstraint = redView.topAnchor.constraint(equalTo: view.topAnchor, constant: startingFrame.origin.y)
        leadingConstraint = redView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: startingFrame.origin.x)
        widthConstraint = redView.widthAnchor.constraint(equalToConstant: startingFrame.width)
        heightConstraint = redView.heightAnchor.constraint(equalToConstant: startingFrame.height)
        
        [topConstraint, leadingConstraint, widthConstraint, heightConstraint].forEach { $0?.isActive = true }
        self.view.layoutIfNeeded()
        redView.layer.cornerRadius = 16
        
        UIView.animate(withDuration: 0.7,
                       delay: 0,
                       usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
//            redView.frame = self.view.frame
            self.topConstraint?.constant = 0
            self.leadingConstraint?.constant = 0
            self.widthConstraint?.constant = self.view.frame.width
            self.heightConstraint?.constant = self.view.frame.height
            self.view.layoutIfNeeded()
        }) {_ in
            self.tabBarController?.tabBar.isHidden = true
            
        }

    }
    
    // MARK: - Helpers
    @objc private func handleRemoveRedView(gesture: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.7,
                       delay: 0,
                       usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
//            gesture.view?.frame = self.startingFrame ?? .zero
            self.appFullScreenController.tableView.contentOffset = .zero
            guard let stargingFrame = self.startingFrame else { return }
            self.topConstraint?.constant = stargingFrame.origin.y
            self.leadingConstraint?.constant = stargingFrame.origin.x
            self.widthConstraint?.constant = stargingFrame.width
            self.heightConstraint?.constant = stargingFrame.height
            self.view.layoutIfNeeded()
            
            self.tabBarController?.tabBar.isHidden = false


        }) {_ in
            gesture.view?.removeFromSuperview()
            self.appFullScreenController.removeFromParent()
        }
    }
}

extension TodayController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 64, height: 450)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 32
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 32, left: 0, bottom: 32, right: 0)
    }
}
