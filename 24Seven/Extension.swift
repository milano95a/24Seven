//
//  Extension.swift
//  24Seven
//
//  Created by Abdurakhmon Jamoliddinov on 2/24/21.
//

import UIKit

extension NSCollectionLayoutSection {
    static func banner() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .absolute(125))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        return section
    }
    
    static func item() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 16)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.47),
                                               heightDimension: .estimated(260))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets.leading = 16
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .estimated(32)
            ),
            elementKind: String(describing: SectionHeaderCollectionReusableView.self),
            alignment: .topLeading
        )
        header.contentInsets.trailing = 16
        
        section.boundarySupplementaryItems = [
            header
        ]
        return section
    }
}

extension UIView {
    func roundCorners(radius: CGFloat = 8, corners: UIRectCorner = []) {
        if corners.isEmpty {
            self.layer.cornerRadius = radius
            
        } else {
            let size = CGSize(width: radius, height: radius)
            
            let path = UIBezierPath(
                roundedRect: self.bounds,
                byRoundingCorners: corners,
                cornerRadii: size)
            
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            
            self.layer.mask = mask
        }
    }
    
    func shadow() {
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 0.2
    }
}


extension UIColor {
    static var orange : UIColor {
        return UIColor(named: "orange")!
    }
    
    static var black: UIColor {
        return UIColor(named: "black")!
    }
    
    static var gray: UIColor {
        return UIColor(named: "grey")!
    }
    
    static var background: UIColor {
        return UIColor(named: "background")!
    }
}

extension UIImage {
    
    static var cart: UIImage {
        return UIImage(named: "Cart")!
    }
    
    static var comment: UIImage {
        return UIImage(named: "Comment")!
    }
    
    static var news: UIImage {
        return UIImage(named: "NewsPlaceholder")!
    }
    
    static var product: UIImage {
        return UIImage(named: "ProductPlaceholder")!
    }
    
    static var dheart: UIImage {
        return UIImage(named: "DHeart")!
    }
    
    static var heart: UIImage {
        return UIImage(named: "Heart")!
    }

    static var banner: UIImage {
        return UIImage(named: "BannerPlaceholder")!
    }
    
    static var _24Seven: UIImage {
        return UIImage(named: "24Seven")!
    }
    
    static var logo: UIImage {
        return UIImage(named: "Logo")!
    }
    
    static var search: UIImage {
        return UIImage(named: "Search")!
    }
    
    static var barcode: UIImage {
        return UIImage(named: "Barcode")!
    }
    
    static var voice: UIImage {
        return UIImage(named: "Mic")!
    }
    
    static var toolbarCart: UIImage {
        return UIImage(named: "ToolbarCart")!
    }
    
    static var home: UIImage {
        return UIImage(named: "Home")!
    }
    
    static var profile: UIImage {
        return UIImage(named: "Profile")!
    }
    
    static var category: UIImage {
        return UIImage(named: "Category")!
    }
}


extension NSMutableAttributedString {
    static func strikeThroughText(with text: String) -> NSMutableAttributedString {
        
        let attributeString =  NSMutableAttributedString(string: text)
        let range = NSMakeRange(0, attributeString.length)
        attributeString.addAttribute(.strikethroughStyle, value: 2, range: range)
        
        return attributeString
    }
    
    static func textStartWith(image: UIImage, text: String) -> NSMutableAttributedString {
        
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = .comment
        let attributeString = NSMutableAttributedString(attachment: imageAttachment)
        attributeString.append(NSAttributedString(string: " "))
        attributeString.append(NSAttributedString(string: text))
        
        return attributeString
    }
}

extension UIStackView {
    convenience init(backgroundColor: UIColor, axis: NSLayoutConstraint.Axis = .vertical) {
        self.init()
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = axis
        self.alignment = .fill
        self.distribution = .fill
        self.spacing = 0
        self.backgroundColor = backgroundColor
    }
}

extension UIImageView {
    convenience init(img: UIImage, contentMode: UIView.ContentMode = .scaleAspectFill, backgroundColor : UIColor = .white) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
        self.image = img
        self.contentMode = contentMode
        self.backgroundColor = backgroundColor
    }
}

extension UIView {
    var statusBarHeight: CGFloat {
        return self.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
    }
}
