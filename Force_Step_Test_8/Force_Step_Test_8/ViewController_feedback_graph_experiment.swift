//
//  ViewController_feedback_graph_experiment.swift
//  Force_Step_Test_8
//
//  Created by JinHyuck Park on 2020/07/12.
//  Copyright © 2020 JinHyuck Park. All rights reserved.
//
import UIKit

class ViewController_feedback_graph_experiment: UIViewController {

    @IBOutlet weak var StepCount_Label: UILabel!
    @IBOutlet weak var SubjectName_Label: UILabel!
    @IBOutlet weak var StepColorView_View: UIView!
    @IBOutlet weak var PresentForceView_ProgressView: UIProgressView!
    @IBOutlet weak var PresentForceColorView_ImageView: UIImageView!
    @IBOutlet weak var ExperimentCount_Label: UILabel!
    @IBOutlet weak var ForceButton_Button: ForceButton!
    
    var StepCount_Int = 0
    let StepColor_UIColor = [UIColor.red, UIColor.orange, UIColor.yellow, UIColor.green, UIColor(red:0.00, green:0.58, blue:1.00, alpha:1.0), UIColor.blue, UIColor.purple, UIColor.gray]
    var StepColor_StringList: [String] = ["R", "O", "Y", "G", "S", "B", "P"]
    
    var SelectForceView_String = ""
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
    var StepBorder_DoubleList: [Double] = [0.2]
    var ExperimentCount_Int: Int = 0
    
    var StartTime_Bool = true
    var StartTime_TimeInterval: TimeInterval = 0
    var FinishTime_TimeInterval: TimeInterval = 0
    var TimeDifference_TimeInterval: TimeInterval = 0
    var StartStepTime_TimeInterval: TimeInterval = 0
    var FinishStepTime_TimeInterval: TimeInterval = 0
    var PresentStepColor: String = ""
    var Success_Bool: Bool = false
    var SuccessColor_String: String = ""
    
    var Colors_IntList: [Int] = []
    var ColorValue_Int: Int = 6
    var Value_String: String = ""
    var Result_String: String = ""
    
    var file_count = 1
    var file_list : [String] = []
    var file_list_end : [String] = []
    
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
        for i in 7 - StepCount_Int..<8{
            let subview = UIView()
            var frame = StepColorView_View.bounds
            frame.size.width = frame.size.width * CGFloat(StepBorder_DoubleList[count])
            subview.frame = frame
            subview.backgroundColor = StepColor_UIColor[i]
            self.StepColorView_View.addSubview(subview)
            count -= 1
        }
        for i in 0...StepBorder_DoubleList.count - 1 {
            if i == StepBorder_DoubleList.count - 1 {
                Result_String = Result_String + String(StepBorder_DoubleList[i]) + "\n"
            } else {
                Result_String = Result_String + String(StepBorder_DoubleList[i]) + "_"
            }
        }
        for _ in 1...StepCount_Int {
            for _ in 1...Int(RepeatCount_String)! {
                Colors_IntList.append(ColorValue_Int)
            }
            ColorValue_Int -= 1
        }
        Colors_IntList.shuffle()
        StepCount_Label.text = StepCount_String + "단계"
        PresentForceColorView_ImageView.backgroundColor = StepColor_UIColor[Colors_IntList[0]]
        SubjectName_Label.text = SubjectName_String
        PresentForceView_ProgressView.progress = 0.0
        ForceButton_Button.SetStepCount(StepCount: StepCount_Int)
        ForceButton_Button.SetStepBorder(StepBorder: StepBorder_DoubleList)
        ForceButton_Button.SetForceView(SetForceView_String: SelectForceView_String)
    }
    
    @IBAction func StartTouchFunc_ForceButton(_ sender: ForceButton) {
        if StartTime_Bool {
            StartTime_TimeInterval = Date.timeIntervalSinceReferenceDate
            StartTime_Bool = false
        }
        FinishTime_TimeInterval = Date.timeIntervalSinceReferenceDate
        if FinishTime_TimeInterval - StartTime_TimeInterval > Double(RequireTime_String)! {
            ForceButton_Button.isEnabled = false
            ForceButton_Button.SetForce(force: 0.0)
            PresentForceView_ProgressView.progress = 0.0
        }
        if PresentStepColor != ForceButton_Button.GetColor() {
            PresentStepColor = ForceButton_Button.GetColor()
            StartStepTime_TimeInterval = Date.timeIntervalSinceReferenceDate
        }
        FinishStepTime_TimeInterval = Date.timeIntervalSinceReferenceDate
        if FinishStepTime_TimeInterval - StartStepTime_TimeInterval >= Double(StayTime_String)! {
            Success_Bool = true
            SuccessColor_String = PresentStepColor
            ForceButton_Button.isEnabled = false
            ForceButton_Button.SetForce(force: 0.0)
            PresentForceView_ProgressView.progress = 0.0
        }
        PresentForceView_ProgressView.progress = Float(ForceButton_Button.GetForce())!
    }
    
    @IBAction func EndTouchFunc_ForceButton(_ sender: ForceButton) {
        ForceButton_Button.isEnabled = true
        FinishTime_TimeInterval = Date.timeIntervalSinceReferenceDate
        TimeDifference_TimeInterval = FinishTime_TimeInterval - StartTime_TimeInterval
        PresentForceView_ProgressView.progress = 0.0
        PresentStepColor = ""
        Success_Bool = false
        StartTime_Bool = true
        if TimeDifference_TimeInterval > Double(RequireTime_String)! {
            //입력 시간 초과
            Value_String = StepColor_StringList[Colors_IntList[ExperimentCount_Int]] + "_" + "fail" + "_" + "fail" + "_" + "소요시간초과\n"
        } else {
            // 입력 시간 준수
            if Success_Bool {
                if SuccessColor_String == StepColor_StringList[Colors_IntList[ExperimentCount_Int]] {
                    Value_String = StepColor_StringList[Colors_IntList[ExperimentCount_Int]] + "_" + ForceButton_Button.GetColor() + "_" + ForceButton_Button.GetForce() + "_" + String(TimeDifference_TimeInterval) + "\n"
                } else {
                    Value_String = StepColor_StringList[Colors_IntList[ExperimentCount_Int]] + "_" + "fail" + "_" + "fail" + "_" + "입력실패\n"
                }
            } else {
                Value_String = StepColor_StringList[Colors_IntList[ExperimentCount_Int]] + "_" + "fail" + "_" + "fail" + "_" + "입력실패\n"
            }
        }
        ForceButton_Button.SetForce(force: 0.0)
        print(Value_String)
        ExperimentCount_Int += 1
        ExperimentCount_Label.text = String(ExperimentCount_Int)
        if ExperimentCount_Int == Int(RepeatCount_String)! * Int(StepCount_String)! {
            //값 저장해야함
            Result_String += Value_String
            ForceButton_Button.isEnabled = false
            print(Result_String)
            readFile()
            writeFile(data: Result_String, filename: SubjectName_String + "_" + SelectForceView_String + "_" + RequireTime_String + "_" + RepeatCount_String + "_" + StepCount_String + "_" + "(" + String(file_count) + ")" + ".txt")
            showToast(message: "저장완료", font: UIFont.systemFont(ofSize: UIFont.systemFontSize))
        } else {
            //결과 String에 추가
            Result_String += Value_String
            PresentForceColorView_ImageView.backgroundColor = StepColor_UIColor[Colors_IntList[ExperimentCount_Int]]
        }
        FinishTime_TimeInterval = 0.0
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func writeFile(data: String, filename: String) {
        let filename = getDocumentsDirectory().appendingPathComponent(filename)
        do {
            try data.write(to: filename, atomically: true, encoding: String.Encoding.utf8)
        } catch {
            // failed to write file – bad permissions, bad filename, missing permissions, or more likely it can't be converted to the encoding
        }
    }
    
    func readFile(){
        file_list.removeAll()
        // Get the document directory url
        let documentsUrl =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        do {
            // Get the directory contents urls (including subfolders urls)
            let directoryContents = try FileManager.default.contentsOfDirectory(at: documentsUrl, includingPropertiesForKeys: nil)
            
            // if you want to filter the directory contents you can do like this:
            let mp3Files = directoryContents.filter{ $0.pathExtension == "txt" }
            let mp3FileNames = mp3Files.map{ $0.deletingPathExtension().lastPathComponent }
            
            var Ascending = mp3FileNames.sorted(by: <)
            print(Ascending)
            print("------------------------")
            
            if !Ascending.isEmpty {
                for i in Ascending {
                    let a = i.components(separatedBy: "_")[0]
                    if a == SubjectName_String {
                        let b = i.components(separatedBy: "_")[1]
                        if b == SelectForceView_String {
                            let c = i.components(separatedBy: "_")[2]
                            if c == RequireTime_String {
                                let d = i.components(separatedBy: "_")[3]
                                if d == RepeatCount_String {
                                    let e = i.components(separatedBy: "_")[4]
                                    if e == StepCount_String {
                                        file_list.append(i.components(separatedBy: "_")[5].trimmingCharacters(in: ["(",")"]))
                                    }
                                }
                            }
                        }
//                        let b = i.components(separatedBy: "_")[1]
//                        if b == RequireTime_String {
//                            let c = i.components(separatedBy: "_")[2]
//                            if c == RepeatCount_String {
//                                let d = i.components(separatedBy: "_")[3]
//                                if d == StepCount_String {
//                                    file_list.append(i.components(separatedBy: "_")[4])
//                                }
//                            }
//                        }
                    }
                }
                
                file_list_end = file_list.sorted()
                if !file_list_end.isEmpty {
                    let current = Int(file_list_end[file_list_end.count - 1])
                    //print(current)
                    if current != file_count || file_count == 1{
                        file_count = current! + 1
                    }
                }
            }
            
        } catch {
            print(error)
        }
    }
    
    func showToast(message : String, font: UIFont) {
        
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 190, y: self.view.frame.size.height-710, width: 100, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 3.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}
