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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(textView)
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textView.widthAnchor.constraint(equalTo: view.widthAnchor),
            textView.heightAnchor.constraint(equalToConstant: 32)
        ])
        
        let font = UIFont(name: "HiraKakuProN-W3", size: 16)
        let style = NSMutableParagraphStyle()
        style.minimumLineHeight = 24
        style.maximumLineHeight = 24
        let attrString = NSMutableAttributedString(string: "pqj",
                                                   attributes: [
                                                    NSAttributedString.Key.baselineOffset: 4,
                                                    NSAttributedString.Key.font: font!,
                                                    NSAttributedString.Key.backgroundColor: UIColor(red: 0.2, green: 0.7, blue: 0.8, alpha: 0.5),
                                                    NSAttributedString.Key.paragraphStyle: style
                                                   ])
        textView.attributedText = attrString
    }


}

