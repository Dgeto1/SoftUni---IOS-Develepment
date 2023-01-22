//
//  ParisViewController.swift
//  HomeworkL7
//
//  Created by Hristo Papanov on 21.01.23.
//

import UIKit

class ParisViewController: UIViewController {

    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var conditionsImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //self.sofiaTempLabel.text = "\(RequestManager.temperature)°C"
        var weatherCode: Double
        var codeDescription: String
        weatherCode = ParisRequestManager.weatherCode
        
        switch weatherCode{
        case 0:
            codeDescription = "Clear sky"
            conditionsImage.image = UIImage(systemName: "sun.min")
        case 1,2,3:
            codeDescription = "Cloudy"
            conditionsImage.image = UIImage(systemName: "cloud.fill")
        case 45, 48:
            codeDescription = "Fog"
            conditionsImage.image = UIImage(systemName: "cloud.fog.fill")
        case 51, 53, 55, 56, 57:
            codeDescription = "Drizzle"
            conditionsImage.image = UIImage(systemName: "cloud.drizzle.fill")
        case 61, 63, 65, 66, 67:
            codeDescription = "Rain"
            conditionsImage.image = UIImage(systemName: "cloud.rain.fill")
        case 71, 73, 75, 77:
            codeDescription = "Snow"
            conditionsImage.image = UIImage(systemName: "snow")
        case 80, 81, 82:
            codeDescription = "Rain showers"
            conditionsImage.image = UIImage(systemName: "cloud.bolt.rain.fill")
        case 85, 86:
            codeDescription = "Snow showers"
            conditionsImage.image = UIImage(systemName: "cloud.snow.fill")
        case 95, 96, 99:
            codeDescription = "Thunderstorm"
            conditionsImage.image = UIImage(systemName: "cloud.moon.rain.circle.fill")
        default:
            return
        }
        self.conditionLabel.text = "\(codeDescription)"
        //self.conditionLabel.text = "\(ParisRequestManager.temperature)"
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
