//
//  DayPickerView.swift
//  Bridge
//
//  Created by Artem Karmaz on 4/20/19.
//  Copyright © 2019 Artem Karmaz. All rights reserved.
//

import UIKit

//extension ViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        return UITableViewCell()
//    }
//
//
//}

protocol DayPickerViewDataSouce {
    func dayPickerCount(_ dayPickerCount: DayPickerView) -> Int
    func dayPickerTitle(_ dayPicker: DayPickerView, indexPath: IndexPath) -> String
}

class DayPickerView: UIControl {
    public var dataSource: DayPickerViewDataSouce? {
        didSet {
            setupView()
        }
    }
    
    private var buttons: [UIButton] = []
    private var stackView: UIStackView!
    
    // чтобы стек работал надо переопредитть метод
    override func layoutSubviews() {
        super.layoutSubviews()
        stackView.frame = bounds // фрейм будет равен баундсу элемента
    }
    
    func setupView() {
        let count = dataSource?.dayPickerCount(self)
        for item in 0..<count! {
            let indexPath = IndexPath(row: item, section: 0)
            let title = dataSource?.dayPickerTitle(self, indexPath: indexPath)
            let button = UIButton(type: .system)
            button.setTitle(title, for: .normal)
            button.tag = item
            button.setTitleColor(.lightGray, for: .normal)
            button.setTitleColor(.white, for: .selected)
            button.addTarget(self, action: #selector(selectedButton(sender:)), for: .touchUpInside)
            buttons.append(button)
            self.addSubview(button)
        }
        
        stackView = UIStackView(arrangedSubviews: self.buttons)
        self.addSubview(stackView)
        stackView.spacing = 8
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing //растягивание
    }
    
    @objc func selectedButton(sender: UIButton) {
        for b in buttons {
            b.isSelected = false
        }
        let index = sender.tag
        let button = self.buttons[index]
        button.isSelected = true
        print(#function)
    }
    // для кода обязательно нужен инит
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
}
