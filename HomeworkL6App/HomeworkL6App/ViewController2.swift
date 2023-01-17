//
//  ViewController2.swift
//  HomeworkL6App
//
//  Created by Hristo Papanov on 17.01.23.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var SpecificOptionSwitch: UISwitch!
    @IBOutlet weak var datePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func switchStateDidChange(_ sender: UISwitch) {
        self.datePicker.isEnabled = sender.isOn
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
