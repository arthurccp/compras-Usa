

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tfDolar: UITextField!
    @IBOutlet weak var tfIOF: UITextField!
    @IBOutlet weak var tfStatesTaxes: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfDolar.text = tc.getFormattedValue(of: tc.dolar, withCurrency: "")
        tfIOF.text = tc.getFormattedValue(of: tc.iof, withCurrency: "")
        tfStatesTaxes.text = tc.getFormattedValue(of: tc.StateTax, withCurrency: "")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func SetValue(){
        tc.dolar = tc.convertToDouble(tfDolar.text!)
        tc.iof = tc.convertToDouble(tfIOF.text!)
        tc.StateTax = tc.convertToDouble(tfStatesTaxes.text!)
    }
}

extension SettingsViewController: UITextFieldDelegate{
    func textFieldDidEndEditing(_ textField: UITextField) {
        SetValue()
    }
}
