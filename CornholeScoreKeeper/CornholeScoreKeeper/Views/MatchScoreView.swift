import UIKit

class MatchScoreView: UIView {

    let matchScoreLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Match Score"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let blueMatchScoreLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "0"
        label.textColor = .systemBlue
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let matchScoreLineDivider = LineView()

    let redMatchScoreLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "0"
        label.textColor = .systemRed
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let frameScoreLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Frame Score"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let blueFrameScoreLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "0"
        label.textColor = .systemRed
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let frameScoreLineDivider = LineView()

    let redFrameScoreLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "0"
        label.textColor = .systemRed
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureViewConstraints() {
        addSubviews(
            matchScoreLabel,
            blueMatchScoreLabel, matchScoreLineDivider, redMatchScoreLabel,
            frameScoreLabel,
            blueFrameScoreLabel, frameScoreLineDivider, redFrameScoreLabel
        )
    }

}
