//
//  TimePickerService.swift
//  WashingMachine
//
//  Created by zhangzhe on 2020/6/2.
//  Copyright © 2020 zhangzhe. All rights reserved.
//

import UIKit

class TimePickerService {
    static func showTimePicker(parentVC: UIViewController) {
        let pickerView = TimePickerView(parentVC: parentVC)
        pickerView.frame = UIScreen.main.bounds
        pickerView.picker.delegate = parentVC as? UIPickerViewDelegate
        pickerView.picker.dataSource = parentVC as? UIPickerViewDataSource
        parentVC.view.addSubview(pickerView)
    }
}
