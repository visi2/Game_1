//
//  ViewController.swift
//  Game_1
//
//  Created by Andrew Kvasha on 26.08.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let nameLabel = UILabel()
    let label = UILabel()
    let model = FirstGame()

    override func viewDidLoad() {
        super.viewDidLoad()

        configuration()
    }
    
    override func viewDidAppear(_ animated: Bool) {
    
        let alert = UIAlertController(title: "Add Name", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        let action = UIAlertAction(title: "Ok", style: .default) { _ in
            self.nameLabel.text = alert.textFields?.first?.text
        }
        
        alert.addTextField()
        alert.addAction(action)
        present(alert, animated: true)
    }
}

extension ViewController {
    
    private func configuration() {
        
        let firstButton = UIButton()
        let secondButton = UIButton()
        
        view.backgroundColor = .white
        
        nameLabel.textColor = .black
        label.textColor = .black
        
        firstButton.setTitle("Сложение", for: .normal)
        firstButton.backgroundColor = .blue
        
        secondButton.backgroundColor = .blue
        secondButton.setTitle("Угадайка", for: .normal)
        
        view.addSubview(nameLabel)
        view.addSubview(firstButton)
        view.addSubview(secondButton)
        view.addSubview(label)
        
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(100)
        }
                          
        firstButton.snp.makeConstraints { make in
            make.centerX.equalTo(nameLabel)
            make.centerY.equalTo(nameLabel).offset(50)
            make.left.equalToSuperview().offset(100)
        }
        
        secondButton.snp.makeConstraints { make in
            make.centerX.equalTo(firstButton)
            make.centerY.equalTo(firstButton).offset(50)
            make.left.equalTo(firstButton)
        }
        
        label.snp.makeConstraints { make in
            make.centerX.equalTo(secondButton)
            make.centerY.equalTo(secondButton).offset(50)
            make.left.equalTo(secondButton)
        }
        
        
        firstButton.addTarget(self, action: #selector(clickOne) , for: .touchUpInside)
        secondButton.addTarget(self, action: #selector(clickTwo) , for: .touchUpInside)
        
    }
    
    @objc func clickOne() {
        let alert = UIAlertController(title: "Введите число", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        let action = UIAlertAction(title: "Ok", style: .default) { action in
            guard let first = Int((alert.textFields?[0].text)!) else { return }
            guard let second = Int((alert.textFields?[1].text)!) else { return }
            
            let result = String(FirstGame.addNumber(first: first, second: second))
            self.label.text = result
            print(result)
        }
        alert.addAction(action)
        
        alert.addTextField { (textField) in
            textField.placeholder = "First number"
            textField.keyboardType = .numberPad
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Second number"
            textField.keyboardType = .numberPad
            
        }
        
        present(alert, animated: true)
    }
    
    @objc func clickTwo() {
        let alert = UIAlertController(title: "Задумай число от 0 до 10", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        let action = UIAlertAction(title: "Ok", style: .default) { action in
            let randonNumber = Int.random(in: 0...10)
            self.label.text = String(randonNumber)
        }
        alert.addAction(action)
        present(alert, animated: true)
    }
}

