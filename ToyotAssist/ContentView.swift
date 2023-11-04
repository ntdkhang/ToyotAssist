//
//  ContentView.swift
//  ToyotAssist
//
//  Created by Khang Nguyen on 11/4/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var reports: [Report]
    var body: some View {
        NavigationView {
            VStack {
                ForEach(reports) { report in
                    VStack {
                        Text(report.reportType)
                        Text(report.licensePlate)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading, content: {
                    Button("Delete All") {
                        reloadSampleData()
                    }
                })
                ToolbarItem(placement: .topBarLeading) {
                    Button("Add sample") {
                        addSamples()
                    }
                }
            }
            .padding()
            
        }
    }
    
    func reloadSampleData() {
        do {
            try modelContext.delete(model: Report.self)
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    private func addSamples() {
        let sample1 = Report(reportType: "Missing Taillight", licensePlate: "JHN4687")
        let sample2 = Report(reportType: "Missing Headlight", licensePlate: "KHANG69")
        let sample3 = Report(reportType: "Gas tank open", licensePlate: "DEEZNUTZ")
        modelContext.insert(sample1)
        modelContext.insert(sample2)
        modelContext.insert(sample3)
    }
}

#Preview {
    ContentView()
}
