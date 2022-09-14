//
//  DetailView.swift
//  Corona_API
//
//  Created by 안지훈 on 9/5/22.
//

import Foundation
import UIKit

class DetailView : UIView{
    
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setUpAutolayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Label생성
    lazy var cityNameLabel : UILabel = {
        let label = UILabel()
        label.text = "도시이름"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var cityName : UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var totalLabel : UILabel = {
        let label = UILabel()
        label.text = "전체 확진자"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var total : UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var newLabel : UILabel = {
        let label = UILabel()
        label.text = "신규확진자"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var new : UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //StackView생성
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
        stackView.spacing = 10
        return stackView
    }()
    
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
       
        self.addSubview(cellAllSV)
        //MARK: setAutolayout
        NSLayoutConstraint.activate([
            cellAllSV.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            cellAllSV.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
   
    
}
