//
//  CustomLabel.swift
//  test7
//
//  Created by Young Ju on 3/13/22.
//

import UIKit

class CustomLabel: UILabel {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBDesignable class CustomLabel: UILabel {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.setup()

    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
    }

    private func setup() {
        self.textColor = UIColor.blue
        self.topAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive=true
//        self.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive=true
        self.widthAnchor.constraint(equalToConstant: 150).isActive=true
        self.heightAnchor.constraint(equalToConstant: 60).isActive=true
        self.text = ""

    }
    }
}


