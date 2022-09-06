//
//  BarChartModel.swift
//  Corona_API
//
//  Created by 안지훈 on 9/5/22.
//

import Foundation
import Charts


struct BarChartModel{
    var index : Int
    let city: String
    let newCase: Double
    
    func transformToBarChartDataEntry() -> BarChartDataEntry {
        let entry = BarChartDataEntry(x: Double(index), y: newCase)
        return entry
    }
}
