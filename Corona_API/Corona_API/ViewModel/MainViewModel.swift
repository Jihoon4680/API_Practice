//
//  MainViewModel.swift
//  Corona_API
//
//  Created by 안지훈 on 9/10/22.
//

import UIKit



class MainViewModel {
    
    init(){
        fetchData()
    }
    
    var mainCitys = [City]()
    
    var filterDic :[String:Int]?
    var koreaTotal : String?
    var koreaNew : Int?
    
    func fetchData(){
        DispatchQueue.global(qos: .background).async {
            
            MyAlamofire.shared.getCovid(URL: MyUrl.BASE_URL, completion: { [weak self] result in
                switch result {
                case .success(let citys):
                    guard let self = self else {return}
                    self.getKoreaData(citys: citys)
                    
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue:  Notification.complete), object: nil)
                case .failure(let error):
                    print(error)
                }
            })
        }
    }
    //MARK: didSet으로 호출됨
    func getKoreaData(citys : [City]){
        
        koreaTotal = citys[0].totalCase
        koreaNew = citys[0].newCase
        // 전체 코로나수 배열에서 삭제
        mainCitys = citys
        mainCitys.remove(at: 0)
        
        filterDic = setChartData(citys: mainCitys)
    }
    
    
    fileprivate func setChartData(citys : [City]) -> [String : Int]? {
        //신규확진자 수 기준으로 상위 5개도시 선별
        let array = citys.sorted(by: {$0.newCase > $1.newCase})
        
        let arraySlice = array.prefix(upTo: 5)
        
        var filterDic = [String:Int]()
        
        for arr in arraySlice {
            let city = arr.countryName
            let newCase = arr.newCase
            
            filterDic.updateValue(newCase, forKey: city)
        }
        return filterDic
    }
    
    
    
}
