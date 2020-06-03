//
//  SelectionButton.swift
//  WashingMachine
//
//  Created by zhangzhe on 2020/6/2.
//  Copyright © 2020 zhangzhe. All rights reserved.
//

import UIKit

class SelectionButton: UIButton {
    
    static let SelectionButtonSize = CGSize(width: 300, height: 30)

    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        configUI()
    }
    
    private func configUI() {
        self.backgroundColor = UIColor(red:0.40, green:0.82, blue:0.55, alpha:1.00)
        self.titleLabel?.textColor = UIColor.white
        self.titleLabel?.textAlignment = .center
        self.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        self.layer.cornerRadius = SelectionButton.SelectionButtonSize.height / 2
    }
}
