//
//  SectionHeaderCollectionReusableView.swift
//  24Seven
//
//  Created by Abdurakhmon Jamoliddinov on 2/26/21.
//

import UIKit

class SectionHeaderCollectionReusableView: UICollectionReusableView {
    
    let label: CustomLabel = {
        let label = CustomLabel(fontSize: 16, textColor: .black, weight: .semibold)
        label.leadingInset = 0
        return label
    }()
    
    let more: CustomLabel = {
        let label = CustomLabel(fontSize: 12)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(label)
        addSubview(more)
        
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        more.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        more.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    func configure(text: String, subtitle: String, onTap: UITapGestureRecognizer?) {
        label.text = text
        more.text = subtitle
        if let onTap = onTap {
            more.isUserInteractionEnabled = true
            more.addGestureRecognizer(onTap)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

struct HeaderItem {
    var label = ""
    var more = ""
    var onTap: UITapGestureRecognizer?
}

