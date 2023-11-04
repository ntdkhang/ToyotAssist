//
//  ReportIntent.swift
//  ToyotAssist
//
//  Created by Khang Nguyen on 11/4/23.
//

import Foundation
import AppIntents
import SwiftData

struct ReportIntent: AppIntent {
    static var title: LocalizedStringResource = "Report a problem"
    
    @Parameter(title: "Report", description: "Type of report", requestValueDialog: IntentDialog("What problem are you reporting?"))
    var report: String
    
    @Parameter(title: "License",
               description: "License plate of the vehicle",
               inputOptions: String.IntentInputOptions(autocorrect: false),
               requestValueDialog: IntentDialog("What is the license plate of the vehicle?"))
    var license: String
    
    func perform() async throws -> some IntentResult {
        let container = try ModelContainer(for: Report.self)
        let context = await container.mainContext
        context.insert(Report(reportType: report, licensePlate: license))
        return .result()
    }
}
