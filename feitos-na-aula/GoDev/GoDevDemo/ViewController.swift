import UIKit
import GoDev

class ViewController: UIViewController {
    
    lazy var button: GoDevButton = {
        let config = GoDevButton.Config.dark()
        let button = GoDevButton(config: config)
        button.setTitle("Favorite", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Demo"
        view.backgroundColor = .orange
        
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }


}

