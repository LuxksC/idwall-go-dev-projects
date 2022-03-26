import UIKit

class HomeViewController: UIViewController {

    // MARK: - Initializers
    
    lazy var tasksTableView: UITableView = {
        let tableview = UITableView(frame: .zero, style: .plain)
        tableview.translatesAutoresizingMaskIntoConstraints = false
        return tableview
    }()
    
    var tasksList: [Task] = []
    
    var persistence = Persistence()
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        
        tasksTableView.delegate = self
        tasksTableView.dataSource = self
        
        view.addSubview(tasksTableView)
        
        NSLayoutConstraint.activate([
            tasksTableView.topAnchor.constraint(equalTo: view.topAnchor),
            tasksTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tasksTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tasksTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        tasksTableView.register(TaskTableViewCell.self, forCellReuseIdentifier: TaskTableViewCell.identifier)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "ToDoList"
        view.backgroundColor = .systemBackground
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let addTaskButton = UIBarButtonItem(image: UIImage.init(systemName: "plus"), style: .plain, target: self, action: #selector(callAddTaskView))
        
        navigationItem.rightBarButtonItem = addTaskButton
        
    }
    
    @objc
    func callAddTaskView () {
        let addTaskView = AddTaskViewController()
        addTaskView.modalPresentationStyle = .fullScreen
        navigationController?.present(addTaskView, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //savingData()
        getData()
    }
    

    // MARK: - Private methods
    // ------------- COREDATA -----------------
    /*
    private func savingData() {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        let someDateTime = formatter.date(from: "22/07/1998")
        
        persistence.addTask(title: "Criar ToDoList", desc: "Fazer tudo que precisa pra criar uma ToDoList", dueAt: someDateTime, status: 2)
    }
    */
    
    private func getData() {
        persistence.fetchTasks() {result in
            switch result {
            case .success(let res):
                self.tasksList = res
                DispatchQueue.main.async {
                    self.tasksTableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }

}

extension HomeViewController: UITableViewDelegate {
    
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasksList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tasksTableView.dequeueReusableCell(withIdentifier: TaskTableViewCell.identifier, for: indexPath) as? TaskTableViewCell else { return UITableViewCell() }
        
        let task = tasksList[indexPath.row]
        
        cell.setup(task: task)
        
        return cell
    }
    
    
}
