//
//  AppDelegate.swift
//  PokemonList
//
//  Created by Giovanni Erpete on 26/04/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var appCoordinator : ApplicationCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        let appCoordinator = ApplicationCoordinator(window: window)
        
        self.window = window
        self.appCoordinator = appCoordinator
        appCoordinator.start()
        return true
    }


}

