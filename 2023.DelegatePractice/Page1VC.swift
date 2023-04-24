//
//  ViewController.swift
//  2023.DelegatePractice
//
//  Created by 曲奕帆 on 2023/4/23.
//

import UIKit

// 第一頁
class Page1VC: UIViewController, Page2Delegate {
    
    /// label顯示的數字資料，將會被Page2的按鈕所改變。
    /// 當number被改變時，去修改label的資料，將新資料顯示在UI上。
        var number = 0 {
        didSet{
            numberLabel.text = "\(number)"
        }
    }
    
    // 顯示數字的Label
    lazy private var numberLabel: UILabel = {
        let label = UILabel()
        label.text = "\(self.number)"
        label.textAlignment = .center
        label.font = UIFont(name: "HelveticaNeue", size: CGFloat(30))
        return label
    }()
    
    // 進入下一頁的按鈕
    lazy private var nextPageBtn: UIButton = {
        let button = UIButton()
        button.setTitle("下一頁", for: .normal)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue", size: CGFloat(30))
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        
        // 加入Action
        let action = UIAction { _ in
            let page2 = Page2VC()
            // 設定page2的事件將會傳給self
            page2.delegate = self
            
            self.present(page2, animated: true)
        }
        button.addAction(action, for: .touchUpInside)
        
        return button
    }()
    
    // 放置Label與Button的Vertical Stack
    lazy private var vStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.alignment = .fill
        stack.spacing = 20
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
                
        // 排版
        setupView()
    }
    
    // 排版
    private func setupView(){
        // 設定Stack的Layout
        vStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(vStack)
        NSLayoutConstraint.activate([
            vStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            vStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            vStack.heightAnchor.constraint(equalToConstant: 130),
            vStack.widthAnchor.constraint(equalToConstant: 200)
        ])
        // Stack加入Label與Button
        vStack.addArrangedSubview(numberLabel)
        vStack.addArrangedSubview(nextPageBtn)
    }
    
    // Page2的Delegate function
    func plusOneButtonEvent() {
        print("Page1收到事件。")
        
        // 收到點按事件時，number+1
        number += 1
    }
    
}


