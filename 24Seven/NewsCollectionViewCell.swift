//
//  NewsCollectionViewCell.swift
//  24Seven
//
//  Created by Abdurakhmon Jamoliddinov on 2/25/21.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {
    
    let containerStackView: UIStackView = {
        let stackView = UIStackView(backgroundColor: .white)
        stackView.roundCorners()
        return stackView
    }()
    
    let imageContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let newsImageView: UIImageView = {
        let imageView = UIImageView(img: .news)
        imageView.roundCorners()
        return imageView
    }()
    
    let dateLabel: CustomLabel = {
        let label = CustomLabel(fontSize: 10)
        label.topInset = 8
        label.text = "10.10.2020"
        return label
    }()
    
    let titleLabel: CustomLabel = {
        let label = CustomLabel(fontSize: 12, textColor: .black)
        label.bottomInset = 16
        label.numberOfLines = 4
        label.text = "Теперь Microsoft рассказала всё: полный официальный видеообзор Xbox Series.."
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.roundCorners()
        contentView.shadow()
        contentView.addSubview(containerStackView)
        
        containerStackView.addArrangedSubview(imageContainer)
        containerStackView.addArrangedSubview(dateLabel)
        containerStackView.addArrangedSubview(titleLabel)
        containerStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        containerStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        containerStackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        containerStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        imageContainer.addSubview(newsImageView)
        newsImageView.leadingAnchor.constraint(equalTo: imageContainer.leadingAnchor).isActive = true
        newsImageView.trailingAnchor.constraint(equalTo: imageContainer.trailingAnchor).isActive = true
        newsImageView.topAnchor.constraint(equalTo: imageContainer.topAnchor).isActive = true
        newsImageView.bottomAnchor.constraint(equalTo: imageContainer.bottomAnchor).isActive = true
    }
    
    func configure(news: News) {
        newsImageView.image = UIImage(named: news.image)
        dateLabel.text = news.date
        titleLabel.text = news.title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
