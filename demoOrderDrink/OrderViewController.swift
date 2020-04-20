//
//  OrderViewController.swift
//  demoOrderDrink
//
//  Created by Daniel on 2020/4/12.
//  Copyright © 2020 Daniel. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    let drinkNameArray = ["請選擇你想要喝的飲料",drink1.title,drink2.title,drink3.title,drink4.title,drink5.title,drink6.title,drink7.title,drink8.title,drink9.title,drink10.title,drink11.title,drink12.title]
    //讓keyboard按下retrun會收回
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    //實作PickerView內容
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return drinkNameArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return drinkNameArray[row]
    }
    //要讓textfield顯示pickerview內容
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row == 0{
            drinkTextField.text = drinkNameArray[0]
        }else{
            let selectrow = drinkNameArray[row]
            drinkTextField.text = selectrow
        }
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var drinkPickerView: UIPickerView!
    @IBOutlet weak var iceSegmentedControl: UISegmentedControl!
    @IBOutlet weak var sugerSegmentedControl: UISegmentedControl!
    @IBOutlet weak var drinkTextField: UITextField!
    @IBOutlet weak var bubbleSegmentedControl: UISegmentedControl!
    @IBOutlet weak var capacitySegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        drinkTextField.text = drinkNameArray[0]
    }
    
    func alert(title:String, message:String, preferredStyle:UIAlertController.Style){
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: .none)
        controller.addAction(okAction)
        present(controller, animated: true, completion: nil)
    }
    
    @IBAction func order(_ sender: Any) {
        if nameTextField.text?.isEmpty == true{
            alert(title: "你好像忘記了什麼喔～", message: "請記得填上姓名～", preferredStyle: .alert)
        }
        let userName = nameTextField.text ?? ""
        let drinkName = drinkTextField.text!
        print(drinkName)
        let iceselectInt = iceSegmentedControl.selectedSegmentIndex
        let ice = iceSegmentedControl.titleForSegment(at: iceselectInt) ?? ""
        let sugerselectInt = sugerSegmentedControl.selectedSegmentIndex
        let suger = sugerSegmentedControl.titleForSegment(at: sugerselectInt) ?? ""
        let bubbleselectInt = bubbleSegmentedControl.selectedSegmentIndex
        let bubble = bubbleSegmentedControl.titleForSegment(at: bubbleselectInt) ?? ""
        let capacityInt = capacitySegmentedControl.selectedSegmentIndex
        let capacity = capacitySegmentedControl.titleForSegment(at: capacityInt) ?? ""
        
        let url = URL(string: "https://sheetdb.io/api/v1/egm9oej0f2byk")
        var urlRequset = URLRequest(url: url!)
        urlRequset.httpMethod = "POST"
        urlRequset.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let orderdrink = OrderDrink(name: userName, drinkname: drinkName, ice: ice, suger: suger, bubble: bubble, capacity:capacity)
        let orderdrinkData = OrderDrinkData(data: [orderdrink])
        let jsonEncoder = JSONEncoder()
        if let data = try? jsonEncoder.encode(orderdrinkData){
            URLSession.shared.uploadTask(with: urlRequset, from: data) { (retData, res, err) in
                let decoder = JSONDecoder()
                if let retData = retData, let dic = try? decoder.decode([String:Int].self, from: retData), dic["created"] == 1{
                    DispatchQueue.main.async {
                        //解析完畫面要回到怎樣的狀態
                        self.nameTextField.text = ""
                        self.drinkTextField.text = self.drinkNameArray[0]
                        self.iceSegmentedControl.selectedSegmentIndex = 0
                        self.sugerSegmentedControl.selectedSegmentIndex = 0
                        self.bubbleSegmentedControl.selectedSegmentIndex = 0
                        self.capacitySegmentedControl.selectedSegmentIndex = 0
                    }
                }
            }.resume()
            alert(title: "訂購完成", message: "現在就等peter了", preferredStyle: .alert)
        }
        
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
