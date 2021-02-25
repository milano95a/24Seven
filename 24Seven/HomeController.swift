//
//  ViewController.swift
//  24Seven
//
//  Created by Abdurakhmon Jamoliddinov on 2/24/21.
//

import UIKit

class HomeController: UIViewController {
    
    let banner = 0
    let new = 1
    let popular = 2
    let onDiscount = 3
    let news = 4
    
    var newsSource: [News] = [
        News(image: "news1", date: "10.10.2020", title: "Теперь Microsoft рассказала всё: полный официальный видеообзор Xbox Series.."),
        News(image: "news2", date: "10.10.2020", title: "Представлен Oppo X 2021 — смартфон с растягивающимся экраном"),
        News(image: "news3", date: "10.10.2020", title: "Дизайн в стиле культового iPhone 4, OLED и мощная SoC. Долгожданный iPhone"),
        News(image: "news1", date: "10.10.2020", title: "Теперь Microsoft рассказала всё: полный официальный видеообзор Xbox Series.."),
        News(image: "news2", date: "10.10.2020", title: "Представлен Oppo X 2021 — смартфон с растягивающимся экраном"),
        News(image: "news3", date: "10.10.2020", title: "Дизайн в стиле культового iPhone 4, OLED и мощная SoC. Долгожданный iPhone"),
    ]
    
    var productsSource: [Product] = [
        Product(image: "product1", discount: 20, isFavourite: false, numberOfcomments: 15, name: "Яблоко Бойка", price: 8990, isNew: true, isPopular: false),
        Product(image: "product2", discount: 0, isFavourite: true, numberOfcomments: 15, name: "Груша Abate", price: 20490, isNew: true, isPopular: false),
        Product(image: "product3", discount: 20, isFavourite: false, numberOfcomments: 15, name: "Яблоко Бойка", price: 8990, isNew: true, isPopular: false),
        Product(image: "product4", discount: 0, isFavourite: true, numberOfcomments: 15, name: "Груша Abate", price: 20490, isNew: true, isPopular: false),
        
        Product(image: "product4", discount: 20, isFavourite: true, numberOfcomments: 15, name: "Яблоко Бойка", price: 8990, isNew: false, isPopular: true),
        Product(image: "product3", discount: 0, isFavourite: false, numberOfcomments: 15, name: "Груша Abate", price: 20490, isNew: false, isPopular: true),
        Product(image: "product2", discount: 20, isFavourite: true, numberOfcomments: 15, name: "Яблоко Бойка", price: 8990, isNew: false, isPopular: true),
        Product(image: "product1", discount: 0, isFavourite: false, numberOfcomments: 15, name: "Груша Abate", price: 20490, isNew: false, isPopular: true),
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
        case banner:
            return 10
        case new:
            return productsSource.filter {$0.isNew}.count
        case popular:
            return productsSource.filter {$0.isPopular}.count
        case onDiscount:
            return productsSource.filter {$0.discount > 0}.count
        case news:
            return newsSource.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case banner:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: String(describing: BannerCollectionViewCell.self),
                for: indexPath
            ) as! BannerCollectionViewCell
            
            return cell
        case new:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: String(describing: ProductCollectionViewCell.self),
                for: indexPath
            ) as! ProductCollectionViewCell
            cell.configure(with: productsSource.filter {$0.isNew}[indexPath.item])
            return cell
        case popular:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: String(describing: ProductCollectionViewCell.self),
                for: indexPath
            ) as! ProductCollectionViewCell
            cell.configure(with: productsSource.filter {$0.isPopular}[indexPath.item])
            return cell
        case onDiscount:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: String(describing: ProductCollectionViewCell.self),
                for: indexPath
            ) as! ProductCollectionViewCell
            cell.configure(with: productsSource.filter {$0.discount > 0}[indexPath.item])
            return cell
        case news:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: String(describing: NewsCollectionViewCell.self),
                for: indexPath
            ) as! NewsCollectionViewCell
            cell.configure(news: newsSource[indexPath.item])
            return cell
        default:
            return UICollectionViewCell()
        }
    }
}


