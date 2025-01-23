//
//  PFCTrackerApp.swift
//  PFCTracker
//
//  Created by 仲村士苑 on 2025/01/15.
//

import SwiftUI

@main
struct PFCTrackerApp: App {
    @StateObject var listViewModel:ListViewModel = ListViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                PfcFirstPageView()
            }
            .environmentObject(listViewModel)
        }
    }
}
