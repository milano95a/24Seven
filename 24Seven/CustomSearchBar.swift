//
//  CustomSearchBar.swift
//  24Seven
//
//  Created by Abdurakhmon Jamoliddinov on 2/26/21.
//

import UIKit

class CustomSearchBar: UIStackView {

    var searchButton: UIImageView!
    var searchTextField: UITextField!
    var voiceSearchButton: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(items: [SearchBarItem]) {
        self.init()
        
//        let hStack = UIStackView(backgroundColor: .clear, axis: .horizontal)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = .horizontal
        self.distribution = .fill
        self.alignment = .center
        self.clipsToBounds = true
        self.spacing = 8
        self.backgroundColor = .clear
        self.heightAnchor.constraint(equalToConstant: 64).isActive = true
        
        let leadingSpacer = UIView()
        self.addArrangedSubview(leadingSpacer)
        leadingSpacer.translatesAutoresizingMaskIntoConstraints = false
        leadingSpacer.widthAnchor.constraint(equalToConstant: 8).isActive = true
        
        let searchControlContainer = makeSearchControl()
        self.addArrangedSubview(searchControlContainer)
        searchControlContainer.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        for item in items {
            let x = UIImageView(img: item.image, contentMode: .center, backgroundColor: .white)
            self.addArrangedSubview(x)
            x.clipsToBounds = false
            x.widthAnchor.constraint(equalToConstant: 48).isActive = true
            x.heightAnchor.constraint(equalToConstant: 48).isActive = true
            x.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
            x.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
            x.roundCorners(radius: 24)
            x.shadow()
            if let onTap = item.onTap {
                x.addGestureRecognizer(onTap)
            }
        }
//        barcodeButton = UIImageView(img: .barcode, contentMode: .center, backgroundColor: .white)
//        hStack.addArrangedSubview(barcodeButton)
//        barcodeButton.clipsToBounds = false
//        barcodeButton.widthAnchor.constraint(equalToConstant: 48).isActive = true
//        barcodeButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
//        barcodeButton.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
//        barcodeButton.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
//        barcodeButton.roundCorners(radius: 24)
//        barcodeButton.shadow()
        
//        favouriteButton = UIImageView(img: .heart, contentMode: .center, backgroundColor: .white)
//        hStack.addArrangedSubview(favouriteButton)
//        favouriteButton.clipsToBounds = false
//        favouriteButton.widthAnchor.constraint(equalToConstant: 48).isActive = true
//        favouriteButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
//        favouriteButton.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
//        favouriteButton.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
//        favouriteButton.roundCorners(radius: 24)
//        favouriteButton.shadow()
        
        let trailingSpacer = UIView()
        self.addArrangedSubview(trailingSpacer)
        trailingSpacer.translatesAutoresizingMaskIntoConstraints = false
        trailingSpacer.widthAnchor.constraint(equalToConstant: 8).isActive = true
    }
    
    private func makeSearchControl() -> UIStackView {
        let searchHStack = UIStackView(backgroundColor: .white, axis: .horizontal)
        searchHStack.clipsToBounds = false
        searchHStack.roundCorners(radius: 24)
        searchHStack.shadow()
        
        searchButton = UIImageView(img: .search, contentMode: .center, backgroundColor: .clear)
        searchHStack.addArrangedSubview(searchButton)
        searchButton.roundCorners(radius: 24)
        searchButton.widthAnchor.constraint(equalToConstant: 48).isActive = true
        
        searchTextField = UITextField()
        searchTextField.attributedPlaceholder = NSAttributedString(string: "Поиск", attributes: [NSAttributedString.Key.foregroundColor: UIColor.orange])
        
        searchHStack.addArrangedSubview(searchTextField)
        
        voiceSearchButton = UIImageView(img: .voice, contentMode: .center, backgroundColor: .clear)
        searchHStack.addArrangedSubview(voiceSearchButton)
        voiceSearchButton.roundCorners(radius: 24)
        voiceSearchButton.widthAnchor.constraint(equalToConstant: 48).isActive = true
        
        return searchHStack
    }
}

class SearchBarItem {
    var image: UIImage
    var onTap: UITapGestureRecognizer?
    
    init(image: UIImage, onTap: UITapGestureRecognizer?) {
        self.image = image
        self.onTap = onTap
    }
}
