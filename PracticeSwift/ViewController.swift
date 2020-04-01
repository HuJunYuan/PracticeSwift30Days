//
//  ViewController.swift
//  PracticeSwift
//
//  Created by jerold on 2020/4/1.
//  Copyright © 2020 jerold. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    let label = UILabel()
    var fonts = [String]()
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }
    
    func setupUI() {
        getFontNames()
        view.backgroundColor = UIColor.gray
        view.addSubview(changeButton)
        label.text = "Hello World"
        label.textAlignment = NSTextAlignment.center
        view.addSubview(label)
        label.snp.makeConstraints{ (make) in
            make.top.equalTo(view).offset(80)
            make.centerX.equalTo(view)
        }
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 30)
    }
    
    lazy var changeButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("点击更新", for: .normal)
        btn.frame = CGRect(x: 50, y: 300, width: 100, height: 50)
        btn.backgroundColor = UIColor.green
        btn.addTarget(self, action: #selector(changeFontFamily), for: .touchUpInside)
        return btn
    }()
    
    @objc func changeFontFamily(){
        label.font = UIFont(name: fonts[index], size: 30)
        index += 1
    }
    
    func getFontNames(){
        let familyNames = UIFont.familyNames
        for familyName in familyNames {
            let fontNames = UIFont.fontNames(forFamilyName: familyName)
            for fontName in fontNames {
                fonts.append(fontName)
            }
        }
    }
    
}

