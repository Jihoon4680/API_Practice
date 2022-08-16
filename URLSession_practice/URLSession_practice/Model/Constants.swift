//
//  Constraint.swift
//  URLSession_practice
//
//  Created by 안지훈 on 8/14/22.
//

import Foundation

enum Cell {
    static let myTableViewCell = "MyTableViewCell"
}

enum API {
    
    static let BASE_URL = "https://api.openweathermap.org/data/2.5/weather?q="
    // API호출에 변화가 없으므로 API key와 검색명령어를 통합한다.
    static let API_KEY = "&appid=30e8db7e7075e4df929132c8d182b427"
    static let BASE_IMAGE_URL =  "http://openweathermap.org/img/wn/"
}

