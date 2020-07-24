//
//  AppDelegate.swift
//  YPShop
//
//  Created by Yury Podkutin on 17.07.2020.
//  Copyright © 2020 Yury Podkutin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    let requestFactory = RequestFactory()
	
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let screenFrame = UIScreen.main.bounds
        self.window = UIWindow(frame: screenFrame)
        
		let catalog = requestFactory.makeCatalogRequestFactory()
		catalog.products(pageNumber: 1, categoryID: 1) { response in
			switch response.result {
			case .success(let result):
				print(result)
			case .failure(let error):
				print(error.localizedDescription)
			}
		}
		
		catalog.product(productID: 1) { response in
			switch response.result {
			case .success(let result):
				print(result)
			case .failure(let error):
				print(error.localizedDescription)
			}
		}
		
        return true
    }
}

