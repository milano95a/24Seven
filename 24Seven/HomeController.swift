//
//  ViewController.swift
//  24Seven
//
//  Created by Abdurakhmon Jamoliddinov on 2/24/21.
//

import UIKit

class HomeController: UIViewController {
    
    var news: [News] = [
        News()
    ]
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        configure collection view
        collectionView = UICollectionView(frame: view.frame,
                                          collectionViewLayout: configureLayout())
        collectionView.delegate = self
        collectionView.dataSource = self

        collectionView.register(
            BannerCollectionViewCell.self,
            forCellWithReuseIdentifier: String(describing: BannerCollectionViewCell.self))
        collectionView.register(
            ProductCollectionViewCell.self,
            forCellWithReuseIdentifier: String(describing: ProductCollectionViewCell.self))
        collectionView.register(
            NewsCollectionViewCell.self,
            forCellWithReuseIdentifier: String(describing: NewsCollectionViewCell.self))
        collectionView.backgroundColor = UIColor(named: "Background")
        
        view.addSubview(collectionView)
    }
    
    private func configureLayout() -> UICollectionViewCompositionalLayout {
        
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvronment in
            switch sectionIndex {
            case 0:
                return NSCollectionLayoutSection.banner()
            case 1...4:
                return NSCollectionLayoutSection.item()
            default:
                return nil
            }
        }
        return layout
    }
}

extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 10
        case 1...3:
            return 10
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: String(describing: BannerCollectionViewCell.self),
                for: indexPath
            ) as! BannerCollectionViewCell
            
            return cell
        case 1...3:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: String(describing: ProductCollectionViewCell.self),
                for: indexPath
            ) as! ProductCollectionViewCell
            
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: String(describing: NewsCollectionViewCell.self),
                for: indexPath
            ) as! NewsCollectionViewCell
            
            return cell
        }
    }
}


