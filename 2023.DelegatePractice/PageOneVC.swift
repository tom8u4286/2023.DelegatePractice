//
//  ViewController.swift
//  2023.DelegatePractice
//
//  Created by 曲奕帆 on 2023/4/23.
//

import UIKit

class PageOneVC: UIViewController {
    
    // label顯示的數字資料
    // 將會被Page2的按鈕所改變
    var number = 0
    
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
    
    


}




