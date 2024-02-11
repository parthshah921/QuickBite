import UIKit
import WebKit


struct Order {
    var restaurantImage: UIImage?
    var restaurantName: String
    var totalPrice: String
    var orderId: String
}

class OrdersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, WKNavigationDelegate {

    @IBOutlet var tableView: UITableView!

    @IBOutlet weak var gifWebView: WKWebView!
    @IBOutlet weak var restrauntName: UILabel!
    @IBOutlet weak var orderId: UIView!
    @IBOutlet weak var totalPrice: UILabel!
    @IBOutlet weak var activeOrderView: UIView!

    var orders: [Order] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        styleActiveOrderView()
        
        tableView.delegate = self
        tableView.dataSource = self

        tableView.tableFooterView = UIView()
        tableView.register(OrderHistroyTableViewCell.nib, forCellReuseIdentifier: OrderHistroyTableViewCell.identifier)

        // Set up your orders using the model
        orders = [
            Order(restaurantImage: UIImage(named: "sample_food3"), restaurantName: "Street Cafe", totalPrice: "$99.99", orderId: "#9999990"),
            Order(restaurantImage: UIImage(named: "Sample_food2"), restaurantName: "TimHortons", totalPrice: "$99.99", orderId: "#9999990")
            // Add more orders as needed
        ]
       // gifWebView.navigationDelegate = self

//        if let gifURL = Bundle.main.url(forResource: "orderInProgressGif", withExtension: "gif") {
//            let gifRequest = URLRequest(url: gifURL)
//            gifWebView.load(gifRequest)
//        } else {
//            print("Error: Unable to find the GIF file.")
//        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: OrderHistroyTableViewCell.identifier, for: indexPath) as! OrderHistroyTableViewCell

        cell.selectionStyle = .none
        tableView.separatorStyle = .none

        let order = orders[indexPath.row]
        cell.restaurantImg.image = order.restaurantImage
        cell.restaueantName.text = order.restaurantName
        cell.totalPrice.text = order.totalPrice
        cell.orderId.text = order.orderId
        cell.detailsButton.isUserInteractionEnabled = true
        cell.detailsButton.isEnabled = true
        cell.detailsButton.addTarget(self, action: #selector(detailsButtonPressed), for: .touchUpInside)
        cell.detailsButton.frame = CGRect(x: 100, y: 100, width: 200, height: 40)
        

        return cell
    }
    
    @objc func detailsButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "orderDetails", sender: nil)
    }

    func styleActiveOrderView() {
        // Customize the appearance of the activeOrderView
        activeOrderView.layer.cornerRadius = 10.0
        activeOrderView.layer.borderWidth = 1.0
        activeOrderView.layer.borderColor = UIColor.lightGray.cgColor

        activeOrderView.layer.shadowColor = UIColor.darkGray.cgColor
        activeOrderView.layer.shadowOffset = CGSize(width: 0, height: 2)
        activeOrderView.layer.shadowOpacity = 0.5
        activeOrderView.layer.shadowRadius = 4.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)

           // Set the navigation delegate to self if you want to perform actions when the GIF finishes loading
         //  gifWebView.navigationDelegate = self

           // Load the GIF file from the main bundle
//           if let gifURL = Bundle.main.url(forResource: "orderInProgressGif", withExtension: "gif") {
//               let gifRequest = URLRequest(url: gifURL)
//               gifWebView.load(gifRequest)
//           } else {
//               print("Error: Unable to find the GIF file.")
//           }
       }
}
