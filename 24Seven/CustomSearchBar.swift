//
//  CustomSearchBar.swift
//  24Seven
//
//  Created by Abdurakhmon Jamoliddinov on 2/26/21.
//

import UIKit

class CustomSearchBar: UIStackView {

    var SEARCHBAR_HEIGHT : CGFloat = 64
    var SEARCHBAR_BUTTON_HEIGHT: CGFloat = 48
    var DEFAULT_SPACING : CGFloat = 8
    
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
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = .horizontal
        self.distribution = .fill
        self.alignment = .center
        self.clipsToBounds = true
        self.spacing = DEFAULT_SPACING
        self.backgroundColor = .clear
        self.heightAnchor.constraint(equalToConstant: SEARCHBAR_HEIGHT).isActive = true
        
        let leadingSpacer = UIView()
        self.addArrangedSubview(leadingSpacer)
        leadingSpacer.translatesAutoresizingMaskIntoConstraints = false
        leadingSpacer.widthAnchor.constraint(equalToConstant: DEFAULT_SPACING).isActive = true
        
        let searchControlContainer = makeSearchControl()
        self.addArrangedSubview(searchControlContainer)
        searchControlContainer.heightAnchor.constraint(equalToConstant: SEARCHBAR_BUTTON_HEIGHT).isActive = true
        
        for item in items {
            let x = UIImageView(img: item.image, contentMode: .center, backgroundColor: .white)
            self.addArrangedSubview(x)
            x.clipsToBounds = false
            x.widthAnchor.constraint(equalToConstant: SEARCHBAR_BUTTON_HEIGHT).isActive = true
            x.heightAnchor.constraint(equalToConstant: SEARCHBAR_BUTTON_HEIGHT).isActive = true
            x.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
            x.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
            x.roundCorners(radius: SEARCHBAR_BUTTON_HEIGHT / 2)
            x.shadow()
            if let onTap = item.onTap {
                x.addGestureRecognizer(onTap)
            }
        }
        
        let trailingSpacer = UIView()
        self.addArrangedSubview(trailingSpacer)
        trailingSpacer.translatesAutoresizingMaskIntoConstraints = false
        trailingSpacer.widthAnchor.constraint(equalToConstant: DEFAULT_SPACING).isActive = true
    }
    
    private func makeSearchControl() -> UIStackView {
        let searchContainer = UIStackView(backgroundColor: .white, axis: .horizontal)
        searchContainer.clipsToBounds = false
        searchContainer.roundCorners(radius: SEARCHBAR_BUTTON_HEIGHT / 2)
        searchContainer.shadow()
        
        searchButton = UIImageView(img: .search, contentMode: .center, backgroundColor: .clear)
        searchContainer.addArrangedSubview(searchButton)
        searchButton.roundCorners(radius: SEARCHBAR_BUTTON_HEIGHT / 2)
        searchButton.widthAnchor.constraint(equalToConstant: SEARCHBAR_BUTTON_HEIGHT).isActive = true
        
        searchTextField = UITextField()
        searchTextField.attributedPlaceholder = NSAttributedString(string: "Поиск", attributes: [NSAttributedString.Key.foregroundColor: UIColor.orange])
        
        searchContainer.addArrangedSubview(searchTextField)
        
        voiceSearchButton = UIImageView(img: .voice, contentMode: .center, backgroundColor: .clear)
        searchContainer.addArrangedSubview(voiceSearchButton)
        voiceSearchButton.roundCorners(radius: SEARCHBAR_BUTTON_HEIGHT / 2)
        voiceSearchButton.widthAnchor.constraint(equalToConstant: SEARCHBAR_BUTTON_HEIGHT).isActive = true
        
        return searchContainer
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
