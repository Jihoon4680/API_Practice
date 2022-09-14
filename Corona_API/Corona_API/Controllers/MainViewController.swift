//
//  ViewController.swift
//  Corona_API
//
//  Created by 안지훈 on 8/24/22.
//

import UIKit
import Charts

// 여기서 VM만들고 VC가 View가되고 ??
class MainViewController: UIViewController{
    
    var barChartView = MyBarchart()
    var mainCitys = [City]()
   
    var cellTapAction: ((_ City: City) -> Void)?
    let mainViewModel = MainViewModel()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        NotificationCenter.default.addObserver(self, selector: #selector(bind), name: NSNotification.Name(rawValue: Notification.complete), object: nil)
        
        setNavigationTitle()
        // 셀을 선택 했을 때 컨플리션블락으로 데이터 전달.
        cellTapAction = navigationDetailView(_:)
        //ViewModel의 역할.
    }
    
    @objc fileprivate func bind(){
        print("called mainVC - bind")
        let mainView = MainView(frame: self.view.bounds)
        mainView.collectionView.dataSource = self
        mainView.collectionView.delegate = self
        mainView.chartView.delegate = self
        
        mainView.totalCorona.text = mainViewModel.koreaTotal
        mainView.newTotalCorona.text = "\(String(describing: mainViewModel.koreaNew!))"
        mainView.chartView.chartModel = mainViewModel.filterDic
        self.view.addSubview(mainView)
        
    }
    
    fileprivate func navigationDetailView(_ city: City) {
        let detailVC = DetailViewController()
        detailVC.detailViewModel.detailCity = city
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    //ViewModel의 역할
    //MARK: - barchardata setup
    
    
    //MARK: 네비게이션 타이틀 설정
    func setNavigationTitle(){
        self.navigationItem.title = "코로나 확진자 수"
    }
}
extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mainViewModel.mainCitys.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
            if let cell = cell as? MainCollectionViewCell {
                cell.backgroundColor = .white
                cell.city = mainViewModel.mainCitys[indexPath.item]
                cell.layer.borderWidth = 5
                cell.layer.borderColor = UIColor.black.cgColor
                cell.layer.cornerRadius = 10
        }
        return cell
    }
    
    
    
}
extension MainViewController : UICollectionViewDelegate {
    
    // 컬렉션을 택 했을때 엑션
    func cellTap(_ city: City) {
        cellTapAction!(city)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // cell click
        cellTap(mainViewModel.mainCitys[indexPath.item])
    }
}


//이건 어캐해..?
extension MainViewController : ChartViewDelegate {
    // 차트를 누르면 해당 뷰컨트롤러로 이동
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        // chart가 클릭 됐을 때 해당 도시정보 접근 ( 신규확진자 기준 ).
        let detailVC = DetailViewController()
       
        detailVC.detailViewModel.filterCity(entry: entry, citys: mainViewModel.mainCitys)
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}


