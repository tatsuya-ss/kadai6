//
//  ViewController.swift
//  kadai6
//
//  Created by 坂本龍哉 on 2020/12/13.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private var randomLabel: UILabel!
    @IBOutlet private var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        random()
    }
    
    @IBAction func judgeButton(_ sender: Any) {
        let sliderValue = String(Int(slider.value))
        guard randomLabel.text != sliderValue else {
            judge(message: "あたり！あなたの値は\(sliderValue)")
            random()
            return
        }
        judge(message: "ハズレ！あなたの値は\(sliderValue)")
        random()
    }
    
    private func judge(message: String) {
        let alert = UIAlertController(title: "結果", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "再挑戦", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func random() {
        randomLabel.text = String(arc4random_uniform(100) + 1)
    }
}

