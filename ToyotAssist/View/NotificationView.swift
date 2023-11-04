//
//  NotificationView.swift
//  ToyotAssist
//
//  Created by Khang Nguyen on 11/4/23.
//

import SwiftUI

struct NotificationView: View {
    @StateObject private var manager = NotificationsManager()
    var body: some View {
        Button("Request Notification") {
            Task {
                await manager.request()
            }
        }
        .buttonStyle(.bordered)
        .disabled(manager.hasPermission)
        .task {
            await manager.getAuthStatus()
        }
    }
}

#Preview {
    NotificationView()
}
