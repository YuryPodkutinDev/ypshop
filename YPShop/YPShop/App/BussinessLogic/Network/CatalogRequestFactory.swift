//
//  CatalogRequestFactory.swift
//  YPShop
//
//  Created by Yury Podkutin on 23.07.2020.
//  Copyright © 2020 Yury Podkutin. All rights reserved.
//

import Alamofire

protocol CatalogRequestFactory: AnyObject {
	func products(pageNumber: Int,
				  categoryID: Int,
				  completionHandler: @escaping (AFDataResponse<[Product]>) -> Void)
	
	func product(productID: Int,
				 completionHandler: @escaping (AFDataResponse<ProductResult>) -> Void)
}
