//
//  detailVC.swift
//  Corona_API
//
//  Created by 안지훈 on 9/5/22.
//

import UIKit

class DetailViewController : UIViewController{
    
    var detailViewModel = DetailViewModel()
    
  
    
    override func viewDidLoad() {
        print("detailVC viewdidload")
        super.viewDidLoad()
        bind()
        self.view.backgroundColor = .white
       
    }
    
    fileprivate func bind(){
        print("detail bind - called")
        let detailView1 = DetailView(frame: self.view.bounds)
        detailView1.total.text = detailViewModel.detailCity.totalCase
        detailView1.new.text = "\(String(describing: detailViewModel.detailCity.totalCase))"
        detailView1.cityName.text = detailViewModel.detailCity.countryName
        // add 될 때 init이 콜이된다.?
        
        view.addSubview(detailView1)
    }
    
}
