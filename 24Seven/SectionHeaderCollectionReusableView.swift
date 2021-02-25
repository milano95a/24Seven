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
    
    func configure(header: Header) {
        label.text = header.label
        more.text = header.more
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

struct Header {
    var label = ""
    var more = ""
}

