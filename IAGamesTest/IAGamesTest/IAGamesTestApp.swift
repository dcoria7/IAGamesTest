//
//  IAGamesTestApp.swift
//  IAGamesTest
//
//  Created by DC on 07/01/25.
//

import SwiftUI
import SwiftData

class AppDelegate: NSObject, UIApplicationDelegate {
	func application(_ application: UIApplication,
					 didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
		
		return true
	}
}

@main
struct IAGamesTestApp: App {
	@UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
	@StateObject private var appRootManager = AppRootManager()
	let dependency = DependencyContainer()
	
    var body: some Scene {
		WindowGroup {
			Group {
				switch appRootManager.currentRoot {
					case .splash:
						InitView(viewModel: InitViewModel(dependency: dependency))
						
					case .home:
						HomeView()
				}
			}
			.environmentObject(appRootManager)
			.environmentObject(dependency)
		}
    }
}
