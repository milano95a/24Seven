//
//  ProductCollectionViewCell.swift
//  24Seven
//
//  Created by Abdurakhmon Jamoliddinov on 2/25/21.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    let imageContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        return view
    }()

    let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "ProductPlaceholder")
        return imageView
    }()
    
    let discountLabel: CustomLabel = {
        let label = CustomLabel(fontSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "-20%"
        label.backgroundColor = .orange
        label.textColor = .white
        return label
    }()

    let heartImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "DHeart")
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
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = .cart
        imageView.backgroundColor = .black
        imageView.contentMode = .center
        imageView.roundCorners(radius: 16)
        imageView.shadow()
        return imageView
    }()
    
    let containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.roundCorners()
        stackView.clipsToBounds = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 0
        stackView.backgroundColor = .white
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.roundCorners()
        contentView.shadow()
        contentView.addSubview(containerStackView)
        contentView.addSubview(cartImageView)
        
        cartImageView.widthAnchor.constraint(equalToConstant: 36).isActive = true
        cartImageView.heightAnchor.constraint(equalToConstant: 36).isActive = true
        cartImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        cartImageView.centerYAnchor.constraint(equalTo: contentView.topAnchor, constant: 160).isActive = true

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

        imageContainer.addSubview(productImageView)
        
        productImageView.leadingAnchor.constraint(equalTo: imageContainer.leadingAnchor).isActive = true
        productImageView.trailingAnchor.constraint(equalTo: imageContainer.trailingAnchor).isActive = true
        productImageView.topAnchor.constraint(equalTo: imageContainer.topAnchor).isActive = true
        productImageView.bottomAnchor.constraint(equalTo: imageContainer.bottomAnchor).isActive = true
        
        imageContainer.addSubview(discountLabel)
        imageContainer.addSubview(heartImageView)
        
        discountLabel.leadingAnchor.constraint(equalTo: imageContainer.leadingAnchor).isActive = true
        discountLabel.topAnchor.constraint(equalTo: imageContainer.topAnchor).isActive = true
        heartImageView.topAnchor.constraint(equalTo: imageContainer.topAnchor, constant: 8).isActive = true
        heartImageView.trailingAnchor.constraint(equalTo: imageContainer.trailingAnchor, constant: -8).isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        discountLabel.round(corners: [.topLeft, .bottomRight], radius: 8)
        cartImageView.roundCorners(radius: cartImageView.frame.height / 2)
        cartImageView.shadow()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
