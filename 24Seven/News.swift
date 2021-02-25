//
//  News.swift
//  24Seven
//
//  Created by Abdurakhmon Jamoliddinov on 2/26/21.
//

import Foundation

struct News {
    var image = ""
    var date = ""
    var title = ""
    
    static var newsSource: [News] = [
        News(image: "news1", date: "10.10.2020", title: "Теперь Microsoft рассказала всё: полный официальный видеообзор Xbox Series.."),
        News(image: "news2", date: "10.10.2020", title: "Представлен Oppo X 2021 — смартфон с растягивающимся экраном"),
        News(image: "news3", date: "10.10.2020", title: "Дизайн в стиле культового iPhone 4, OLED и мощная SoC. Долгожданный iPhone"),
        News(image: "news1", date: "10.10.2020", title: "Теперь Microsoft рассказала всё: полный официальный видеообзор Xbox Series.."),
        News(image: "news2", date: "10.10.2020", title: "Представлен Oppo X 2021 — смартфон с растягивающимся экраном"),
        News(image: "news3", date: "10.10.2020", title: "Дизайн в стиле культового iPhone 4, OLED и мощная SoC. Долгожданный iPhone"),
    ]

}

