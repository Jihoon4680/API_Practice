//
//  ViewController.swift
//  Corona_API
//
//  Created by 안지훈 on 8/24/22.
//

import UIKit
import Charts

class MainViewController: UIViewController{
    
    var barChartView = MyBarchart()
    var mainCitys = [City]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.backgroundColor = .white
        let mainView = MainView(frame: self.view.bounds)
        self.view.addSubview(mainView)
        setNavigationTitle()
        // 셀을 선택 했을 때 컨플리션블락으로 데이터 전달.
        mainView.cellTapAction = navigationDetailView(_:)
        
        DispatchQueue.global(qos: .background).async {
            MyAlamofire.shared.getCovid(URL: MyUrl.BASE_URL, completion: { result in
                switch result {
                
                case .success(let citys):
                    DispatchQueue.main.async { [ weak self] in
                        guard let self = self else { return }
                        mainView.totalCorona.text = String(citys[0].totalCase)
                        mainView.newTotalCorona.text = String(citys[0].newCase)
                        self.mainCitys = citys
                        // 한국 코로나 배열 요소 삭제
                        // 데이터 처리를 하는데 main에서 돌려야될까...
                        self.mainCitys.remove(at: 0)
                        mainView.citys = self.mainCitys
                        
                        // 상위 5개 도시를 추출
                        let filterDic = self.setChartData(citys: self.mainCitys)
                        mainView.chartView.chartModel = filterDic
                        mainView.collectionView.reloadData()
                        mainView.chartView.delegate = self
                    }
                    
                case .failure(let error):
                    print(error)
                }
            })
        }
    }
    
    //MARK: - UI설정 ( Object 생성 )
    let label : UILabel = {
        let label = UILabel()
        label.text = "좆되네이거"
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 30)
        return label
    }()
    
    fileprivate func navigationDetailView(_ city: City) {
        let detailVC = DetailViewController()
        detailVC.receivedModel(city: city)
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    //MARK: - barchardata setup
    fileprivate func setChartData(citys : [City]) -> [String : Int]? {
        //신규확진자 수 기준으로 상위 5개도시 선별
        let array = citys.sorted(by: {$0.newCase > $1.newCase})
        
        let arraySlice = array.prefix(upTo: 5)
        print("arraySlice\(arraySlice)")
        let newArray = Array(arraySlice)
        
        var filterDic = [String:Int]()
        
        for arr in newArray {
            let city = arr.countryName
            let newCase = arr.newCase
            
            filterDic.updateValue(newCase, forKey: city)
        }
        return filterDic
    }
    
    //MARK: 네비게이션 타이틀 설정
    func setNavigationTitle(){
        self.navigationItem.title = "코로나 확진자 수"
    }
}


extension MainViewController : ChartViewDelegate {
    // 차트를 누르면 해당 뷰컨트롤러로 이동
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        // chart가 클릭 됐을 때 해당 도시정보 접근 ( 신규확진자 기준 ).
        guard let selectedCity = mainCitys.filter( { $0.newCase == Int(entry.y) }).first else { return }
        let detailVC = DetailViewController()
        detailVC.receivedModel(city: selectedCity)
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}


