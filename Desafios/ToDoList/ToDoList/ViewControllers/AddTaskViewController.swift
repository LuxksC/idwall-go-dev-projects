import UIKit

class AddTaskViewController: UIViewController {
    
    // MARK: - Initializers
    
    var persistence = Persistence()
    
    lazy var titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Title"
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 3
        textField.layer.borderColor = UIColor.systemPink.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var descTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Description"
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 3
        textField.layer.borderColor = UIColor.systemPink.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var dueDateTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Deadline Date"
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 3
        textField.layer.borderColor = UIColor.systemPink.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var statusTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Current Status"
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 3
        textField.layer.borderColor = UIColor.systemPink.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var contentStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.contentMode = .top
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var closeButton: UIButton = {
        let button = UIButton(type: .close)
        //button.tintColor = .red
        button.addTarget(self, action: #selector(closeModal), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc
    func closeModal() {
        dismiss(animated: true) {
            print("CloseButton closure working")
        }
    }
    
    lazy var addTaskButton: UIButton = {
        let button = UIButton()
        button.tintColor = .white
        button.backgroundColor = UIColor.systemPink
        button.addTarget(self, action: #selector(handleAddTaskOnClick), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc
    func handleAddTaskOnClick() {
        if !(titleTextField.text == "" || descTextField.text == "" || dueDateTextField.text == "" || statusTextField.text == "") {
            return
        } else {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd/MM/yyyy"
            let someDateTime = formatter.date(from: dueDateTextField.text!)
            persistence.addTask(title: titleTextField.text!, desc: descTextField.text!, dueAt: someDateTime)
        }
        
    }
    
    // MARK: - LifeCycle
    
    override func loadView() {
        super.loadView()
        
        view.addSubview(closeButton)
        
        NSLayoutConstraint.activate([
            closeButton.heightAnchor.constraint(equalToConstant: 30),
            closeButton.widthAnchor.constraint(equalToConstant: 30),
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        view.addSubview(contentStackView)
        
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            contentStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            contentStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -400),
            contentStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
        
        contentStackView.addArrangedSubviews(titleTextField, descTextField, dueDateTextField, statusTextField, addTaskButton)
//        NSLayoutConstraint.activate([
//            titleTextField.heightAnchor.constraint(equalToConstant: 50),
//            titleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//            titleTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
//            titleTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
//        ])
        
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .systemBackground
    }
    
    // MARK: - Private methods
    
}
