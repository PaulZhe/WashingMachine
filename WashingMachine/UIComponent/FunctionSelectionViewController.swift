//
//  FunctionSelectionViewController.swift
//  WashingMachine
//
//  Created by zhangzhe on 2020/6/2.
//  Copyright © 2020 zhangzhe. All rights reserved.
//

import UIKit
import SnapKit

class FunctionSelectionViewController: UIViewController {
    
    let machineImageView = UIImageView(frame: .zero)
    let washButton = SelectionButton(frame: .zero)
    let rinseButton = SelectionButton(frame: .zero)
    let spinDryButton = SelectionButton(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        // Do any additional setup after loading the view.
    }
    
    private func setupViews() {
        self.view.backgroundColor = UIColor.white
        self.title = "简易滚轮洗衣机"
        
        machineImageView.image = UIImage(named: "洗衣机")
        self.view.addSubview(machineImageView)
        machineImageView.snp_makeConstraints { (maker) in
            maker.top.equalToSuperview().offset(150)
            maker.left.equalToSuperview().offset(107)
            maker.width.equalTo(200)
            maker.height.equalTo(200)
        }
        
        let left = (UIScreen.main.bounds.width - SelectionButton.SelectionButtonSize.width) / 2
        
        washButton.setTitle("洗涤", for: .normal)
        washButton.addTarget(self, action: #selector(clickWashButton), for: .touchUpInside)
        self.view.addSubview(washButton)
        washButton.snp_makeConstraints { (maker) in
            maker.top.equalTo(machineImageView.snp_bottom).offset(50)
            maker.left.equalTo(left)
            maker.width.equalTo(SelectionButton.SelectionButtonSize.width)
            maker.height.equalTo(SelectionButton.SelectionButtonSize.height)
        }
        
        rinseButton.setTitle("漂洗", for: .normal)
        rinseButton.addTarget(self, action: #selector(clickRinseButton), for: .touchUpInside)
        self.view.addSubview(rinseButton)
        rinseButton.snp_makeConstraints { (maker) in
            maker.top.equalTo(washButton.snp_bottom).offset(30)
            maker.left.equalTo(left)
            maker.width.equalTo(SelectionButton.SelectionButtonSize.width)
            maker.height.equalTo(SelectionButton.SelectionButtonSize.height)
        }
        
        spinDryButton.setTitle("脱水", for: .normal)
        spinDryButton.addTarget(self, action: #selector(clickSpinDryButton), for: .touchUpInside)
        self.view.addSubview(spinDryButton)
        spinDryButton.snp_makeConstraints { (maker) in
            maker.top.equalTo(rinseButton.snp_bottom).offset(30)
            maker.left.equalTo(left)
            maker.width.equalTo(SelectionButton.SelectionButtonSize.width)
            maker.height.equalTo(SelectionButton.SelectionButtonSize.height)
        }
    }
}


// MARK: Actions
extension FunctionSelectionViewController {
    @objc private func clickSpinDryButton() {
        TimePickerService.showTimePicker(parentVC: self)
    }
    
    @objc private func clickWashButton() {
        self.navigationController?.pushViewController(ClothesSelectionViewController(), animated: true)
    }
    
    @objc private func clickRinseButton() {
        self.navigationController?.pushViewController(ClothesSelectionViewController(), animated: true)
    }
}

// MARK: UIPickerViewDelegate, UIPickerViewDataSource
extension FunctionSelectionViewController: UIPickerViewDelegate, UIPickerViewDataSource {
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
