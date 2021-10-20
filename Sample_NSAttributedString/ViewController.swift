//
//  ViewController.swift
//  Sample_NSAttributedString
//
//  Created by 冨田康介 on 2021/08/23.
//

import UIKit

class ViewController: UIViewController {
//    var textView = UITextView()
    var textView = CustomTextView()
    var button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        button.setTitle("設定画面へ", for: .normal)
        button.backgroundColor = .link
        button.titleEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        
        view.addSubview(textView)
        view.addSubview(button)
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textView.widthAnchor.constraint(equalTo: view.widthAnchor),
            textView.heightAnchor.constraint(equalToConstant: 32),
            
            button.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 100),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            button.widthAnchor.constraint(equalTo: view.widthAnchor),
//            button.heightAnchor.constraint(equalToConstant: 44),
        ])
        
        let font = UIFont(name: "HiraKakuProN-W3", size: 22)
        let style = NSMutableParagraphStyle()
        style.minimumLineHeight = 24
        style.maximumLineHeight = 24
        
        let attrString = NSMutableAttributedString(string: "pqj",
                                                   attributes: [
//                                                    NSAttributedString.Key.baselineOffset: 4,
                                                    NSAttributedString.Key.font: font!,
                                                    NSAttributedString.Key.backgroundColor: UIColor(red: 0.2, green: 0.7, blue: 0.8, alpha: 0.5),
                                                    NSAttributedString.Key.paragraphStyle: style
                                                   ])
        textView.attributedText = attrString
    }
    
    @objc func tapButton() {
        let vc = LoggingSettingViewController()
        let nc = UINavigationController(rootViewController: vc)
        self.present(nc, animated: true, completion: nil)
    }


}

