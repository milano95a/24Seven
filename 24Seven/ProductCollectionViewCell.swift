//
//  ProductCollectionViewCell.swift
//  24Seven
//
//  Created by Abdurakhmon Jamoliddinov on 2/25/21.
//

import UIKit


class ProductCollectionViewCell: UICollectionViewCell {
    
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

    let productImageView: UIImageView = {
        let imageView = UIImageView(img: .product)
        return imageView
    }()
    
    let discountLabel: CustomLabel = {
        let label = CustomLabel(fontSize: 12, textColor: .white)
        label.backgroundColor = .orange
        label.bottomInset = 4
        label.text = "-20%"
        return label
    }()

    let heartImageView: UIImageView = {
        let imageView = UIImageView(img: .dheart)
        return imageView
    }()
    
    let commentLabel: CustomLabel = {
        let label = CustomLabel(fontSize: 12)
        label.attributedText = NSMutableAttributedString.textStartWith(image: .comment, text: "Oтзыв (15)")
        return label
    }()

    let categoryLabel: CustomLabel = {
        let label = CustomLabel(fontSize: 12)
        label.text = "Фрукты"
        return label
    }()
    
    let productNameLabel: CustomLabel = {
        let label = CustomLabel(fontSize: 14, textColor: .black, weight: .bold)
        label.topInset = 0
        label.text = "Яблоко Бойка"
        return label
    }()
    
    let oldPriceLabel: CustomLabel = {
        let label = CustomLabel(fontSize: 12, textColor: .orange)
        label.attributedText = NSMutableAttributedString.strikeThroughText(with: "8 990 сум")
        return label
    }()
    
    let currentPriceLabel: CustomLabel = {
        let label = CustomLabel(fontSize: 14, textColor: .black, weight: .bold)
        label.textAlignment = .right
        label.bottomInset = 8
        label.text = "7 490 сум за кг"
        return label
    }()
        
    let cartImageView: UIImageView = {
        let imageView = UIImageView(img: .cart, contentMode: .center, backgroundColor: .black)
        imageView.roundCorners(radius: 16)
        imageView.shadow()
        return imageView
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.roundCorners()
        contentView.shadow()
        contentView.addSubview(containerStackView)
        contentView.addSubview(cartImageView)
        
        containerStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        containerStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        containerStackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        containerStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        containerStackView.addArrangedSubview(imageContainer)
        containerStackView.addArrangedSubview(commentLabel)
        containerStackView.addArrangedSubview(categoryLabel)
        containerStackView.addArrangedSubview(productNameLabel)
        containerStackView.addArrangedSubview(oldPriceLabel)
        containerStackView.addArrangedSubview(currentPriceLabel)

        cartImageView.widthAnchor.constraint(equalToConstant: 36).isActive = true
        cartImageView.heightAnchor.constraint(equalToConstant: 36).isActive = true
        cartImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        cartImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: contentView.frame.height / 2).isActive = true

        imageContainer.addSubview(productImageView)
        imageContainer.addSubview(discountLabel)
        imageContainer.addSubview(heartImageView)

        productImageView.leadingAnchor.constraint(equalTo: imageContainer.leadingAnchor).isActive = true
        productImageView.trailingAnchor.constraint(equalTo: imageContainer.trailingAnchor).isActive = true
        productImageView.topAnchor.constraint(equalTo: imageContainer.topAnchor).isActive = true
        productImageView.bottomAnchor.constraint(equalTo: imageContainer.bottomAnchor).isActive = true
        
        discountLabel.leadingAnchor.constraint(equalTo: imageContainer.leadingAnchor).isActive = true
        discountLabel.topAnchor.constraint(equalTo: imageContainer.topAnchor).isActive = true
        heartImageView.topAnchor.constraint(equalTo: imageContainer.topAnchor, constant: 8).isActive = true
        heartImageView.trailingAnchor.constraint(equalTo: imageContainer.trailingAnchor, constant: -8).isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        discountLabel.roundCorners(radius: 8, corners: [.topLeft, .bottomRight])
        cartImageView.roundCorners(radius: cartImageView.frame.height / 2)
    }
        
    func configure(with product: Product) {
        productImageView.image = UIImage(named: product.image)
        discountLabel.text = "-\(product.discount)%"
        discountLabel.isHidden = product.discount == 0
        let heartImage = product.isFavourite ? "Heart" : "DHeart"
        heartImageView.image = UIImage(named: heartImage)
        let commentText = "Oтзыв (\(product.numberOfcomments))"
        commentLabel.attributedText = NSMutableAttributedString.textStartWith(image: .comment, text: commentText)
        productNameLabel.text = product.name
        let attributedText = product.discount == 0 ? NSMutableAttributedString(string: " ") : NSMutableAttributedString.strikeThroughText(with: "\(product.price) сум")
        oldPriceLabel.attributedText = attributedText
        let newPrice = product.price * (100 - product.discount)/100
        currentPriceLabel.text = "\(newPrice) сум за кг"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

