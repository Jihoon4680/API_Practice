//
//  detailVC.swift
//  Corona_API
//
//  Created by 안지훈 on 9/5/22.
//

import UIKit

class DetailViewController : UIViewController{
    
    var detailCity : City?
    private var detailView : DetailView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //뷰가 로드 됐을때 설정돼있는 City로 초기화
        let detailView = DetailView(frame: self.view.bounds, city: detailCity!)
        self.detailView = detailView
        view.addSubview(detailView)
    }
    
    func receivedModel(city : City){
        detailCity = city
    }
    
    
}
