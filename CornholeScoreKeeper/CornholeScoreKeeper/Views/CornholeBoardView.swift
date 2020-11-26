import UIKit

class CornholeBoardView: UIView {

    let holeView: UIView = {
        let circle = UIView(frame: .zero)
        circle.backgroundColor = .black
        circle.clipsToBounds = true
        circle.translatesAutoresizingMaskIntoConstraints = false
        return circle
    }()

    init(frame: CGRect, direction: Bool) {
        super.init(frame: frame)

        configureHoleView(direction: direction)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)


    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureHoleView(direction: Bool) {
        addSubview(holeView)
        NSLayoutConstraint.activate([
            holeView.heightAnchor.constraint(equalToConstant: 25),
            holeView.widthAnchor.constraint(equalToConstant: 25),
            direction ? holeView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8) : holeView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            holeView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
//        holeView.layer.cornerRadius = holeView.frame.height / 2
    }

}
