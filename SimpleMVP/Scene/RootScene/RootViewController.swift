//
//  RootViewController.swift
//  SimpleMVP
//
//  Created by 大塚周 on 2022/02/18.
//

import UIKit

protocol RootRouterProtocol {
    func transitionToSplash()
}

final class RootViewController: UIViewController, PresenterInjectable {

    var current: UIViewController
    var presenter: Presenter?

    func inject(presenter: Presenter) {
        self.presenter = presenter
    }
    
    init() {
        print("RootViewController is initialized")
        let splashViewController = UIStoryboard(name: "Splash", bundle: nil).instantiateInitialViewController() as! SplashViewController
        let splashPresenter = SplashPresenter(view: splashViewController)
        
        splashViewController.inject(presenter: splashPresenter)
        self.current = splashViewController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let presenter = presenter as? RootPresenterProtocol else { fatalError("presenterがRootPresenterProtocolに準拠していない") }

        presenter.viewDidLoad()
    }
}
