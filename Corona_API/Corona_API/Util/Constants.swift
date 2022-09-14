//
//  Error.swift
//  Corona_API
//
//  Created by 안지훈 on 8/30/22.
//

import Foundation

enum MyUrl{
    // 통신 방법이 하나 뿐이므로 키와 url을 합친다.
    static let BASE_URL : String = "https://api.corona-19.kr/korea/country/new/"
    static let param = [
        "serviceKey": "Zj3UdXmpoqlvQH7iaT6NsWx2yY9eFJPCO"
    ]
    
}
enum Notification{
    static let complete = "complete"
}
