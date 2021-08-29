//
//  CustomTextView.swift
//  Sample_NSAttributedString
//
//  Created by 冨田康介 on 2021/08/23.
//

import UIKit

class CustomTextView: UIView {
    var attributedText: NSAttributedString

    override init(frame: CGRect) {
        attributedText = NSMutableAttributedString()
        super.init(frame: frame)
        
        self.backgroundColor = .clear
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.black.cgColor
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func drawView() {
        self.setNeedsLayout()
    }
    
    override func draw(_ rect: CGRect) {
        attributedText.draw(at: self.bounds.origin)
    }
    
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
