//
//  Product.swift
//  YPShop
//
//  Created by Yury Podkutin on 23.07.2020.
//  Copyright © 2020 Yury Podkutin. All rights reserved.
//

import Foundation

struct Product: Codable {
	let id: Int
	let name: String
	let price: Int
	
	enum CodingKeys: String, CodingKey {
		case id = "id_product"
		case name = "product_name"
		case price = "price"
	}
}
