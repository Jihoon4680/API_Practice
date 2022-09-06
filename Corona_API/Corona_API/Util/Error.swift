//
//  Error.swift
//  Corona_API
//
//  Created by 안지훈 on 8/30/22.
//

import Foundation


enum MyError : String,Error {
    case wrongUrl = "url이 잘못 됐습니다."
    case noData = "데이터가 없습니다."
    
}
