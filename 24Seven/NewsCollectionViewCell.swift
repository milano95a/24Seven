//
//  NewsCollectionViewCell.swift
//  24Seven
//
//  Created by Abdurakhmon Jamoliddinov on 2/25/21.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {
    let newsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "NewsPlaceholder")
        imageView.clipsToBounds = true
        imageView.roundCorners()
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(newsImageView)
        contentView.roundCorners()
        contentView.shadow()
        
        NSLayoutConstraint.activate([
            newsImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            newsImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            newsImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            newsImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
