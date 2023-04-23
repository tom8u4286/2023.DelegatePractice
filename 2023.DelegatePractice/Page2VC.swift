//
//  PageTwoVC.swift
//  2023.DelegatePractice
//
//  Created by 曲奕帆 on 2023/4/23.
//


import UIKit

// 第二頁
class Page2VC: UIViewController {
    
    /// 宣告一個delegate，代表Page1。
    /// (Page1中會assign自己給此delegate)
    /// 因此我們呼叫delegate的function(plusOneEvent)時，
    /// Page1的function就會被呼叫。
    var delegate: Page2Delegate!
    
    // 進入下一頁的按鈕
    lazy private var addBtn: UIButton = {
        let button = UIButton()
        button.setTitle("+1", for: .normal)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue", size: CGFloat(30))
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        
        /// 由於delegate遵循Page2Delegate，因此可以直接呼叫其plusOneEvent函數。
        let actionTouchUp = UIAction { _ in
            self.delegate.plusOneEvent()
            button.backgroundColor = .systemBlue
        }
        button.addAction(actionTouchUp, for: .touchUpInside)
        
        // 點下按鈕時，button將短暫改變顏色
        let actionTouchDown = UIAction { _ in
            button.backgroundColor = .buttonClickedBlue
        }
        button.addAction(actionTouchDown, for: .touchDown)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 淺黃色背景
        view.backgroundColor = .lightWhite
        
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
