//
//  Product.swift
//  24Seven
//
//  Created by Abdurakhmon Jamoliddinov on 2/26/21.
//

import Foundation


struct Product {
    var image = ""
    var discount = 0
    var isFavourite = false
    var numberOfcomments = 0
    var name = ""
    var price = 0
    var isNew = false
    var isPopular = false
    

    static var productsSource: [Product] = [
        Product(image: "product1", discount: 20, isFavourite: false, numberOfcomments: 15, name: "Яблоко Бойка", price: 8990, isNew: true, isPopular: false),
        Product(image: "product2", discount: 0, isFavourite: true, numberOfcomments: 15, name: "Груша Abate", price: 20490, isNew: true, isPopular: false),
        Product(image: "product3", discount: 20, isFavourite: false, numberOfcomments: 15, name: "Яблоко Бойка", price: 8990, isNew: true, isPopular: false),
        Product(image: "product4", discount: 0, isFavourite: true, numberOfcomments: 15, name: "Груша Abate", price: 20490, isNew: true, isPopular: false),
        Product(image: "product4", discount: 20, isFavourite: true, numberOfcomments: 15, name: "Яблоко Бойка", price: 8990, isNew: false, isPopular: true),
        Product(image: "product3", discount: 0, isFavourite: false, numberOfcomments: 15, name: "Груша Abate", price: 20490, isNew: false, isPopular: true),
        Product(image: "product2", discount: 20, isFavourite: true, numberOfcomments: 15, name: "Яблоко Бойка", price: 8990, isNew: false, isPopular: true),
        Product(image: "product1", discount: 0, isFavourite: false, numberOfcomments: 15, name: "Груша Abate", price: 20490, isNew: false, isPopular: true),
    ]

}
