import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Properties Privates
    
    private var chatsList: [Chat] = [Chat(contactImage: "dad", contactName: "Dad", lastMessage: "Hey son, are you already rich like me?"),
                                     Chat(contactImage: "grandMother", contactName: "Grandmother", lastMessage: "Come on boy! In my time things were a lot more dificult"),
                                     Chat(contactImage: "happy", contactName: "Mr. Happy", lastMessage: "Smile, you are becoming a great developer"),
                                     Chat(contactImage: "noEmotions", contactName: "Mr. NoJokes", lastMessage: "Why so serious?")]
    
    // MARK: - Properties Publics
    
    lazy var chatsTableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    lazy var BroadcastButton: UIButton = {
        let button = UIButton(type: .close)
        button.tintColor = UIColor.link
        button.
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Life cicles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Chats"
        view.backgroundColor = .orange
        
        view.addSubview(chatsTableView)
        
        chatsTableView.delegate = self
        chatsTableView.dataSource = self
        
        NSLayoutConstraint.activate([
            chatsTableView.topAnchor.constraint(equalTo: view.topAnchor),
            chatsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            chatsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            chatsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        chatsTableView.register(ChatTableViewCell.self, forCellReuseIdentifier: ChatTableViewCell.identifier)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let appearence = UINavigationBarAppearance()
        
        appearence.backgroundColor = .systemBackground
        
        if let navigationBar = navigationController?.navigationBar {
            navigationBar.tintColor = UIColor.link
            navigationBar.standardAppearance = appearence
            navigationBar.scrollEdgeAppearance = appearence
        }
       
        let contactsMenuButton = UIBarButtonItem(image: UIImage.init(systemName: "square.and.pencil"), style: .plain, target: self, action: #selector(callContactsView))
        
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: nil, action: nil)
        
        navigationItem.rightBarButtonItems = [contactsMenuButton]
        navigationItem.leftBarButtonItems = [editButton]
    }

    @objc
    func callContactsView() {
        let contactsViewController = ContactsViewController()
        navigationController?.present(contactsViewController, animated: true)
    }
    
    // MARK: - Methods Private


}

// MARK: - Class Extensions

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let chatViewController = ChatViewController()
        
        if let _ = navigationController {
            navigationController?.pushViewController(chatViewController, animated: true)
        } else {
            present(chatViewController, animated: true)
        }
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = chatsTableView.dequeueReusableCell(withIdentifier: ChatTableViewCell.identifier, for: indexPath) as? ChatTableViewCell else { return UITableViewCell() }
        
        let chat = chatsList[indexPath.row]
        
        cell.setup(image: chat.contactImage, contactName: chat.contactName, lastMessage: chat.lastMessage)
        
        return cell
    }
    
    
}
