//
//  SplashViewController.swift
//  SimpleMVP
//
//  Created by 大塚周 on 2022/02/14.
//

import UIKit

protocol SplashRouterProtocol {
    func transitionToRed()
}

final class SplashViewController: UIViewController, PresenterInjectable {
    
    var presenter: Presenter?
    
    func inject(presenter: Presenter) {
        self.presenter = presenter
    }
    
    required init(coder: NSCoder) {
        print("SplashViewController is initialized")
        super.init(coder: coder)!
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        view.backgroundColor = .white
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            guard let presenter = self.presenter as? SplashPresenter else { return }
            presenter.preparationComplete()
        }
        
    }
    
    deinit {
        print("SplashViewController is released")
    }
    
}
