import UIKit

protocol AddNewPlayerProfileDelegate: class {
    func addPlayerProfile(name: String)
}

class TextFieldHeaderView: UIView {

    weak var delegate: AddNewPlayerProfileDelegate?

    let textField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = UIColor.black.cgColor
        textField.placeholder = "New player name"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    let addButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("Add Player", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.layer.borderColor = UIColor.black.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let lineView = LineView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        configureSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureSubviews() {
        addSubviews(textField, addButton, lineView)

        NSLayoutConstraint.activate([
            textField.heightAnchor.constraint(equalToConstant: 44),
            textField.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            textField.trailingAnchor.constraint(equalTo: addButton.leadingAnchor, constant: -16),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),

            addButton.centerYAnchor.constraint(equalTo: textField.centerYAnchor),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            addButton.heightAnchor.constraint(equalToConstant: 44),

            lineView.heightAnchor.constraint(equalToConstant: 1),
            lineView.leadingAnchor.constraint(equalTo: leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: trailingAnchor),
            lineView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        addButton.addTarget(self, action: #selector(didTapAddProfileButton), for: .touchUpInside)
    }

    @objc func didTapAddProfileButton() {
        guard let input = textField.text, !input.isEmpty else {
            print("player name cannot be blank")
            return
        }
        textField.text = ""
        delegate?.addPlayerProfile(name: input)
    }
}
