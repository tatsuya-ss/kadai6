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
    
    // 答えはLabelで持たず、プロパティとして持ちましょう。
    // 例えば答えを漢字でラベルに表示する（例：二十四）という仕様変更があった場合、
    // ラベルから答えを取り出すのが困難になってしまいます。
    private var answer: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetAnswer()
        updateLabel()
    }
    
    @IBAction func judgeButton(_ sender: Any) {
        let message: String
        
        let sliderValue = Int(slider.value)
        
        if sliderValue == answer {
            message = "あたり！あなたの値は\(sliderValue)"
        } else {
            message = "ハズレ！あなたの値は\(sliderValue)"
        }
        
        presentJudgment(message: message)
        
        resetAnswer()
        updateLabel()
    }
    
    private func presentJudgment(message: String) {
        let alert = UIAlertController(title: "結果", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "再挑戦", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    private func updateLabel() {
        randomLabel.text = String(answer)
    }
    
    private func resetAnswer() {
        answer = Int(arc4random_uniform(100) + 1)
    }
}
