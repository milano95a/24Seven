//
//  CustomLabel.swift
//  24Seven
//
//  Created by Abdurakhmon Jamoliddinov on 2/26/21.
//

import UIKit

class CustomLabel: UILabel {
    
    var topInset: CGFloat = 4
    var bottomInset: CGFloat = 0
    var leadingInset: CGFloat = 8
    var trailingInset: CGFloat = 8
    
    convenience init(fontSize: CGFloat, textColor: UIColor = .gray, weight: UIFont.Weight = .regular) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.font = UIFont.systemFont(ofSize: fontSize, weight: weight)
        self.textColor = textColor
    }
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset, left: leadingInset, bottom: bottomInset, right: trailingInset)
        super.drawText(in: rect.inset(by: insets))
    }
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leadingInset + trailingInset,
                      height: size.height + topInset + bottomInset)
    }
    
    override var bounds: CGRect {
        didSet {
            // ensures this works within stack views if multi-line
            preferredMaxLayoutWidth = bounds.width - (leadingInset + trailingInset)
        }
    }
}
