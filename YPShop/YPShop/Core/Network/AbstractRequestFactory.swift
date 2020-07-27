//
//  AbstractRequestFactory.swift
//  YPShop
//
//  Created by Yury Podkutin on 20.07.2020.
//  Copyright © 2020 Yury Podkutin. All rights reserved.
//

import Alamofire

protocol AbstractRequestFactory: AnyObject {
	var errorParser: AbstractErrorParser { get }
	var sessionManager: Session { get }
	var queue: DispatchQueue { get }
	
	@discardableResult
	func request<T: Decodable>(request: URLRequestConvertible,
							   completionHandler: @escaping (AFDataResponse<T>) ->Void) -> DataRequest
}

extension AbstractRequestFactory {
	@discardableResult
	public func request<T: Decodable>(request: URLRequestConvertible,
									  completionHandler: @escaping (AFDataResponse<T>) -> Void) ->DataRequest {
		return sessionManager
			.request(request)
			.responseCodable(errorParser: errorParser,
							 queue: queue,
							 completionHandler: completionHandler)
	}
}
