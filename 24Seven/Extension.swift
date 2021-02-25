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
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 0)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.46),
                                               heightDimension: .estimated(260))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
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
        self.layer.shadowRadius = 2
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
}

class CustomLabel: UILabel {
    
    var topInset: CGFloat = 4
    var bottomInset: CGFloat = 0
    var leftInset: CGFloat = 8
    var rightInset: CGFloat = 8
    
    convenience init(fontSize: CGFloat, textColor: UIColor = .gray, weight: UIFont.Weight = .regular) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.font = UIFont.systemFont(ofSize: fontSize, weight: weight)
        self.textColor = textColor
    }
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftInset + rightInset,
                      height: size.height + topInset + bottomInset)
    }
    
    override var bounds: CGRect {
        didSet {
            // ensures this works within stack views if multi-line
            preferredMaxLayoutWidth = bounds.width - (leftInset + rightInset)
        }
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
    convenience init(backgroundColor: UIColor) {
        self.init()
        self.roundCorners()
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = .vertical
        self.alignment = .fill
        self.distribution = .fill
        self.spacing = 0
        self.backgroundColor = .white
    }
}

extension UIImageView {
    convenience init(img: UIImage, contentMode: UIView.ContentMode = .scaleToFill, backgroundColor : UIColor = .white) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
        self.image = img
        self.contentMode = contentMode
        self.backgroundColor = backgroundColor
    }
}
