//
//  ErrorParser.swift
//  YPShop
//
//  Created by Yury Podkutin on 20.07.2020.
//  Copyright © 2020 Yury Podkutin. All rights reserved.
//

import Foundation

final class ErrorParser: AbstractErrorParser {
	func parse(_ result: Error) -> Error {
		return result
	}
	
	func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error? {
		return error
	}
}
