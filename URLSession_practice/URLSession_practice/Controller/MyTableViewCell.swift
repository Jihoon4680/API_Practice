//
//  MyTableViewCell.swift
//  URLSession_practice
//
//  Created by 안지훈 on 8/16/22.
//

import UIKit


class MyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var currentTemp: UILabel!
    @IBOutlet weak var lowTemp: UILabel!
    @IBOutlet weak var highTemp: UILabel!
    @IBOutlet weak var weatherDsc: UILabel!
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var icon: UIImageView!
    
    @IBInspectable var cornerRadius: CGFloat {
           set {
               layer.cornerRadius = newValue
           }
           get {
               return layer.cornerRadius
           }
       }
    

    var weatherModel : Model? {
        didSet {
            print("weatherModel called")
            bind()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    fileprivate func bind(){
        
        guard let temp = weatherModel?.main.temp else { return }
        currentTemp.text =  String(describing: temp )
        
        guard let temp_min =  weatherModel?.main.temp_min else { return }
        lowTemp.text = String(describing: temp_min )
        
        guard let temp_max =  weatherModel?.main.temp_max else { return }
        highTemp.text = String(describing: temp_max )
        
        guard let name = weatherModel?.name else { return }
        cityName.text = name
        
        guard let weatherDescribe = weatherModel?.weather.first?.description else { return }
        weatherDsc.text! = weatherDescribe
       
    
        guard let iconName = weatherModel?.weather.first?.icon else { return }
        let imageURL = API.BASE_IMAGE_URL + iconName + ".png"
 
        icon.setImageUrl(imageURL)

            contentView.layer.borderWidth = 4
        contentView.layer.cornerRadius = 25
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 20.0, left: 0, bottom: 0, right: 0))
    }
    
    
}
