//
//  SofaScoreAcademyApp.swift
//  SofaScoreAcademy
//
//  Created by Matija Kruljac on 05.03.2021..
//

import SwiftUI

@main
struct SofaScoreAcademyApp: App {
    
    @Environment(\.scenePhase) var scenePhase
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject private var viewModel: LoginViewModel
    
    var body: some Scene {
        WindowGroup {
            if viewModel.isLoggedIn {
                TeamsView()
            } else {
                LoginView()
            }
        }.onChange(of: scenePhase) { newScenePhase in
            switch scenePhase {
            case .background:
                print("App state: background")
            case .inactive:
                print("App state: inactive")
            case .active:
                print("App state: active")
                UIApplication.shared.applicationIconBadgeNumber = 0
            @unknown default:
                print("App state: unknown")
            }
        }
    }
    
    init() {
        print("App state: init")
        _viewModel = StateObject(wrappedValue: LoginViewModel.shared)
    }
}
