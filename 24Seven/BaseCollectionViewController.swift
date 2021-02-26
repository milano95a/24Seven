//
//  BaseCollectionViewLayout.swift
//  24Seven
//
//  Created by Abdurakhmon Jamoliddinov on 2/26/21.
//

import UIKit

class CustomCollectionViewController: UIViewController {
    
    var collectionView: UICollectionView!
    var customCollectionViewControllerDelegate: CustomCollectionViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customCollectionViewControllerDelegate = delegate()
        collectionView = UICollectionView(frame: view.frame,
                                          collectionViewLayout: customCollectionViewControllerDelegate.layout())
        collectionView.delegate = customCollectionViewControllerDelegate.collectionViewDelegate()
        collectionView.dataSource = customCollectionViewControllerDelegate.collectionViewDataSource()
        collectionView.backgroundColor = .clear

        for cellClass in customCollectionViewControllerDelegate.registerCells() {
            collectionView.register(cellClass, forCellWithReuseIdentifier: String(describing: cellClass))
        }
        
        for headerClass in customCollectionViewControllerDelegate.registerHeaders() {
            collectionView.register(headerClass,
                                    forSupplementaryViewOfKind: String(describing: headerClass),
                                    withReuseIdentifier: String(describing: headerClass))
        }

        addCollectionViewToScreen()
    }
    
    func addCollectionViewToScreen(){
        fatalError("setUpCollectionView not implemented")
    }
    
    func delegate() -> CustomCollectionViewControllerDelegate {
        fatalError("setUpCollectionView not implemented")
    }
}

protocol CustomCollectionViewControllerDelegate {
    func layout() -> UICollectionViewLayout
    func collectionViewDelegate() -> UICollectionViewDelegate
    func collectionViewDataSource() -> UICollectionViewDataSource
    func registerCells() -> [AnyClass]
    func registerHeaders() -> [AnyClass]
}
