//
//  DetailViewModel.swift
//  Corona_API
//
//  Created by 안지훈 on 9/10/22.
//

import Foundation
import Charts

class DetailViewModel {
    
    // init -> detailCity didSet -> Optional해제 -> detailView에 넘겨줘야됨....
    var detailCity = City()
    

    func filterCity(entry: ChartDataEntry, citys : [City])  {
        guard let selectedCity = citys.filter( { $0.newCase == Int(entry.y) }).first else { return }
        detailCity = selectedCity
    }
    
}
