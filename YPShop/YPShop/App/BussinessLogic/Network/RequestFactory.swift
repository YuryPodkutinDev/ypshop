//
//  RequestFactory.swift
//  YPShop
//
//  Created by Yury Podkutin on 20.07.2020.
//  Copyright © 2020 Yury Podkutin. All rights reserved.
//

import Alamofire

final class RequestFactory {
	func makeErrorParser() -> AbstractErrorParser {
		return ErrorParser()
	}
	
	lazy var commonSession: Session = {
		let config = URLSessionConfiguration.default
		config.httpShouldSetCookies = false
		config.headers = .default
		let manager = Session(configuration: config)
		return manager
	}()
	
	let sessionQueue = DispatchQueue.global(qos: .utility)
	
	func makeAuthRequestFactory() -> AuthRequestFactory {
		let errorParser = self.makeErrorParser()
		return Auth(errorParser: errorParser,
					sessionManager: self.commonSession,
					queue: self.sessionQueue)
	}
	
	func makeCatalogRequestFactory() -> CatalogRequestFactory {
		let errorParser = self.makeErrorParser()
		return Catalog(errorParser: errorParser,
					   sessionManager: self.commonSession,
					   queue: self.sessionQueue)
	}
}
