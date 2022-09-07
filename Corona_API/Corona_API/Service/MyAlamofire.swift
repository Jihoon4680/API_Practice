//
//  MyAlamofire.swift
//  Corona_API
//
//  Created by 안지훈 on 8/24/22.
//

import Alamofire

class MyAlamofire{

    static let shared =  MyAlamofire()
   
    func getCovid(URL url : String,
                   completion : @escaping (Result<[City],MyError> )-> Void){
        AF.request(url, method: .get, parameters: MyUrl.param)
          .responseData( completionHandler: { response in
              switch response.result {
            case let .success(data):
                  var citys = [City]()
              do {
                  guard let jsonDic = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] else {return}
                  for cityName in CityList {
                      guard let city = jsonDic[cityName] as? [String:Any] else {return}
                      
                      let ctName = city["countryName"] as! String
                      let newCase = city["newCase"] as! String
                      let totalCase = city["totalCase"] as! String
                      let percentage = city["percentage"] as! String
                      
                      let newCaseToint = self.removeFormatString(string: newCase) 
                      
                      let ct = City(countryName: ctName , totalCase: totalCase , percentage: percentage, newCase: Int(newCaseToint))
                      citys.append(ct)
                  }
                  completion(.success(citys))
              } catch {
                  completion(.failure(MyError.noData))
              }
            case let .failure(error):
                  completion(.failure(.noData))
            }
          })
      }
    // 3자리마다 ,가 찍혀진 String을 Int형으로 변환
    func removeFormatString(string: String) -> Double {
      let formatter = NumberFormatter()
      formatter.numberStyle = .decimal
      return formatter.number(from: string)?.doubleValue ?? 0
    }
    
}


