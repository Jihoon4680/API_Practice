//
//  ViewController.swift
//  URLSession_practice
//
//  Created by 안지훈 on 8/14/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    var weatherList : [Model] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        self.myTableView.register(UINib(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: String(describing: MyTableViewCell.self))
        
        myTableView.delegate = self
        myTableView.dataSource = self
        setUp()
        print("viewDidLoad called()")
        
        
    }
    fileprivate func setUp() {
            
            // API 통해서 city weather 값 가져옴
            for cityName in CityList {
                
                // 데이터를 가져오는 영역은 다른 스레드를통해 처리함으로 속도를 높힌다. 
                DispatchQueue.global(qos: .background).async {
                    WeatherManager(cityName: cityName).getWeather { [weak self] result in
                        guard let self = self else { return }
                        switch result {
                        case .success(let weatherValue):
                            DispatchQueue.main.async {
                                self.weatherList += [weatherValue]
                                self.myTableView.reloadData()
                            }
                        case .failure(let networkError):
                            print("\(networkError)")
                        }
                    }
                }
            }
    }

}








// MARK: - TableView DataSource & Delegate
extension ViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("tableView cellForRowAt called() ")
        guard let cell = self.myTableView.dequeueReusableCell(withIdentifier: String(describing: MyTableViewCell.self), for: indexPath) as? MyTableViewCell else { return UITableViewCell() }
        cell.weatherModel = weatherList[indexPath.row]

        return cell
    }
    // 높이설정
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return 130
    }
    
    
    
}
