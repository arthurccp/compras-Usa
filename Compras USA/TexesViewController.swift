
import UIKit

class TexesViewController: UIViewController {

    @IBOutlet weak var lbDolar: UILabel!
    @IBOutlet weak var lbStateTax: UILabel!
    @IBOutlet weak var lbIOFDescription: UILabel!
    @IBOutlet weak var lbIOF: UILabel!
    @IBOutlet weak var swCreditCard: UISwitch!
    @IBOutlet weak var lbReal: UILabel!
    @IBOutlet weak var lbStateTaxDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func ChangeIOF(_ sender: Any) {
        calculateTaxes()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        calculateTaxes()
    }
    
    func calculateTaxes(){
        lbStateTaxDescription.text = "Impostos do Estado (\(tc.getFormattedValue(of: tc.StateTax, withCurrency:""))%)"
        lbIOFDescription.text = "Impostos do Estado (\(tc.getFormattedValue(of: tc.iof, withCurrency:""))%)"
        
        lbDolar.text = tc.getFormattedValue(of: tc.ShoppingValue, withCurrency: "U$$")
        lbStateTax.text = tc.getFormattedValue(of: tc.StateTaxValue, withCurrency: "U$$")
        lbIOF.text = tc.getFormattedValue(of: tc.iofValue, withCurrency: "U$$")
        
        let real = tc.calculate(usingCreditCard:swCreditCard.isOn)

        lbReal.text = tc.getFormattedValue(of: real, withCurrency: "R$")
        


    }
    
    
    
    
}
