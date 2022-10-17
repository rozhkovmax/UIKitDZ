//
//  FourViewController.swift
//  UIKitDZ
//
//  Created by Maxim on 15.10.2022.
//

import UIKit
/// Контроллер Stack View
final class FourViewController: UIViewController {
    
    // MARK: - Visual Components
    private lazy var redView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemRed
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemYellow
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGreen
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var colorStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .black
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        allMethods()
    }
    
    // MARK: - Private Methods
    private func allMethods() {
        view.addSubview(colorStackView)
        colorStackView.addSubview(redView)
        colorStackView.addSubview(yellowView)
        colorStackView.addSubview(greenView)
        createStackViewConstraints()
        createRedViewConstraints()
        createYellowViewConstraints()
        createGreenViewConstraints()
    }
    
    private func createStackViewConstraints() {
        colorStackView.leftAnchor.constraint(equalTo: yellowView.leftAnchor, constant: -10).isActive = true
        colorStackView.rightAnchor.constraint(equalTo: yellowView.rightAnchor, constant: 10).isActive = true
        colorStackView.topAnchor.constraint(equalTo: redView.topAnchor, constant: -10).isActive = true
        colorStackView.bottomAnchor.constraint(equalTo: greenView.bottomAnchor, constant: 10).isActive = true
    }
    
    private func createRedViewConstraints() {
        redView.centerXAnchor.constraint(equalTo: yellowView.centerXAnchor).isActive = true
        redView.widthAnchor.constraint(equalTo: yellowView.widthAnchor).isActive = true
        redView.heightAnchor.constraint(equalTo: yellowView.heightAnchor).isActive = true
        redView.bottomAnchor.constraint(equalTo: yellowView.topAnchor, constant: -10).isActive = true
    }
    
    private func createYellowViewConstraints() {
        yellowView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        yellowView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        yellowView.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25).isActive = true
        yellowView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25).isActive = true
    }
    
    private func createGreenViewConstraints() {
        greenView.centerXAnchor.constraint(equalTo: yellowView.centerXAnchor).isActive = true
        greenView.widthAnchor.constraint(equalTo: yellowView.widthAnchor).isActive = true
        greenView.heightAnchor.constraint(equalTo: yellowView.heightAnchor).isActive = true
        greenView.topAnchor.constraint(equalTo: yellowView.bottomAnchor, constant: 10).isActive = true
    }
}
