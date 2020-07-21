//
//  ViewController_nonfeedback_menu.swift
//  Force_Step_Test_8
//
//  Created by JinHyuck Park on 2020/07/12.
//  Copyright © 2020 JinHyuck Park. All rights reserved.
//

import UIKit

class ViewController_nonfeedback_menu: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var SubjectName_TextField: UITextField!
    @IBOutlet weak var RequireTime_TextField: UITextField!
    @IBOutlet weak var RepeatCount_TextField: UITextField!
    @IBOutlet weak var StepCount_TextField: UITextField!
    @IBOutlet weak var StartExperiment_Button: UIButton!
    
    var SubjectName_String = ""
    var RequireTime_String = ""
    var RepeatCount_String = ""
    var StepCount_String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SubjectName_TextField.returnKeyType = .done
        self.SubjectName_TextField.delegate = self
        RequireTime_TextField.returnKeyType = .done
        self.RequireTime_TextField.delegate = self
        RepeatCount_TextField.returnKeyType = .done
        self.RepeatCount_TextField.delegate = self
        StepCount_TextField.returnKeyType = .done
        self.StepCount_TextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        SubjectName_String = SubjectName_TextField.text ?? ""
        RequireTime_String = RequireTime_TextField.text ?? ""
        RepeatCount_String = RepeatCount_TextField.text ?? ""
        StepCount_String = StepCount_TextField.text ?? ""
        return false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // get a reference to the second view controller
        if segue.identifier == "segue_nonfeedback" {
            let secondViewController = segue.destination as! ViewController_nonfeedback_experiment
            secondViewController.SubjectName_String = SubjectName_String
            secondViewController.RequireTime_String = RequireTime_String
            secondViewController.RepeatCount_String = RepeatCount_String
            secondViewController.StepCount_String = StepCount_String
            if Int(StepCount_String) == 2 {
                secondViewController.Step1Border_String = "0.6"
            } else if Int(StepCount_String) == 3 {
                secondViewController.Step1Border_String = "0.46"
                secondViewController.Step2Border_String = "0.73"
            } else if Int(StepCount_String) == 4 {
                secondViewController.Step1Border_String = "0.4"
                secondViewController.Step2Border_String = "0.6"
                secondViewController.Step3Border_String = "0.8"
            } else if Int(StepCount_String) == 5 {
                secondViewController.Step1Border_String = "0.36"
                secondViewController.Step2Border_String = "0.52"
                secondViewController.Step3Border_String = "0.68"
                secondViewController.Step4Border_String = "0.84"
            } else if Int(StepCount_String) == 6 {
                secondViewController.Step1Border_String = "0.33"
                secondViewController.Step2Border_String = "0.46"
                secondViewController.Step3Border_String = "0.59"
                secondViewController.Step4Border_String = "0.72"
                secondViewController.Step5Border_String = "0.86"
            } else {
                secondViewController.Step1Border_String = "0.3142857"
                secondViewController.Step2Border_String = "0.4285714"
                secondViewController.Step3Border_String = "0.5428571"
                secondViewController.Step4Border_String = "0.6571428"
                secondViewController.Step5Border_String = "0.7714285"
                secondViewController.Step6Border_String = "0.8857142"
            }
        }
    }
}
