//
//  ViewController.swift
//  Scatter
//
//  Created by Alexander Supe on 1/25/20.
//  Copyright © 2020 Alexander Supe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    var isScattered = true { didSet { if isScattered { unscatter() } else { scatter() } }}
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    @IBOutlet weak var image: UIImageView!
    var labels: [UILabel]!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        image.image = UIImage(imageLiteralResourceName: "lambda_logo")
        labels = [label1, label2, label3, label4, label5, label6]
    }
    
    // MARK: - IBActions
    @IBAction func toggleButtonPressed(_ sender: Any) {
        isScattered.toggle()
    }
    
    func scatter() {
        UIView.animate(withDuration: 2) {
            self.image.alpha = 0
            for label in self.labels {
                label.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: 0...CGFloat.pi)).concatenating(CGAffineTransform(translationX: CGFloat.random(in: -100...100), y: CGFloat.random(in: 50...400)))
                label.backgroundColor = UIColor.random()
                label.textColor = UIColor.random()
            }
        }
    }
   
    func unscatter() {
        UIView.animate(withDuration: 2) {
            self.image.alpha = 1
            for label in self.labels {
                label.transform = .identity
                label.textColor = .black
                label.backgroundColor = .clear
            }
        }
    }
    
}

extension UIColor {
    static func random() -> UIColor{
        return UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: CGFloat.random(in: 0.5...1))
    }
}
