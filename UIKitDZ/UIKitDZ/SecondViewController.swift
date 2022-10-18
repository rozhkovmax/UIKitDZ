//
//  SecondViewController.swift
//  UIKitDZ
//
//  Created by Maxim on 15.10.2022.
//

import UIKit

/// Контроллер NSLayoutConstraint
final class SecondViewController: UIViewController {
    
    // MARK: - Private Visual Components
    private let blackView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemRed
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemYellow
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGreen
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Methods
    private func setupUI() {
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
        NSLayoutConstraint(item: blackView,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: blackView,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: redView,
                           attribute: .width,
                           multiplier: 1,
                           constant: 20).isActive = true
        NSLayoutConstraint(item: blackView,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .top,
                           multiplier: 1,
                           constant: 80).isActive = true
        NSLayoutConstraint(item: blackView,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: redView,
                           attribute: .top,
                           multiplier: 1,
                           constant: -10).isActive = true
        NSLayoutConstraint(item: blackView,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: greenView,
                           attribute: .bottom,
                           multiplier: 1,
                           constant: 10).isActive = true
    }
    
    private func createRedViewConstraints() {
        NSLayoutConstraint(item: redView,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: blackView,
                           attribute: .top,
                           multiplier: 1,
                           constant: 20).isActive = true
        NSLayoutConstraint(item: redView,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .height,
                           multiplier: 0.2,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: redView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .height,
                           multiplier: 0.2,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: redView,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: blackView,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
    }
    
    private func createYellowViewConstraints() {
        NSLayoutConstraint(item: yellowView,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: blackView,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: yellowView,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: redView,
                           attribute: .bottom,
                           multiplier: 1,
                           constant: 10).isActive = true
        NSLayoutConstraint(item: yellowView,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .height,
                           multiplier: 0.2,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: yellowView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .height,
                           multiplier: 0.2,
                           constant: 0).isActive = true
    }
    
    private func createGreenViewConstraints() {
        NSLayoutConstraint(item: greenView,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: blackView,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: greenView,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: yellowView,
                           attribute: .bottom,
                           multiplier: 1,
                           constant: 10).isActive = true
        NSLayoutConstraint(item: greenView,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .height,
                           multiplier: 0.2,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: greenView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .height,
                           multiplier: 0.2,
                           constant: 0).isActive = true
    }
}
