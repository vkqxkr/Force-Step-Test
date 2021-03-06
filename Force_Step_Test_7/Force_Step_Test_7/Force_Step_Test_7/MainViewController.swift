//
//  ViewController.swift
//  Force_Step_Test_7
//
//  Created by JinHyuck Park on 2020/01/09.
//  Copyright © 2020 JinHyuck Park. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var SelectForceView_SegmentedControl: UISegmentedControl!
    @IBOutlet weak var SubjectName_TextField: UITextField!
    @IBOutlet weak var RequireTime_TextField: UITextField!
    @IBOutlet weak var StayTime_TextField: UITextField!
    @IBOutlet weak var RepeatCount_TextField: UITextField!
    @IBOutlet weak var StepCount_TextField: UITextField!
    @IBOutlet weak var StartExperiment_Button: UIButton!
    @IBOutlet weak var Step1Border_TextField: UITextField!
    @IBOutlet weak var Step2Border_TextField: UITextField!
    @IBOutlet weak var Step3Border_TextField: UITextField!
    @IBOutlet weak var Step4Border_TextField: UITextField!
    @IBOutlet weak var Step5Border_TextField: UITextField!
    @IBOutlet weak var Step6Border_TextField: UITextField!
    
    var SelectForceView_String = "Max"
    var SubjectName_String = ""
    var RequireTime_String = ""
    var StayTime_String = ""
    var RepeatCount_String = ""
    var StepCount_String = ""
    var Step1Border_String = ""
    var Step2Border_String = ""
    var Step3Border_String = ""
    var Step4Border_String = ""
    var Step5Border_String = ""
    var Step6Border_String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SubjectName_TextField.returnKeyType = .done
        self.SubjectName_TextField.delegate = self
        RequireTime_TextField.returnKeyType = .done
        self.RequireTime_TextField.delegate = self
        StayTime_TextField.returnKeyType = .done
        self.StayTime_TextField.delegate = self
        RepeatCount_TextField.returnKeyType = .done
        self.RepeatCount_TextField.delegate = self
        StepCount_TextField.returnKeyType = .done
        self.StepCount_TextField.delegate = self
        Step1Border_TextField.returnKeyType = .done
        self.Step1Border_TextField.delegate = self
        Step2Border_TextField.returnKeyType = .done
        self.Step2Border_TextField.delegate = self
        Step3Border_TextField.returnKeyType = .done
        self.Step3Border_TextField.delegate = self
        Step4Border_TextField.returnKeyType = .done
        self.Step4Border_TextField.delegate = self
        Step5Border_TextField.returnKeyType = .done
        self.Step5Border_TextField.delegate = self
        Step6Border_TextField.returnKeyType = .done
        self.Step6Border_TextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        SubjectName_String = SubjectName_TextField.text ?? ""
        RequireTime_String = RequireTime_TextField.text ?? ""
        StayTime_String = StayTime_TextField.text ?? ""
        RepeatCount_String = RepeatCount_TextField.text ?? ""
        StepCount_String = StepCount_TextField.text ?? ""
        Step1Border_String = Step1Border_TextField.text ?? ""
        Step2Border_String = Step2Border_TextField.text ?? ""
        Step3Border_String = Step3Border_TextField.text ?? ""
        Step4Border_String = Step4Border_TextField.text ?? ""
        Step5Border_String = Step5Border_TextField.text ?? ""
        Step6Border_String = Step6Border_TextField.text ?? ""
        if StepCount_String == "2" {
            Step1Border_TextField.isEnabled = true
            Step2Border_TextField.isEnabled = false
            Step3Border_TextField.isEnabled = false
            Step4Border_TextField.isEnabled = false
            Step5Border_TextField.isEnabled = false
            Step6Border_TextField.isEnabled = false
        } else if StepCount_String == "3" {
            Step1Border_TextField.isEnabled = true
            Step2Border_TextField.isEnabled = true
            Step3Border_TextField.isEnabled = false
            Step4Border_TextField.isEnabled = false
            Step5Border_TextField.isEnabled = false
            Step6Border_TextField.isEnabled = false
        } else if StepCount_String == "4" {
            Step1Border_TextField.isEnabled = true
            Step2Border_TextField.isEnabled = true
            Step3Border_TextField.isEnabled = true
            Step4Border_TextField.isEnabled = false
            Step5Border_TextField.isEnabled = false
            Step6Border_TextField.isEnabled = false
        } else if StepCount_String == "5" {
            Step1Border_TextField.isEnabled = true
            Step2Border_TextField.isEnabled = true
            Step3Border_TextField.isEnabled = true
            Step4Border_TextField.isEnabled = true
            Step5Border_TextField.isEnabled = false
            Step6Border_TextField.isEnabled = false
        } else if StepCount_String == "6" {
            Step1Border_TextField.isEnabled = true
            Step2Border_TextField.isEnabled = true
            Step3Border_TextField.isEnabled = true
            Step4Border_TextField.isEnabled = true
            Step5Border_TextField.isEnabled = true
            Step6Border_TextField.isEnabled = false
        } else {
            Step1Border_TextField.isEnabled = true
            Step2Border_TextField.isEnabled = true
            Step3Border_TextField.isEnabled = true
            Step4Border_TextField.isEnabled = true
            Step5Border_TextField.isEnabled = true
            Step6Border_TextField.isEnabled = true
        }
        return false
    }
    
    @IBAction func SelectForceViewFunc(_ sender: UISegmentedControl) {
        switch SelectForceView_SegmentedControl.selectedSegmentIndex {
        case 0:
            SelectForceView_String = "Max"
            break
        case 1:
            SelectForceView_String = "non-Max"
            break
        default:
            break
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // get a reference to the second view controller
        if segue.identifier == "Main_to_Experiment" {
            let secondViewController = segue.destination as! ExperimentViewController
            secondViewController.SelectForceView_String = SelectForceView_String
            secondViewController.SubjectName_String = SubjectName_String
            secondViewController.RequireTime_String = RequireTime_String
            secondViewController.StayTime_String = StayTime_String
            secondViewController.RepeatCount_String = RepeatCount_String
            secondViewController.StepCount_String = StepCount_String
            secondViewController.Step1Border_String = Step1Border_String
            secondViewController.Step2Border_String = Step2Border_String
            secondViewController.Step3Border_String = Step3Border_String
            secondViewController.Step4Border_String = Step4Border_String
            secondViewController.Step5Border_String = Step5Border_String
            secondViewController.Step6Border_String = Step6Border_String
        }
    }
}
