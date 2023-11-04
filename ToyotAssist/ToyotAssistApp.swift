//
//  ToyotAssistApp.swift
//  ToyotAssist
//
//  Created by Khang Nguyen on 11/4/23.
//

import SwiftUI
import SwiftData
import FirebaseCore



class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct ToyotAssistApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Report.self)

        }
    }
}
