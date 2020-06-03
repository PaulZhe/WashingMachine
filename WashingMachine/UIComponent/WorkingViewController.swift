//
//  WorkingViewController.swift
//  WashingMachine
//
//  Created by zhangzhe on 2020/6/2.
//  Copyright © 2020 zhangzhe. All rights reserved.
//

import UIKit
import WebKit

class WorkingViewController: UIViewController {
    
    let defaultHours: Int
    let defaultMinutes: Int
    let progressView = UIProgressView(progressViewStyle: .default)
    let workingWebView = WKWebView(frame: .zero)
    let finishLabel = UILabel(frame: .zero)
    
    init(hours: Int, minutes: Int) {
        defaultHours = hours
        defaultMinutes = minutes
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        self.view.backgroundColor = UIColor.white

        self.view.addSubview(workingWebView)
        self.view.addSubview(progressView)
        self.view.addSubview(finishLabel)
        
        workingWebView.snp_makeConstraints { (maker) in
            maker.top.equalToSuperview().offset(150)
            maker.width.equalTo(212)
            maker.height.equalTo(128)
            maker.left.equalToSuperview().offset(101)
        }
        
        progressView.snp_makeConstraints { (maker) in
            maker.top.equalTo(workingWebView.snp_bottom).offset(50)
            maker.width.equalTo(212)
            maker.height.equalTo(16)
            maker.left.equalToSuperview().offset(101)
        }
        
        finishLabel.snp_makeConstraints { (maker) in
            maker.top.equalTo(progressView.snp_bottom).offset(50)
            maker.width.equalTo(212)
            maker.height.equalTo(30)
            maker.left.equalToSuperview().offset(101)
        }
        
        progressView.setProgress(1, animated: true)
        progressView.progressTintColor = UIColor(red:0.40, green:0.82, blue:0.55, alpha:1.00)
        
        finishLabel.textColor = UIColor(red:0.40, green:0.82, blue:0.55, alpha:1.00)
        finishLabel.textAlignment = .center
        finishLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        finishLabel.text = "洗衣完成！"
        finishLabel.isHidden = false
        
        guard let path = Bundle.main.path(forResource: "WashingMachine", ofType: "gif") else { return }
        workingWebView.isUserInteractionEnabled = false
        workingWebView.load(URLRequest(url: URL(fileURLWithPath: path)))
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
