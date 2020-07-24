//
//  Catalog.swift
//  YPShop
//
//  Created by Yury Podkutin on 23.07.2020.
//  Copyright © 2020 Yury Podkutin. All rights reserved.
//

import Alamofire

final class Catalog: AbstractRequestFactory {
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

extension Catalog: CatalogRequestFactory {
	func products(pageNumber: Int,
				  categoryID: Int,
				  completionHandler: @escaping (AFDataResponse<[Product]>) -> Void) {
		let requestModel = Products(baseURL: self.baseUrl,
									pageNumber: pageNumber,
									categoryID: categoryID)
		self.request(request: requestModel, completionHandler: completionHandler)
	}
	
	func product(productID: Int,
				 completionHandler: @escaping (AFDataResponse<ProductResult>) -> Void) {
		let requestModel = ProductByID(baseURL: self.baseUrl,
								   productID: productID)
		self.request(request: requestModel, completionHandler: completionHandler)
	}
}

extension Catalog {
	struct Products: RequestRouter {
		let baseURL: URL
		let method: HTTPMethod = .get
		let path: String = "catalogData.json"
		
		let pageNumber: Int
		let categoryID: Int
		var parameters: Parameters? {
			return ["page_number": self.pageNumber, "id_category": self.categoryID]
		}
	}
	
	struct ProductByID: RequestRouter {
		let baseURL: URL
		let method: HTTPMethod = .get
		let path: String = "getGoodById.json"
		
		let productID: Int
		var parameters: Parameters? {
			return ["id_product": self.productID]
		}
	}
}
