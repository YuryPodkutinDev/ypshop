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
	let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/response/")!
	
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
}
