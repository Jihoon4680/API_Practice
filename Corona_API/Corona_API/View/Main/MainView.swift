//
//  MainView.swift
//  Corona_API
//
//  Created by 안지훈 on 8/25/22.
//


import UIKit
import Charts

let cellID = "Cell"

class MainView : UIView{
    
    var citys: [City] = []
    
    
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        self.setupStackView()
        self.setupChartView()
        self.setupCollection()
        self.arrangedStackView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Label 생성
    let totalCoronaLabel : UILabel = {
        let label = UILabel()
        
        label.text = "국내 총 코로나 인구"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var totalCorona : UILabel = {
        let label = UILabel()
        
        label.text = "0"
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let newTotalCoronaLabel : UILabel = {
        let label = UILabel()
        
        label.text = "국내 신규 코로나인구"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let newTotalCorona : UILabel = {
        let label = UILabel()
        
        label.text = "0"
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    //MARK: StackView생성
    let totalSV: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 8
        return stackView
    }()
    
    let newSV: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 5
        return stackView
    }()
    let allSV: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        return stackView
    }()
    
    //MARK: -  collectionView 생성
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width - 20, height: 70)
        flowLayout.minimumLineSpacing = 8
        flowLayout.scrollDirection = .vertical
        flowLayout.sectionInset = UIEdgeInsets(top: 30, left: 10, bottom: 10, right: 10)
        flowLayout.minimumInteritemSpacing = 1
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        
        return cv
    }()
    
    //MARK: - barChartView 생성
    // 얘는 binding만 하면됨.
    var chartView : MyBarchart = {
        let chartview = MyBarchart()
        chartview.translatesAutoresizingMaskIntoConstraints = false
        return chartview
    }()
    
    //MARK: - StackView Arrange
    fileprivate func arrangedStackView(){
        self.totalSV.addArrangedSubview(totalCoronaLabel)
        self.totalSV.addArrangedSubview(totalCorona)
        self.newSV.addArrangedSubview(newTotalCoronaLabel)
        self.newSV.addArrangedSubview(newTotalCorona)
        
        self.allSV.addArrangedSubview(totalSV)
        self.allSV.addArrangedSubview(newSV)
    }
    
    //MARK: - Autolayout
    
    //MARK: StackView Auolayout
    fileprivate func setupStackView(){
        addSubview(allSV)
        NSLayoutConstraint.activate([
            allSV.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,constant: 3),
            allSV.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 10),
            allSV.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -10),
        ])
    }
    
    //MARK: CollectionView Auolayout
    fileprivate func setupCollection() {
      
        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: chartView.bottomAnchor,constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: allSV.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: allSV.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: cellID)
    }
    //MARK: BarChartView Auolayout
    fileprivate func setupChartView(){
        print("chartView setup")
        addSubview(chartView)
        
        NSLayoutConstraint.activate([
            chartView.topAnchor.constraint(equalTo: allSV.bottomAnchor,constant: 10),
            chartView.leadingAnchor.constraint(equalTo: allSV.leadingAnchor),
            chartView.trailingAnchor.constraint(equalTo: allSV.trailingAnchor),
            chartView.heightAnchor.constraint(equalToConstant: 350)
        ])
    }
    
    
    
    
}
