//
//  ViewController.swift
//  24Seven
//
//  Created by Abdurakhmon Jamoliddinov on 2/24/21.
//

import UIKit

let LOGO_SIZE: CGFloat = 48
let TOOLBAR_SIZE: CGFloat = 80

class HomeController: UIViewController {
    
    let banner = 0
    let new = 1
    let popular = 2
    let onDiscount = 3
    let news = 4
        
    let newHeader = Header(label: "Новые товары", more: "Посмотреть все")
    let popularHeader = Header(label: "Популярные товары", more: "Посмотреть все")
    let onDiscountHeader = Header(label: "Скидки", more: "Посмотреть все")
    let newsHeader = Header(label: "Новости и акции", more: "Посмотреть все")
    
    var productsSource = Product.productsSource
    var newsSource = News.newsSource

    var vStackView: UIStackView!
    var collectionView: UICollectionView!
    
    var searchButton: UIImageView!
    var searchTextField: UITextField!
    var voiceSearchButton: UIImageView!
    var barcodeButton: UIImageView!
    var favouriteButton: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        
        vStackView = UIStackView(backgroundColor: .clear)
        view.addSubview(vStackView)
        
        vStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        vStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        vStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        vStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        vStackView.spacing = 4
        setUpContentLayout()
        
        let toolbar = CustomToolBar()
        toolbar.configure(items: [
            CustomToolbarItem(image: .home, onTap: nil),
            CustomToolbarItem(image: .category, onTap: nil),
            CustomToolbarItem(image: .toolbarCart, onTap: nil),
            CustomToolbarItem(image: .profile, onTap: nil)
        ])
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        toolbar.heightAnchor.constraint(equalToConstant: TOOLBAR_SIZE).isActive = true
        
        vStackView.addArrangedSubview(toolbar)
    }
    
    private func setUpContentLayout(){
        
        let logoContainer = UIView()
        vStackView.addArrangedSubview(logoContainer)
        logoContainer.translatesAutoresizingMaskIntoConstraints = false
        logoContainer.heightAnchor.constraint(equalToConstant: LOGO_SIZE).isActive = true
        
        let logoHStack = UIStackView(backgroundColor: .clear, axis: .horizontal)
        logoContainer.addSubview(logoHStack)
        logoHStack.spacing = 8
        logoHStack.centerXAnchor.constraint(equalTo: logoContainer.centerXAnchor).isActive = true
        logoHStack.centerYAnchor.constraint(equalTo: logoContainer.centerYAnchor).isActive = true
        
        let logo = UIImageView(img: .logo, contentMode: .center, backgroundColor: .clear)
        logoHStack.addArrangedSubview(logo)
        
        let _24Seven = UIImageView(img: ._24Seven, contentMode: .center, backgroundColor: .clear)
        logoHStack.addArrangedSubview(_24Seven)
        
        makeNavBar()
        
        setupCollectionView()
        vStackView.addArrangedSubview(collectionView)

    }
    
    private func makeNavBar() {
        let hStack = UIStackView(backgroundColor: .clear, axis: .horizontal)
        vStackView.addArrangedSubview(hStack)
        hStack.heightAnchor.constraint(equalToConstant: 64).isActive = true
        hStack.alignment = .center
        hStack.spacing = 8
        
        let leadingSpacer = UIView()
        hStack.addArrangedSubview(leadingSpacer)
        leadingSpacer.translatesAutoresizingMaskIntoConstraints = false
        leadingSpacer.widthAnchor.constraint(equalToConstant: 8).isActive = true
        
        let searchControlContainer = makeSearchControl()
        hStack.addArrangedSubview(searchControlContainer)
        searchControlContainer.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        barcodeButton = UIImageView(img: .barcode, contentMode: .center, backgroundColor: .white)
        hStack.addArrangedSubview(barcodeButton)
        barcodeButton.clipsToBounds = false
        barcodeButton.widthAnchor.constraint(equalToConstant: 48).isActive = true
        barcodeButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        barcodeButton.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        barcodeButton.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        barcodeButton.roundCorners(radius: 24)
        barcodeButton.shadow()
        
        favouriteButton = UIImageView(img: .heart, contentMode: .center, backgroundColor: .white)
        hStack.addArrangedSubview(favouriteButton)
        favouriteButton.clipsToBounds = false
        favouriteButton.widthAnchor.constraint(equalToConstant: 48).isActive = true
        favouriteButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        favouriteButton.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        favouriteButton.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        favouriteButton.roundCorners(radius: 24)
        favouriteButton.shadow()
        
        let trailingSpacer = UIView()
        hStack.addArrangedSubview(trailingSpacer)
        trailingSpacer.translatesAutoresizingMaskIntoConstraints = false
        trailingSpacer.widthAnchor.constraint(equalToConstant: 8).isActive = true
    }
    
    private func makeSearchControl() -> UIStackView {
        let searchHStack = UIStackView(backgroundColor: .white, axis: .horizontal)
        searchHStack.clipsToBounds = false
        searchHStack.roundCorners(radius: 24)
        searchHStack.shadow()
        
        searchButton = UIImageView(img: .search, contentMode: .center, backgroundColor: .clear)
        searchHStack.addArrangedSubview(searchButton)
        searchButton.roundCorners(radius: 24)
        searchButton.widthAnchor.constraint(equalToConstant: 48).isActive = true

        searchTextField = UITextField()
        searchTextField.attributedPlaceholder = NSAttributedString(string: "Поиск", attributes: [NSAttributedString.Key.foregroundColor: UIColor.orange])
        
        searchHStack.addArrangedSubview(searchTextField)
        
        voiceSearchButton = UIImageView(img: .voice, contentMode: .center, backgroundColor: .clear)
        searchHStack.addArrangedSubview(voiceSearchButton)
        voiceSearchButton.roundCorners(radius: 24)
        voiceSearchButton.widthAnchor.constraint(equalToConstant: 48).isActive = true

        return searchHStack
    }
    
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: configureLayout())
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
        collectionView.register(SectionHeaderCollectionReusableView.self, forSupplementaryViewOfKind: String(describing: SectionHeaderCollectionReusableView.self), withReuseIdentifier: String(describing: SectionHeaderCollectionReusableView.self))
        
        collectionView.backgroundColor = .clear
    }
    
    private func configureLayout() -> UICollectionViewCompositionalLayout {
        
        let layout = UICollectionViewCompositionalLayout { [weak self] sectionIndex, layoutEnvronment in
            switch sectionIndex {
            case self?.banner:
                return NSCollectionLayoutSection.banner()
            case self?.new, self?.popular, self?.onDiscount, self?.news:
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
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch indexPath.section {
        case new:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: String(describing: SectionHeaderCollectionReusableView.self), for: indexPath) as! SectionHeaderCollectionReusableView
            
            header.configure(header: newHeader)
            return header
        case popular:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: String(describing: SectionHeaderCollectionReusableView.self), for: indexPath) as! SectionHeaderCollectionReusableView
            
            header.configure(header: popularHeader)
            return header
        case onDiscount:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: String(describing: SectionHeaderCollectionReusableView.self), for: indexPath) as! SectionHeaderCollectionReusableView
            
            header.configure(header: onDiscountHeader)
            return header
        case news:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: String(describing: SectionHeaderCollectionReusableView.self), for: indexPath) as! SectionHeaderCollectionReusableView
            
            header.configure(header: newsHeader)
            return header
        default:
            return UICollectionReusableView()
        }
    }
}
