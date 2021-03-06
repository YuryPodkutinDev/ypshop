//
//  AbstractErrorParser.swift
//  YPShop
//
//  Created by Yury Podkutin on 20.07.2020.
//  Copyright © 2020 Yury Podkutin. All rights reserved.
//

import Foundation

protocol AbstractErrorParser: AnyObject {
	func parse(_ result: Error) -> Error
	func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error?
}
