//
//  ClothesSelectionViewController.swift
//  WashingMachine
//
//  Created by zhangzhe on 2020/6/3.
//  Copyright © 2020 zhangzhe. All rights reserved.
//

import UIKit

class ClothesSelectionViewController: UIViewController {

    let machineImageView = UIImageView(frame: .zero)
    let villusButton = SelectionButton(frame: .zero)
    let cowboyButton = SelectionButton(frame: .zero)
    let woolButton = SelectionButton(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        // Do any additional setup after loading the view.
    }
    
    private func setupViews() {
        self.view.backgroundColor = UIColor.white
        self.title = "衣物种类选择页面"
        
        machineImageView.image = UIImage(named: "洗衣机")
        self.view.addSubview(machineImageView)
        machineImageView.snp_makeConstraints { (maker) in
            maker.top.equalToSuperview().offset(150)
            maker.left.equalToSuperview().offset(107)
            maker.width.equalTo(200)
            maker.height.equalTo(200)
        }
        
        let left = (UIScreen.main.bounds.width - SelectionButton.SelectionButtonSize.width) / 2
        
        villusButton.setTitle("绒毛类", for: .normal)
        villusButton.addTarget(self, action: #selector(clickButton), for: .touchUpInside)
        self.view.addSubview(villusButton)
        villusButton.snp_makeConstraints { (maker) in
            maker.top.equalTo(machineImageView.snp_bottom).offset(50)
            maker.left.equalTo(left)
            maker.width.equalTo(SelectionButton.SelectionButtonSize.width)
            maker.height.equalTo(SelectionButton.SelectionButtonSize.height)
        }
        
        cowboyButton.setTitle("牛仔类", for: .normal)
        cowboyButton.addTarget(self, action: #selector(clickButton), for: .touchUpInside)
        self.view.addSubview(cowboyButton)
        cowboyButton.snp_makeConstraints { (maker) in
            maker.top.equalTo(villusButton.snp_bottom).offset(30)
            maker.left.equalTo(left)
            maker.width.equalTo(SelectionButton.SelectionButtonSize.width)
            maker.height.equalTo(SelectionButton.SelectionButtonSize.height)
        }
        
        woolButton.setTitle("羊毛类", for: .normal)
        woolButton.addTarget(self, action: #selector(clickButton), for: .touchUpInside)
        self.view.addSubview(woolButton)
        woolButton.snp_makeConstraints { (maker) in
            maker.top.equalTo(cowboyButton.snp_bottom).offset(30)
            maker.left.equalTo(left)
            maker.width.equalTo(SelectionButton.SelectionButtonSize.width)
            maker.height.equalTo(SelectionButton.SelectionButtonSize.height)
        }
    }

}

// MARK: Actions
extension ClothesSelectionViewController {
    @objc private func clickButton() {
        TimePickerService.showTimePicker(parentVC: self)
    }
}

// MARK: UIPickerViewDelegate, UIPickerViewDataSource
extension ClothesSelectionViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return 5
        } else {
            return 60
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return "\(row)小时"
        } else {
            return "\(row)分钟"
        }
    }
}
