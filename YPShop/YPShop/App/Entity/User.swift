//
//  User.swift
//  YPShop
//
//  Created by Yury Podkutin on 20.07.2020.
//  Copyright © 2020 Yury Podkutin. All rights reserved.
//

import Foundation

struct User: Codable {
	let id: Int
	let login: String
	let name: String
	let lastname: String
	
	enum CodingKeys: String, CodingKey {
		case id = "id_user"
		case login = "user_login"
		case name = "user_name"
		case lastname = "user_lastname"
	}
}
