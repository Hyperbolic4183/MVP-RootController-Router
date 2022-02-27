//
//  Router.swift
//  SimpleMVP
//
//  Created by 大塚周 on 2022/02/14.
//

import UIKit

class Router {
    
    func transitionToBlue() {
        let blueViewController = BlueViewController()
        let bluePresenter = BluePresenter(view: blueViewController)
        replace(with: blueViewController, presenter: bluePresenter)
    }
    
    func transitionToRed() {
        let redViewController = RedViewController()
        let redPresenter = RedPresenter(view: redViewController)
        replace(with: redViewController, presenter: redPresenter)
    }
    
    func transitionToGreen() {
        let greenViewController = GreenViewController()
        let greenPresenter = GreenPresenter(view: greenViewController)
        replace(with: greenViewController, presenter: greenPresenter)
    }
    
    func replace(with viewController: PresenterInjectable, presenter: Presenter) {
        let rootViewController = AppDelegate.shared.rootViewController
        viewController.inject(presenter: presenter)
    
        rootViewController.current.willMove(toParent: nil)
        rootViewController.current.removeFromParent()
        rootViewController.current.view.removeFromSuperview()
        rootViewController.current = viewController
        
        rootViewController.addChild(rootViewController.current)
        rootViewController.current.view.frame = rootViewController.view.bounds
        rootViewController.view.addSubview(rootViewController.current.view)
        rootViewController.current.didMove(toParent: rootViewController)
    }
}

extension Router: RootRouterProtocol {
    func transitionToSplash() {
        let rootViewController = AppDelegate.shared.rootViewController
        rootViewController.addChild(rootViewController.current)
        rootViewController.current.view.frame = rootViewController.view.bounds
        rootViewController.view.addSubview(rootViewController.current.view)
        rootViewController.current.didMove(toParent: rootViewController)
    }
}

extension Router: SplashRouterProtocol {
    
    
}

extension Router: RedRouterProtocol {
    func transition(to color: RedViewController.NextRoute) {
        switch color {
        case .red:
            transitionToRed()
        case .blue:
            transitionToBlue()
        case .green:
            transitionToGreen()
        }
    }
}

extension Router: BlueRouterProtocol {
    func transition(to color: BlueViewController.NextRoute) {
        switch color {
        case .red:
            transitionToRed()
        case .blue:
            transitionToBlue()
        case .green:
            transitionToGreen()
        }
    }
}

extension Router: GreenRouterProtocol {
    func transition(to color: GreenViewController.NextRoute) {
        switch color {
        case .red:
            transitionToRed()
        case .blue:
            transitionToBlue()
        case .green:
            transitionToGreen()
        }
    }
}
