//
//  Builder.swift
//  Finance
//
//  Created by Дарья Литвинова on 22.07.2025.
//

import UIKit

class ViewBuilder {
    static let shared = ViewBuilder()
    
    func buildLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .left
        label.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        return label
    }
    
    func buildStack(arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis) -> UIStackView {
        let stack = UIStackView(arrangedSubviews: arrangedSubviews)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = axis
        stack.distribution = .equalSpacing
        stack.alignment = .center
        
        return stack
    }
    
    func buildTextField(placeholder: String) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = .mainText
        textField.layer.cornerRadius = 5
        textField.font = .systemFont(ofSize: 16, weight: .regular)
        
        return textField
    }
    
    func buildDatePicker(date: Date) -> UIDatePicker {
        let datePicker = UIDatePicker()
        datePicker.date = date
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.tintColor = .accent
        
        return datePicker
    }
    
    func buildTextFieldWithLabel(labelText: String, placeholder: String) -> UIStackView {
        let label = buildLabel(text: labelText)
        
        let textField = buildTextField(placeholder: placeholder)
        
        let hStack = buildStack(arrangedSubviews: [label, textField], axis: NSLayoutConstraint.Axis.horizontal)
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: hStack.leadingAnchor),
            label.centerYAnchor.constraint(equalTo: hStack.centerYAnchor),
            textField.leadingAnchor.constraint(equalTo: label.trailingAnchor),
            textField.centerYAnchor.constraint(equalTo: hStack.centerYAnchor),
            textField.trailingAnchor.constraint(equalTo: hStack.trailingAnchor),
        ])
        return hStack
    }
    
    func buildDatePickerWithLabel(labelText: String, date: Date = Date()) -> UIStackView {
        let label = buildLabel(text: labelText)
        
        let datePicker = buildDatePicker(date: date)
        
        let hStack = buildStack(arrangedSubviews: [label, datePicker], axis: NSLayoutConstraint.Axis.horizontal)
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: hStack.leadingAnchor),
            label.centerYAnchor.constraint(equalTo: hStack.centerYAnchor),
            datePicker.centerYAnchor.constraint(equalTo: hStack.centerYAnchor),
            datePicker.leadingAnchor.constraint(equalTo: label.trailingAnchor),
            datePicker.trailingAnchor.constraint(greaterThanOrEqualTo: hStack.trailingAnchor, constant:  0),
        ])
        //datePicker.setContentHuggingPriority(.defaultLow, for: .horizontal)
        
        return hStack
    }
    
    func buildCreateView() -> UIView {
        let dateStack = buildDatePickerWithLabel(labelText: "Дата")
        let amountStack = buildTextFieldWithLabel(labelText: "Сумма", placeholder: "0")
        let noteStack = buildTextFieldWithLabel(labelText: "Комментарий", placeholder: "не обязательно")
        
        let vStack = buildStack(arrangedSubviews: [dateStack, amountStack, noteStack], axis: NSLayoutConstraint.Axis.vertical)
        vStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dateStack.leadingAnchor.constraint(equalTo: vStack.leadingAnchor),
            dateStack.trailingAnchor.constraint(equalTo: vStack.trailingAnchor),
            dateStack.topAnchor.constraint(equalTo: vStack.topAnchor),
            amountStack.leadingAnchor.constraint(equalTo: vStack.leadingAnchor),
            amountStack.trailingAnchor.constraint(equalTo: vStack.trailingAnchor),
            amountStack.topAnchor.constraint(equalTo: dateStack.bottomAnchor),
            noteStack.leadingAnchor.constraint(equalTo: vStack.leadingAnchor),
            noteStack.trailingAnchor.constraint(equalTo: vStack.trailingAnchor),
            noteStack.topAnchor.constraint(equalTo: amountStack.bottomAnchor),
            noteStack.bottomAnchor.constraint(equalTo: vStack.bottomAnchor)
            ])

        return vStack
    }
}
