//
//  ChartBar.swift
//  Corona_API
//
//  Created by 안지훈 on 8/31/22.
//

import UIKit
import Charts

class MyBarchart : BarChartView {
    
    
    
    var items = [BarChartModel]()
    
    var initIndex = 0
    var chartModel : [String : Int]? {
        didSet {
            print("MyBarchart didset")
            getFormattedItemValue(chartModel)
            setupData()
            setupChartView()
        }
    }
    
    override init(frame: CGRect) {
        print("MyBarchart - init")
        super.init(frame: frame)
      
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  
    // Chart용 데이터모델로 변환
    func getFormattedItemValue(_ data : [String:Int]?) {
        
        guard let array = data else { return }
        for (city,newCase) in array {
            let city = city
            let newCase = newCase
            let index = initIndex
            initIndex += 1
            let barCM = BarChartModel(index: index, city: city, newCase: Double(newCase))
            
            items.append(barCM)
        }
        // 신규확진자 오름차순 정렬
        items = items.sorted( by : {$0.newCase > $1.newCase})
        // barChart index 수정
        for i in 0..<items.count {
            items[i].index = i
        }
        print(items)
    }
    //MARK: chart데이터 설정
    func setupData(){
        //엔트리 데이터 설정
        let dataEntries = items.map{ $0.transformToBarChartDataEntry() }
        
        let barSet = BarChartDataSet(entries: dataEntries)
        barSet.highlightEnabled = true
        barSet.valueFont = UIFont.boldSystemFont(ofSize: 15)
        //에니메이션 설정
        self.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        // 색 설정
        let color = [
            UIColor.red,
            UIColor.orange,
            UIColor.yellow,
            UIColor.green,
            UIColor.blue,
            UIColor.cyan,
        ]
        barSet.colors = color
        let data = BarChartData(dataSet: barSet)
        data.setDrawValues(true)
        //데이터가 없을 때
        self.noDataText = "데이터가 없습니다."
        self.noDataFont = .systemFont(ofSize: 20)
        self.noDataTextColor = .lightGray
        // 설정한 데이터 할당
        self.data = data
    }
    //MARK: charts 스타일 설정
    fileprivate func setupChartView(){
        
        self.doubleTapToZoomEnabled = false
        self.rightAxis.enabled = false
        self.setExtraOffsets(left: 10, top: 0, right: 20, bottom: 30)
        self.legend.enabled = false
        // set xAxis
        let xAxis = self.xAxis
        xAxis.labelPosition = .bottom
        xAxis.valueFormatter = IndexAxisValueFormatter(values: items.map{
            $0.city
        })
        xAxis.setLabelCount(items.count, force: false)
        xAxis.labelFont = UIFont.boldSystemFont(ofSize: 20)
        xAxis.drawAxisLineEnabled = true
        xAxis.drawGridLinesEnabled = false
        xAxis.granularityEnabled = false
        
    }

}

