//
//  ThirdViewController.swift
//  UIKitDZ
//
//  Created by Maxim on 15.10.2022.
//

import UIKit
/// Контроллер NSLayoutAnchor
final class ThirdViewController: UIViewController {
    
    // MARK: - Visual Components
    private lazy var blackView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
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
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        allMethods()
    }
    
    // MARK: - Private Methods
    private func allMethods() {
        view.addSubview(blackView)
        view.addSubview(redView)
        view.addSubview(yellowView)
        view.addSubview(greenView)
        createBlackViewConstraints()
        createRedViewConstraints()
        createYellowViewConstraints()
        createGreenViewConstraints()
    }
    
    private func createBlackViewConstraints() {
        blackView.leftAnchor.constraint(equalTo: yellowView.leftAnchor, constant: -10).isActive = true
        blackView.rightAnchor.constraint(equalTo: yellowView.rightAnchor, constant: 10).isActive = true
        blackView.topAnchor.constraint(equalTo: redView.topAnchor, constant: -10).isActive = true
        blackView.bottomAnchor.constraint(equalTo: greenView.bottomAnchor, constant: 10).isActive = true
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
