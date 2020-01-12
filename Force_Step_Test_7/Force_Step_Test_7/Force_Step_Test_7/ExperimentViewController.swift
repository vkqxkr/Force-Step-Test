//
//  ExperimentViewController.swift
//  Force_Step_Test_7
//
//  Created by JinHyuck Park on 2020/01/09.
//  Copyright © 2020 JinHyuck Park. All rights reserved.
//

import UIKit

class ExperimentViewController: UIViewController {

    @IBOutlet weak var StepCount_Label: UILabel!
    @IBOutlet weak var SubjectName_Label: UILabel!
    @IBOutlet weak var StepColorView_View: UIView!
    @IBOutlet weak var PresentForceView_ProgressView: ForceProgressView!
    @IBOutlet weak var PresentForceColorView_ImageView: UIImageView!
    @IBOutlet weak var ExperimentCount_Label: UILabel!
    @IBOutlet weak var ForceButton_Button: ForceButton!
    
    var StepCount_Int = 0
    let StepColor_UIColor = [UIColor.red, UIColor.orange, UIColor.yellow, UIColor.green, UIColor(red:0.00, green:0.58, blue:1.00, alpha:1.0), UIColor.blue, UIColor.purple]
    
    var SubjectName_String = ""
    var StayTime_String = ""
    var RepeatCount_String = ""
    var StepCount_String = ""
    var Step1Border_String = ""
    var Step2Border_String = ""
    var Step3Border_String = ""
    var Step4Border_String = ""
    var Step5Border_String = ""
    var Step6Border_String = ""
    var StepBorder_DoubleList: [Double] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        StepCount_Int = Int(StepCount_String)!
        if StepCount_Int == 2 {
            StepBorder_DoubleList.append(Double(Step1Border_String)!)
            StepBorder_DoubleList.append(1.0)
        } else if StepCount_Int == 3 {
            StepBorder_DoubleList.append(Double(Step1Border_String)!)
            StepBorder_DoubleList.append(Double(Step2Border_String)!)
            StepBorder_DoubleList.append(1.0)
        } else if StepCount_Int == 4 {
            StepBorder_DoubleList.append(Double(Step1Border_String)!)
            StepBorder_DoubleList.append(Double(Step2Border_String)!)
            StepBorder_DoubleList.append(Double(Step3Border_String)!)
            StepBorder_DoubleList.append(1.0)
        } else if StepCount_Int == 5 {
            StepBorder_DoubleList.append(Double(Step1Border_String)!)
            StepBorder_DoubleList.append(Double(Step2Border_String)!)
            StepBorder_DoubleList.append(Double(Step3Border_String)!)
            StepBorder_DoubleList.append(Double(Step4Border_String)!)
            StepBorder_DoubleList.append(1.0)
        } else if StepCount_Int == 6 {
            StepBorder_DoubleList.append(Double(Step1Border_String)!)
            StepBorder_DoubleList.append(Double(Step2Border_String)!)
            StepBorder_DoubleList.append(Double(Step3Border_String)!)
            StepBorder_DoubleList.append(Double(Step4Border_String)!)
            StepBorder_DoubleList.append(Double(Step5Border_String)!)
            StepBorder_DoubleList.append(1.0)
        } else {
            StepBorder_DoubleList.append(Double(Step1Border_String)!)
            StepBorder_DoubleList.append(Double(Step2Border_String)!)
            StepBorder_DoubleList.append(Double(Step3Border_String)!)
            StepBorder_DoubleList.append(Double(Step4Border_String)!)
            StepBorder_DoubleList.append(Double(Step5Border_String)!)
            StepBorder_DoubleList.append(Double(Step6Border_String)!)
            StepBorder_DoubleList.append(1.0)
        }
        var count = StepBorder_DoubleList.count - 1
        for i in 7 - StepCount_Int..<7{
            let subview = UIView()
            var frame = StepColorView_View.bounds
            frame.size.width = frame.size.width * CGFloat(StepBorder_DoubleList[count])
            print(StepBorder_DoubleList[count])
            subview.frame = frame
            subview.backgroundColor = StepColor_UIColor[i]
            self.StepColorView_View.addSubview(subview)
            count -= 1
        }
        ForceButton_Button.SetStepCount(StepCount: StepCount_Int)
        ForceButton_Button.SetStepBorder(StepBorder: StepBorder_DoubleList)
    }
}
