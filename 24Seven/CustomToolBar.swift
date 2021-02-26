//
//  CustomToolBar.swift
//  24Seven
//
//  Created by Abdurakhmon Jamoliddinov on 2/26/21.
//

import UIKit

class CustomToolBar: UIStackView {
    
    var cornerRadius: CGFloat = 16
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(items: [CustomToolbarItem]) {
        self.axis = .horizontal
        self.alignment = .fill
        self.distribution = .fillEqually
        self.backgroundColor = .black

        for item in items {
            let toolBarItem = UIImageView()
            toolBarItem.image = item.image
            toolBarItem.contentMode = .center
    
            if let onTap = item.onTap {
                toolBarItem.addGestureRecognizer(onTap)
            }
            self.addArrangedSubview(toolBarItem)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.roundCorners(radius: cornerRadius, corners: [.topLeft, .topRight])
    }
}

class CustomToolbarItem {
    var image: UIImage
    var onTap: UITapGestureRecognizer?
    
    init(image: UIImage, onTap: UITapGestureRecognizer?) {
        self.image = image
        self.onTap = onTap
    }
}

