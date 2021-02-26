//
//  ViewController.swift
//  24Seven
//
//  Created by Abdurakhmon Jamoliddinov on 2/24/21.
//

import UIKit

let TOOLBAR_SIZE: CGFloat = 80

struct Sections {
    static let banner = 0
    static let new = 1
    static let popular = 2
    static let onDiscount = 3
    static let news = 4
}

class HomeController: CustomCollectionViewController {
    
    var productsSource = Product.productsSource
    var newsSource = News.newsSource
    
    override func delegate() -> CustomCollectionViewControllerDelegate {
        return self
    }
    
    override func addCollectionViewToScreen() {
        view.backgroundColor = .background
        
        let vContainer = UIStackView(backgroundColor: .clear)
        view.addSubview(vContainer)
        
        vContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        vContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        vContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        vContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        vContainer.spacing = 4
        
        let logo = UIImageView(img: .logo, contentMode: .center, backgroundColor: .clear)
        vContainer.addArrangedSubview(logo)
        
        let searchBar = CustomSearchBar(items: [
            SearchBarItem(image: .barcode, onTap: nil),
            SearchBarItem(image: .heart, onTap: nil),
        ])
        vContainer.addArrangedSubview(searchBar)
        
        vContainer.addArrangedSubview(collectionView)
        
        let toolbar = CustomToolBar()
        toolbar.configure(items: [
            CustomToolbarItem(image: .home, onTap: nil),
            CustomToolbarItem(image: .category, onTap: nil),
            CustomToolbarItem(image: .toolbarCart, onTap: nil),
            CustomToolbarItem(image: .profile, onTap: nil)
        ])
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        toolbar.heightAnchor.constraint(equalToConstant: TOOLBAR_SIZE).isActive = true
        vContainer.addArrangedSubview(toolbar)
    }
}

extension HomeController: CustomCollectionViewControllerDelegate {
    func layout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvronment in
            switch sectionIndex {
            case Sections.banner:
                return NSCollectionLayoutSection.banner()
            case Sections.new, Sections.popular, Sections.onDiscount, Sections.news:
                return NSCollectionLayoutSection.item()
            default:
                return nil
            }
        }
        return layout
    }
    
    func collectionViewDelegate() -> UICollectionViewDelegate {
        return self
    }
    
    func collectionViewDataSource() -> UICollectionViewDataSource {
        return self
    }
    
    func registerCells() -> [AnyClass] {
        return [BannerCollectionViewCell.self, ProductCollectionViewCell.self, NewsCollectionViewCell.self]
    }
    
    func registerHeaders() -> [AnyClass] {
        return [SectionHeaderCollectionReusableView.self]
    }
}

extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case Sections.banner:
            return 10
        case Sections.new:
            return productsSource.filter {$0.isNew}.count
        case Sections.popular:
            return productsSource.filter {$0.isPopular}.count
        case Sections.onDiscount:
            return productsSource.filter {$0.discount > 0}.count
        case Sections.news:
            return newsSource.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case Sections.banner:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: String(describing: BannerCollectionViewCell.self),
                for: indexPath
            ) as! BannerCollectionViewCell
            
            return cell
        case Sections.new:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: String(describing: ProductCollectionViewCell.self),
                for: indexPath
            ) as! ProductCollectionViewCell
            cell.configure(with: productsSource.filter {$0.isNew}[indexPath.item])
            return cell
        case Sections.popular:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: String(describing: ProductCollectionViewCell.self),
                for: indexPath
            ) as! ProductCollectionViewCell
            cell.configure(with: productsSource.filter {$0.isPopular}[indexPath.item])
            return cell
        case Sections.onDiscount:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: String(describing: ProductCollectionViewCell.self),
                for: indexPath
            ) as! ProductCollectionViewCell
            cell.configure(with: productsSource.filter {$0.discount > 0}[indexPath.item])
            return cell
        case Sections.news:
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
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch indexPath.section {
        case Sections.new:
            let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: String(describing: SectionHeaderCollectionReusableView.self),
                for: indexPath
            ) as! SectionHeaderCollectionReusableView
            
            header.configure(text: "Новые товары", subtitle: "Посмотреть все", onTap: nil)
            return header
        case Sections.popular:
            let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: String(describing: SectionHeaderCollectionReusableView.self),
                for: indexPath
            ) as! SectionHeaderCollectionReusableView
            
            header.configure(text: "Популярные товары", subtitle: "Посмотреть все", onTap: nil)
            return header
        case Sections.onDiscount:
            let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: String(describing: SectionHeaderCollectionReusableView.self),
                for: indexPath
            ) as! SectionHeaderCollectionReusableView
            
            header.configure(text: "Скидки", subtitle: "Посмотреть все", onTap: nil)
            return header
        case Sections.news:
            let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: String(describing: SectionHeaderCollectionReusableView.self),
                for: indexPath
            ) as! SectionHeaderCollectionReusableView
            
            header.configure(text: "Новости и акции", subtitle: "Посмотреть все", onTap: nil)
            return header
        default:
            return UICollectionReusableView()
        }
    }
}
