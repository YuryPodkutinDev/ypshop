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
        
		let auth = requestFactory.makeAuthRequestFactory()
		auth.login(userName: "Login", password: "Password") { response in
			switch response.result {
			case .success(let result):
				print("----Login---------------------------------\n\(result)")
			case .failure(let error):
				print(error.localizedDescription)
			}
		}
		
		auth.logout(userID: 1) { response in
			switch response.result {
			case .success(let result):
				print("----Logout---------------------------------\n\(result)")
			case .failure(let error):
				print(error.localizedDescription)
			}
		}
		
		auth.changeUserData(userID: 1,
							userName: "Name",
							password: "Password",
							email: "Email",
							gender: "m",
							creditCard: "23478567236583",
							bio: "Somebody") { response in
			switch response.result {
			case .success(let result):
				print("----ChangeData---------------------------------\n\(result)")
			case .failure(let error):
				print(error.localizedDescription)
			}
		}
		
		auth.registerUser(userID: 1,
							userName: "Name",
							password: "Password",
							email: "Email",
							gender: "m",
							creditCard: "23478567236583",
							bio: "Somebody") { response in
			print()
			switch response.result {
			case .success(let result):
				print("----Register---------------------------------\n\(result)")
			case .failure(let error):
				print(error.localizedDescription)
			}
		}
		
        return true
    }
}

