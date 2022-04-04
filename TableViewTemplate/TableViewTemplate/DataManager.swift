//
//  DataManager.swift
//  TableViewTemplate
//
//  Created by Arken Sarsenov on 04.04.2022.
//

import UIKit

class DataManager {
    static let shared = DataManager()
    private init() {
        products = [Product(name: "iPhone 13 Pro 128Gb голубой",
                            details:"размер оперативной памяти: 6 ГБ, технология nfc: да - тип экрана: OLED, Super Retina XDR, диагональ: 6.1 дюйм, процессор: Apple A15 Bionic, объем встроенной памяти: 128 ГБ, емкость аккумулятора: 3095 мАч",
                            price: 609683, image: UIImage(named: "iPhone13")),
                    Product(name: "iPhone 13 Pro Max 256Gb голубой",
                            details: "размер оперативной памяти: 6 ГБ, технология nfc: да, тип экрана: OLED, Super Retina XDR диагональ: 6.7 дюйм, процессор: Apple A15 Bionic, объем встроенной памяти: 256 ГБ, емкость аккумулятора: 4352 мАч",
                            price: 745817, image: UIImage(named: "iPhone13max")),
                    Product(name: "iPhone 13 128Gb черный", details: "размер оперативной памяти: 4 ГБ, технология nfc: да, тип экрана: OLED, Super Retina XDR, диагональ: 6.1 дюйм, процессор: Apple A15 Bionic, объем встроенной памяти: 128 ГБ, емкость аккумулятора: 3095 мАч",
                            price: 452990, image: UIImage(named: "iPhone13Pro"))
        ]
    }
    
    var products: [Product]
}
