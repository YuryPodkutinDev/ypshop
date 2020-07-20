//
//  RequestRouter.swift
//  YPShop
//
//  Created by Yury Podkutin on 20.07.2020.
//  Copyright © 2020 Yury Podkutin. All rights reserved.
//

import Alamofire

enum RequestRouterEncoding {
	case url, json
}

protocol RequestRouter: URLRequestConvertible {
	var baseURL: URL { get }
	var method: HTTPMethod { get }
	var path: String { get }
	var parameters: Parameters? { get }
	var fullURL: URL { get }
	var encoding: RequestRouterEncoding { get }
}

extension RequestRouter {
	var fullURL: URL {
		return self.baseURL.appendingPathComponent(path)
	}
	
	var encoding: RequestRouterEncoding {
		return .url
	}
	
	func asURLRequest() throws -> URLRequest {
		var urlRequest = URLRequest(url: self.fullURL)
		urlRequest.httpMethod = self.method.rawValue
		
		switch self.encoding {
		case .url:
			return try URLEncoding.default.encode(urlRequest, with: self.parameters)
		case .json:
			return try JSONEncoding.default.encode(urlRequest, with: self.parameters)
		}
	}
}
