import UIKit

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var categoryPicker: UIPickerView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var checkOutCardView: CardView!
    @IBOutlet weak var priceCardView: CardView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet var categoryImg: UIImageView!
    @IBOutlet weak var cartButton: UIButton!
    @IBOutlet var categoryName: UILabel!
    
    var menuItems: [MenuItem] = []
    var cartItems: [CartItem] = []
    var totalPrice = 0.0
    var selectedCategory = ""

    var categories = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Menu"
        
        if(selectedCategory == "Quesadilla")
        {
            categoryImg.image = UIImage(named: "Sample_food2")
            categories = ["Burrito", "Tacos", "Quesadilla"]
        }
        else if(selectedCategory == "Pizzas")
        {
            categoryImg.image = UIImage(named: "Sample_img1")
            categories = ["Meat Pizzas", "Veg Pizzas"]
        }
        else if(selectedCategory == "Teriyaki")
        {
            categoryImg.image = UIImage(named: "sample_food3")
            categories = ["Chicken Teriyaki", "Beef Teriyaki","Seafood Teriyaki"]
        }
        categoryName.text = selectedCategory
        tableView.delegate = self
        tableView.dataSource = self
        categoryPicker.delegate = self
        categoryPicker.dataSource = self
        updateMenu(forCategory: categories.first ?? "")
        priceLabel.text = String(0.0)
        
        let checkoutPress = UITapGestureRecognizer(target: self, action: #selector(checkoutButtonTapped(tapGestureRecognizer:)))
        checkOutCardView.isUserInteractionEnabled = true
        checkOutCardView.addGestureRecognizer(checkoutPress)
        
        tableView.register(MenuTableViewCell.nib, forCellReuseIdentifier: MenuTableViewCell.identifier)
    }

    // MARK: - UITableViewDataSource and UITableViewDelegate methods

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableViewCell.identifier, for: indexPath) as! MenuTableViewCell
       
        let menuItem = menuItems[indexPath.row]

        cell.itemName.text = menuItem.name
        cell.itemPrice.text = "$\(menuItem.price)"
        cell.quantityLabel.text = "\(menuItem.quantity)"

        cell.plusImg.tag = indexPath.row
        cell.minusImg.tag = indexPath.row
        
        let plusImgPress = UITapGestureRecognizer(target: self, action: #selector(plusButtonTapped(tapGestureRecognizer:)))
        cell.plusImg.isUserInteractionEnabled = true
        cell.plusImg.addGestureRecognizer(plusImgPress)
        
        
        let minusImgPress = UITapGestureRecognizer(target: self, action: #selector(minusButtonTapped(tapGestureRecognizer:)))
        cell.minusImg.isUserInteractionEnabled = true
        cell.minusImg.addGestureRecognizer(minusImgPress)
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "foodDetailsSegue", sender: nil)
    }

    // MARK: - Button actions

    @objc func plusButtonTapped(tapGestureRecognizer : UITapGestureRecognizer) {
        let index = tapGestureRecognizer.view!.tag
        menuItems[index].quantity += 1
        totalPrice +=  menuItems[index].price
        priceLabel.text = String(totalPrice)
        tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .none)
    }

    @objc func minusButtonTapped(tapGestureRecognizer : UITapGestureRecognizer) {
        let index = tapGestureRecognizer.view!.tag
        if menuItems[index].quantity > 0 {
            menuItems[index].quantity -= 1
            totalPrice -=  menuItems[index].price
            priceLabel.text = String(totalPrice)
            tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .none)
        }
    }


@objc func checkoutButtonTapped(tapGestureRecognizer : UITapGestureRecognizer) {
        var totalPrice = 0.0
        for item in cartItems {
            totalPrice += item.price * Double(item.quantity)
        }

       // let cartMessage = cartItems.map { "\($0.name) x\($0.quantity)" }.joined(separator: "\n")
//        let totalPriceMessage = String(format: "Total Price: $%.2f", totalPrice)
//
//        let alertController = UIAlertController(title: "Cart", message: "\(cartMessage)\n\n\(totalPriceMessage)", preferredStyle: .alert)
//        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//        present(alertController, animated: true, completion: nil)
        self.performSegue(withIdentifier: "checkoutSegue", sender: nil)
        
        
    
    }

    // MARK: - UIPickerViewDelegate and UIPickerViewDataSource methods

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categories[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCategory = categories[row]
        updateMenu(forCategory: selectedCategory)
    }

    // MARK: - Helper method to update the menu based on the selected category

    func updateMenu(forCategory category: String) {
        // In a real application, you would fetch menu items for the selected category from a data source
        // Here, we'll just populate some sample items
        if(category == "Burrito")
        {
            
            let burritoItems = [
                MenuItem(name: "Classic Burrito", price: 8.99),
                MenuItem(name: "Spicy Chicken Burrito", price: 10.99),
                MenuItem(name: "Vegetarian Burrito", price: 9.49),
                // Add more burrito items as needed
            ]
            menuItems = burritoItems
        }else if(category == "Quesadilla")
        {
            
            let quesadillaItems = [
                MenuItem(name: "Cheese Quesadilla", price: 6.99),
                MenuItem(name: "Chicken Quesadilla", price: 8.99),
                MenuItem(name: "Veggie Quesadilla", price: 7.49),
                // Add more quesadilla items as needed
            ]
            menuItems = quesadillaItems
        }else if(category == "Tacos"){
            
            let tacosItems = [
                MenuItem(name: "Beef Tacos", price: 7.99),
                MenuItem(name: "Fish Tacos", price: 9.99),
                MenuItem(name: "Shrimp Tacos", price: 10.49),
                // Add more tacos items as needed
            ]
            menuItems = tacosItems
        }
        else if(category == "Veg Pizzas"){
            
            let vegetarianPizzaItems = [
                MenuItem(name: "Margherita Pizza", price: 11.99),
                MenuItem(name: "Spinach and Feta Pizza", price: 13.99),
                MenuItem(name: "Veggie Supreme Pizza", price: 15.49),
                // Add more vegetarian pizza items as needed
            ]
            menuItems = vegetarianPizzaItems
        }
        else if(category == "Meat Pizzas"){
            
            let meatLoversPizzaItems = [
                MenuItem(name: "Pepperoni Pizza", price: 12.99),
                MenuItem(name: "BBQ Chicken Pizza", price: 14.99),
                MenuItem(name: "Supreme Meat Lovers Pizza", price: 16.49),
                // Add more meat lovers pizza items as needed
            ]
            menuItems = meatLoversPizzaItems
        }
        else if(category == "Chicken Teriyaki"){
            
            let teriyakiChickenItems = [
                MenuItem(name: "Teriyaki Chicken Bowl", price: 9.99),
                MenuItem(name: "Teriyaki Chicken Skewers", price: 7.99),
                MenuItem(name: "Teriyaki Chicken Stir-Fry", price: 10.49),
                // Add more Teriyaki Chicken items as needed
                
            ]
            menuItems = teriyakiChickenItems
        }
        else if(category == "Beef Teriyaki"){
            
            // Teriyaki Beef
            let teriyakiBeefItems = [
                MenuItem(name: "Teriyaki Beef Bowl", price: 11.99),
                MenuItem(name: "Teriyaki Beef Skewers", price: 9.99),
                MenuItem(name: "Teriyaki Beef Stir-Fry", price: 12.49),
                // Add more Teriyaki Beef items as needed
            ]
            menuItems = teriyakiBeefItems
        }
        else if(category == "Seafood Teriyaki"){
            
            
            // Seafood Teriyaki
            let seafoodTeriyakiItems = [
                MenuItem(name: "Teriyaki Salmon", price: 13.99),
                MenuItem(name: "Teriyaki Shrimp", price: 14.99),
                // Add more Seafood Teriyaki items as needed
            ]
            
            menuItems = seafoodTeriyakiItems
        }
        
        

       
        tableView.reloadData()
    }
}

struct MenuItem {
    var name: String
    var price: Double
    var quantity: Int = 0
}


struct CartItem {
    var name: String
    var price: Double
    var quantity: Int
}


