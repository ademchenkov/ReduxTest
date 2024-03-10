//
//  ProductModel.swift
//  Wolny
//
//  Created by Anton Demchenkov on 10.03.2024.
//

import Foundation

public struct Product: Hashable, Codable {
    
    let productName: String
    let image: String
    var hasSale: Bool
    let fullPrice: String
    let salePrice: String?
    let advantages: [String]
    let sizes: [ProductSize]
    let descriptions: [Description]
    
    init(
        productName: String,
        image: String,
        hasSale: Bool = false,
        fullPrice: String,
        salePrice: String?,
        advantages: [String] = [],
        sizes: [ProductSize],
        descriptions: [Description]
    ) {
        self.productName = productName
        self.image = image
        self.hasSale = hasSale
        self.fullPrice = fullPrice
        self.salePrice = salePrice
        self.advantages = advantages
        self.sizes = sizes
        self.descriptions = descriptions
    }
}

public struct ProductSize: Hashable, Codable {
    let name: String
    let inStock: Bool
}

