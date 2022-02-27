//
//  RedViewController.swift
//  SimpleMVP
//
//  Created by 大塚周 on 2022/02/19.
//

import UIKit

protocol RedRouterProtocol {
    func transition(to color: RedViewController.NextRoute)
}

class RedViewController: UIViewController, PresenterInjectable {
    
    var presenter: Presenter?
    
    func inject(presenter: Presenter) {
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setup()
    }
    
    enum NextRoute {
        case red
        case blue
        case green
    }
    
    init() {
        print("RedViewColorViewController is initialized")
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("RedViewController is released")
    }
    let transitionToRedButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("toRed", for: .normal)
        button.addTarget(self, action: #selector(didTapTransitionToRedButton), for: .touchUpInside)
        return button
    }()
    
    let transitionToBlueButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("toBlue", for: .normal)
        button.addTarget(self, action: #selector(didTapTransitionToBlueButton), for: .touchUpInside)
        return button
    }()
    
    let transitionToGreenButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("toGreen", for: .normal)
        button.addTarget(self, action: #selector(didTapTransitionToGreenButton), for: .touchUpInside)
        return button
    }()
    
    private func setup() {
        setupTransitionToRedBuuton()
        setupTransitionToBlueButton()
        setupTransitionToGreenButton()
    }
    
    private func setupTransitionToRedBuuton() {
        view.addSubview(transitionToRedButton)
        transitionToRedButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            transitionToRedButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            transitionToRedButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func setupTransitionToBlueButton() {
        view.addSubview(transitionToBlueButton)
        transitionToBlueButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            transitionToBlueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            transitionToBlueButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func setupTransitionToGreenButton() {
        view.addSubview(transitionToGreenButton)
        transitionToGreenButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            transitionToGreenButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            transitionToGreenButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func didTapTransitionToRedButton() {
        guard let presenter = presenter as? RedPresenterProtocol else { fatalError()
        }
        presenter.didTransitionButtonTapped(to: .red)
    }
    
    @objc func didTapTransitionToBlueButton() {
        guard let presenter = presenter as? RedPresenterProtocol else { fatalError() }
        presenter.didTransitionButtonTapped(to: .blue)
    }
    
    @objc func didTapTransitionToGreenButton() {
        guard let presenter = presenter as? RedPresenterProtocol else { fatalError() }
        presenter.didTransitionButtonTapped(to: .green)
    }
}
