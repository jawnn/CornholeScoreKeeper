//
//  MatchDetailsViewController.swift
//  CornholeScoreKeeper
//
//  Created by Roberto Manese III on 12/7/20.
//

import UIKit

class MatchDetailsViewController: UIViewController {

    var presenter: MatchDetailsPresenterType!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemIndigo
    }

}

extension MatchDetailsViewController: MatchDetailsViewType {
    
}
