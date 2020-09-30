//
//  AppDelegate.swift
//  ToDoApp
//
//  Created by Калинин Антон Игоревич on 18.09.2020.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        #if targetEnvironment(simulator)
        if CommandLine.arguments.contains(" --UITesting") {
            resetState()
        }
        #endif
        
        return true
    }
    
    private func resetState() {
        guard let documentPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first,
              let url = URL(string: "\(documentPath)tasks.plist") else { return }
        
        let fileManager = FileManager.default
        try? fileManager.removeItem(at: url)
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    
}

