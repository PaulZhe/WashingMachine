//
//  TimePickerView.swift
//  WashingMachine
//
//  Created by zhangzhe on 2020/6/2.
//  Copyright © 2020 zhangzhe. All rights reserved.
//

import UIKit

class TimePickerView: UIView {
    
    let containerView = UIView(frame: .zero)
    let confirmButton = UIButton(type: .roundedRect)
    let cancelButton = UIButton(type: .roundedRect)
    let picker = UIPickerView(frame: .zero)
    weak var parentVC: UIViewController?
    
    init(parentVC: UIViewController) {
        super.init(frame: .zero)
        self.parentVC = parentVC
        configTimePicker()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configTimePicker()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configTimePicker() {

        self.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(clickCancelButton))
        self.addGestureRecognizer(gesture)
        
        containerView.backgroundColor = UIColor.white
        self.addSubview(containerView)
        containerView.addSubview(picker)
        containerView.addSubview(confirmButton)
        containerView.addSubview(cancelButton)
        containerView.snp_makeConstraints { (maker) in
            maker.left.equalToSuperview()
            maker.bottom.equalToSuperview()
            maker.right.equalToSuperview()
            maker.height.equalTo(250)
        }
        
        picker.backgroundColor = UIColor.white
        picker.clipsToBounds = true
        picker.snp_makeConstraints { (maker) in
            maker.left.equalToSuperview()
            maker.bottom.equalToSuperview()
            maker.right.equalToSuperview()
            maker.height.equalTo(216)
        }
        
        confirmButton.addTarget(self, action: #selector(clickConfirmButton), for: .touchUpInside)
        confirmButton.setTitle("确认", for: .normal)
        confirmButton.setTitleColor(UIColor(red:0.40, green:0.82, blue:0.55, alpha:1.00), for: .normal)
        confirmButton.titleLabel?.textAlignment = .right
        confirmButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        confirmButton.snp_makeConstraints { (maker) in
            maker.width.equalTo(100)
            maker.top.equalToSuperview().offset(10)
            maker.right.equalToSuperview().offset(-20)
            maker.height.equalTo(24)
        }
        
        cancelButton.addTarget(self, action: #selector(clickCancelButton), for: .touchUpInside)
        cancelButton.setTitle("取消", for: .normal)
        cancelButton.setTitleColor(UIColor(red:0.40, green:0.82, blue:0.55, alpha:1.00), for: .normal)
        cancelButton.titleLabel?.textAlignment = .left
        cancelButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        cancelButton.snp_makeConstraints { (maker) in
            maker.width.equalTo(100)
            maker.top.equalToSuperview().offset(10)
            maker.left.equalToSuperview().offset(20)
            maker.height.equalTo(24)
        }
    }
    
    @objc private func clickCancelButton() {
        self.removeFromSuperview()
    }
    
    @objc private func clickConfirmButton() {
        parentVC?.navigationController?.pushViewController(WorkingViewController(hours: picker.selectedRow(inComponent: 0), minutes: picker.selectedRow(inComponent: 1)), animated: true)
        self.removeFromSuperview()
    }
}
