//
//  ViewController.swift
//  Force_Step_Test_7
//
//  Created by JinHyuck Park on 2020/01/09.
//  Copyright © 2020 JinHyuck Park. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var SubjectName_TextField: UITextField!
    @IBOutlet weak var StayTime_TextField: UITextField!
    @IBOutlet weak var RepeatCount_TextField: UITextField!
    @IBOutlet weak var StepCount_TextField: UITextField!
    @IBOutlet weak var StartExperiment_Button: UIButton!
    
    var SubjectName_String = ""
    var StayTime_String = ""
    var RepeatCount_String = ""
    var StepCount_String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SubjectName_TextField.returnKeyType = .done
        self.SubjectName_TextField.delegate = self
        StayTime_TextField.returnKeyType = .done
        self.StayTime_TextField.delegate = self
        RepeatCount_TextField.returnKeyType = .done
        self.RepeatCount_TextField.delegate = self
        StepCount_TextField.returnKeyType = .done
        self.StepCount_TextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        SubjectName_String = SubjectName_TextField.text ?? ""
        StayTime_String = StayTime_TextField.text ?? ""
        RepeatCount_String = RepeatCount_TextField.text ?? ""
        StepCount_String = StepCount_TextField.text ?? ""
        return false
    }
}
