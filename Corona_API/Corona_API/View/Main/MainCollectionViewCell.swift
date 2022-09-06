//
//  MainCollectionViewCell.swift
//  Corona_API
//
//  Created by 안지훈 on 8/31/22.
//

import UIKit



class MainCollectionViewCell : UICollectionViewCell {
    
    let activityIndicatorView =  UIActivityIndicatorView(style: .medium) // API 값 불러오는 동안 보이는 loadingView
    var city : City? {
        didSet{
            bind()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(cellAllSV)
        setUpAutolayout()
    }
    
    fileprivate func bind(){
        
        guard let city = city else {
            return
        }

        cityName.text = city.countryName
        total.text = city.totalCase
        new.text = "\(city.newCase)"
        
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Label설정
    lazy var cityNameLabel : UILabel = {
        let label = UILabel()
        label.text = "도시이름"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var cityName : UILabel = {
        let label = UILabel()
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var totalLabel : UILabel = {
        let label = UILabel()
        label.text = "전체 확진자"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var total : UILabel = {
        let label = UILabel()
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var newLabel : UILabel = {
        let label = UILabel()
        label.text = "신규확진자"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var new : UILabel = {
        let label = UILabel()
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: StackView
    
    let citySV: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 8
        return stackView
    }()
    
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
        stackView.spacing = 8
        return stackView
    }()
    
    let cellAllSV: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        return stackView
    }()
    
    //MARK: - AutoLayout
    
    fileprivate func setUpAutolayout(){
        //MARK: StackView Arrange StackView
        totalSV.addArrangedSubview(totalLabel)
        totalSV.addArrangedSubview(total)
        newSV.addArrangedSubview(newLabel)
        newSV.addArrangedSubview(new)
        citySV.addArrangedSubview(cityNameLabel)
        citySV.addArrangedSubview(cityName)
        
        cellAllSV.addArrangedSubview(citySV)
        cellAllSV.addArrangedSubview(totalSV)
        cellAllSV.addArrangedSubview(newSV)
       
        //MARK: setAutolayout
        NSLayoutConstraint.activate([
            cellAllSV.topAnchor.constraint(equalTo: self.topAnchor),
            cellAllSV.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            cellAllSV.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            cellAllSV.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
}
