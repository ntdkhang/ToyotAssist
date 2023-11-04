//
//  Report.swift
//  ToyotAssist
//
//  Created by Khang Nguyen on 11/4/23.
//

import Foundation
import SwiftData

@Model
final class Report {
    var reportType: String
    var licensePlate: String
    
    init(reportType: String, licensePlate: String) {
        self.reportType = reportType
        self.licensePlate = licensePlate
    }
}
