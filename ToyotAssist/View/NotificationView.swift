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
        VStack {
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
            
            
            Button("Send test noti") {
                let notifPayload: [String: Any] = ["to": "cYhuWr-Dw03ilb8IE2voSn:APA91bG9xPp8MTv3DqwnDC2eYuVsxUH4xyC_NmpgUw20qa66CmfC1LeUu7UukV9ZnwExlEA6j9hZJtnELdwO8VxZbjthSmd9o6HcCBH5kon_xzWL0OGEahHa9nzUYhh8sgn6Y-a9rI6Y","notification": ["title":"You got a new meassage.","body":"This message is sent for you","badge":1,"sound":"default"]]
                manager.sendPushNotification(payloadDict: notifPayload)
            }
        }
    }
}

#Preview {
    NotificationView()
}
