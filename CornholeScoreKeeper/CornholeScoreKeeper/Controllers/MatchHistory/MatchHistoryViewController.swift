import UIKit

class MatchHistoryViewController: UIViewController {

    private weak var tableView: UITableView!

    var presenter: MatchHistoryPresenter!

    override func loadView() {
        super.loadView()

        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        self.tableView = tableView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationBar()
        configuireTableView()
        view.backgroundColor = .systemGreen
    }

    private func configuireTableView() {
        tableView.rowHeight = 70
        tableView.register(MatchResultsTableCell.self, forCellReuseIdentifier: "MatchResultsTableCell")
        tableView.dataSource = presenter
        tableView.delegate = self
    }

    private func configureNavigationBar() {
        title = "Match History"

        let rightBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapNewMatchButton))
        navigationItem.rightBarButtonItem = rightBarButton
    }

    @objc func didTapNewMatchButton() {

    }

}

extension MatchHistoryViewController: UITableViewDelegate {

}

extension MatchHistoryViewController: MatchHistoryViewType {
    
}
