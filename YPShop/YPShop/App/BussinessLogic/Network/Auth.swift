//
//  Auth.swift
//  YPShop
//
//  Created by Yury Podkutin on 20.07.2020.
//  Copyright © 2020 Yury Podkutin. All rights reserved.
//

import Alamofire

final class Auth: AbstractRequestFactory {
	let errorParser: AbstractErrorParser
	let sessionManager: Session
	let queue: DispatchQueue
	let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
	
	init(errorParser: AbstractErrorParser,
		 sessionManager: Session,
		 queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
		self.errorParser = errorParser
		self.sessionManager = sessionManager
		self.queue = queue
	}
}

extension Auth: AuthRequestFactory {
	func login(userName: String,
			   password: String,
			   completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void) {
		let requestModel = Login(baseURL: self.baseUrl,
								 login: userName,
								 password: password)
		self.request(request: requestModel, completionHandler: completionHandler)
	}
	
	func logout(userID: Int,
				completionHandler: @escaping (AFDataResponse<EmptyResult>) -> Void) {
		let requestModel = Logout(baseURL: self.baseUrl,
								  userID: userID)
		self.request(request: requestModel, completionHandler: completionHandler)
	}
	
	func changeUserData(userID: Int,
						userName: String,
						password: String,
						email: String,
						gender: String,
						creditCard: String,
						bio: String,
						completionHandler: @escaping (AFDataResponse<EmptyResult>) -> Void) {
		let requestModel = ChangeUserData(baseURL: self.baseUrl,
										  userID: userID,
										  username: userName,
										  password: password,
										  email: email,
										  gender: gender,
										  creditCard: creditCard,
										  bio: bio)
		self.request(request: requestModel, completionHandler: completionHandler)
	}
	
	func registerUser(userID: Int,
						userName: String,
						password: String,
						email: String,
						gender: String,
						creditCard: String,
						bio: String,
						completionHandler: @escaping (AFDataResponse<RegisterUserResult>) -> Void) {
		let requestModel = RegisterUser(baseURL: self.baseUrl,
										  userID: userID,
										  username: userName,
										  password: password,
										  email: email,
										  gender: gender,
										  creditCard: creditCard,
										  bio: bio)
		self.request(request: requestModel, completionHandler: completionHandler)
	}
}

extension Auth {
	struct Login: RequestRouter {
		let baseURL: URL
		let method: HTTPMethod = .get
		let path: String = "login.json"
		
		let login: String
		let password: String
		var parameters: Parameters? {
			return ["username": self.login, "password": self.password]
		}
	}
	
	struct Logout: RequestRouter {
		let baseURL: URL
		let method: HTTPMethod = .get
		let path: String = "logout.json"
		
		let userID: Int
		var parameters: Parameters? {
			return ["id_user": self.userID]
		}
	}
	
	struct ChangeUserData: RequestRouter {
		let baseURL: URL
		let method: HTTPMethod = .get
		let path: String = "changeUserData.json"
		
		let userID: Int
		let username: String
		let password: String
		let email: String
		let gender: String
		let creditCard: String
		let bio: String
		var parameters: Parameters? {
			return ["id_user": self.userID,
					"username": self.username,
					"password": self.password,
					"email": self.email,
					"gender": self.gender,
					"credit_card": self.creditCard,
					"bio": self.bio]
		}
	}
	
	struct RegisterUser: RequestRouter {
		let baseURL: URL
		let method: HTTPMethod = .get
		let path: String = "registerUser.json"
		
		let userID: Int
		let username: String
		let password: String
		let email: String
		let gender: String
		let creditCard: String
		let bio: String
		var parameters: Parameters? {
			return ["id_user": self.userID,
					"username": self.username,
					"password": self.password,
					"email": self.email,
					"gender": self.gender,
					"credit_card": self.creditCard,
					"bio": self.bio]
		}
	}
}
