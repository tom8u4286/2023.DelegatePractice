//
//  PageTwoVC.swift
//  2023.DelegatePractice
//
//  Created by 曲奕帆 on 2023/4/23.
//


import UIKit

// 第二頁
class PageTwoVC: UIViewController {
    
    // 進入下一頁的按鈕
    lazy private var addBtn: UIButton = {
        let button = UIButton()
        button.setTitle("+1", for: .normal)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue", size: CGFloat(30))
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 淺黃色背景
        view.backgroundColor = UIColor(red: 254/255, green: 251/255, blue: 155/255, alpha: 1.00)
        
        setupView()
    }

    // 排版
    private func setupView(){
        addBtn.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addBtn)
        NSLayoutConstraint.activate([
            addBtn.heightAnchor.constraint(equalToConstant: 80),
            addBtn.widthAnchor.constraint(equalToConstant: 200),
            addBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }
}