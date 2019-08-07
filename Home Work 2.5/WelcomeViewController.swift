//
//  WelcomeViewController.swift
//  Home Work 2.5
//
//  Created by Maksim Grebenozhko on 07/08/2019.
//  Copyright © 2019 Maksim Grebenozhko. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var userNameLabel: UILabel!

    var userName = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        styledTextFor(label: userNameLabel, plainText:
            """
            Welcome,
            comrade\n
            """,
            textForStyling: "\(userName)!")
    }
    @IBAction func didCancelButton() {
        dismiss(animated: true)
    }
}

extension WelcomeViewController {

    private func styledTextFor(label: UILabel, plainText: String, textForStyling: String) {
        let text = "\(plainText) \(textForStyling)"
        let styledText = NSMutableAttributedString(string: text)
        let attributes =
            [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: label.font.pointSize),
             NSAttributedString.Key.foregroundColor: UIColor.red]
        let nameRange = (text as NSString).range(of: textForStyling)
        styledText.setAttributes(attributes, range: nameRange)
        
        label.attributedText = styledText
    }
}
