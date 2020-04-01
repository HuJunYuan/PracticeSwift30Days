//
//  ViewController.swift
//  Timer
//
//  Created by HuJunYuan on 2020/4/1.
//  Copyright © 2020 HuJunYuan. All rights reserved.
//

import UIKit
import SnapKit


class ViewController: UIViewController {
    var labelNumber: Double = 0
    var result: UILabel!
    var timer: Timer!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }

    func setupUI(){
        let startView = UIView()
        let stopView = UIView()
        result = UILabel()
        
        view.addSubview(result)
        result.textColor = UIColor.blue
        result.snp.makeConstraints{ (make) in
            //make.width.equalTo(view.snp.width)
            make.height.equalTo(100)
            make.top.equalTo(100)
            make.centerX.equalTo(view)
        }
        result.text = "0.00"
        result.font = UIFont.systemFont(ofSize: 30)
        
        // 左下启动view
        startView.backgroundColor = UIColor.yellow
        view.addSubview(startView)
        startView.snp.makeConstraints{(make) in
            make.bottom.equalTo(view).offset(0)
            make.left.equalTo(view).offset(0)
            make.height.equalTo(view.snp.height).multipliedBy(0.5)
            make.width.equalTo(view.snp.width).multipliedBy(0.5)
        }
        
        // 左下启动按钮
        let startBtn:UIButton = UIButton()
        startBtn.setTitle("开始", for: .normal)
        startBtn.setTitleColor(.blue, for: .normal)
        startView.addSubview(startBtn)
        startBtn.snp.makeConstraints{(make) in
            make.centerX.equalTo(startView)
            make.centerY.equalTo(startView)
        }
        startBtn.addTarget(self, action: #selector(startHandler), for: .touchUpInside)
        
        //右下停止view
        stopView.backgroundColor = UIColor.red
        view.addSubview(stopView)
        stopView.snp.makeConstraints{ (make) in
            make.bottom.equalTo(view).offset(0)
            make.right.equalTo(view).offset(0)
            make.width.equalTo(view.snp.width).multipliedBy(0.5)
            make.height.equalTo(view.snp.height).multipliedBy(0.5)
        }
        
        // 右下停止按钮
        let stopBtn:UIButton = UIButton()
        stopBtn.setTitle("停止", for: .normal)
        stopBtn.setTitleColor(.white, for: .normal)
        stopView.addSubview(stopBtn)
        stopBtn.snp.makeConstraints{(make) in
            make.centerX.equalTo(stopView)
            make.centerY.equalTo(stopView)
        }
        stopBtn.addTarget(self, action: #selector(stopHandler), for: .touchUpInside)
    }
    
    @objc func startHandler(){
        if self.timer != nil {
            self.stopHandler()
        }
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true){ (Timer) in
            self.labelNumber = self.labelNumber + 0.01
            self.result.text = String(format: "%.2f", self.labelNumber)
            
        }
        self.timer.fire()
    }
    
    @objc func stopHandler() {
        guard let timerForDistory = self.timer
            else {return}
        timerForDistory.invalidate()
    }

}

