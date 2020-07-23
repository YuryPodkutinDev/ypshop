//
//  AuthRequestFactory.swift
//  YPShop
//
//  Created by Yury Podkutin on 20.07.2020.
//  Copyright © 2020 Yury Podkutin. All rights reserved.
//

import Alamofire

protocol AuthRequestFactory: AnyObject {
	func login(userName: String,
			   password: String,
			   completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void)
	
	func logout(userID: Int,
				completionHandler: @escaping (AFDataResponse<EmptyResult>) -> Void)
	
	func changeUserData(userID: Int,
						userName: String,
						password: String,
						email: String,
						gender: String,
						creditCard: String,
						bio: String,
						completionHandler: @escaping (AFDataResponse<EmptyResult>) -> Void)
	
	func registerUser(userID: Int,
					  userName: String,
					  password: String,
					  email: String,
					  gender: String,
					  creditCard: String,
					  bio: String,
					  completionHandler: @escaping (AFDataResponse<RegisterUserResult>) -> Void)
}
