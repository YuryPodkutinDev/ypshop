//
//  LoginResult.swift
//  YPShop
//
//  Created by Yury Podkutin on 20.07.2020.
//  Copyright © 2020 Yury Podkutin. All rights reserved.
//

import Foundation

struct LoginResult: Codable {
	let result: Int
	let user: User
}
