//
//  ProductResult.swift
//  YPShop
//
//  Created by Yury Podkutin on 23.07.2020.
//  Copyright © 2020 Yury Podkutin. All rights reserved.
//

import Foundation

struct ProductResult: Codable {
	let result: Int
	let name: String
	let price: Int
	let description: String
	
	enum CodingKeys: String, CodingKey {
		case result = "result"
		case name = "product_name"
		case price = "product_price"
		case description = "product_description"
	}
}
