//
//  SettingsViewController.swift
//  RetakeExam
//
//  Created by Hristo Papanov on 12.02.23.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var countSlider: UISlider!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func sliderValueChanged(_ sender: Any) {
        resultLabel.text = String(countSlider.value)
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
