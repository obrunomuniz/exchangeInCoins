//
//  CoinViewController.swift
//  exchangeInCoins
//
//  Created by Bruno Teixeira Muniz Rocha on 07/09/23.
//

import UIKit

class CoinViewController: UIViewController {

    //Propriedads do meu botao de calcular e do input de entrada dos centavos
    @IBOutlet weak var botaoCalcular: UIButton!
    @IBOutlet weak var entradaCentavos: UITextField!
    
    //Labels das moedas
    @IBOutlet weak var labelUmReal: UILabel!
    @IBOutlet weak var labelCinquentaCentavos: UILabel!
    //@IBOutlet weak var labelVinteCintoCentavos: UILabel!
    
    @IBOutlet weak var labelVinteCintoCentavos: UILabel!
    
    @IBOutlet weak var labelDezCentavos: UILabel!
   
    @IBOutlet weak var labelCincoCentavos: UILabel!
    
    @IBOutlet weak var labelUmCentavo: UILabel!

    
    //fuc usada para fazer o calculo quando clica no botao Calcular
    @IBAction func calcular(_ sender: Any) {
        guard let texto = entradaCentavos.text, let centavos = Int(texto) else { return }

           let (umReal, cinquenta, vinteECinco, dez, cinco, um) = calcularTroco(centavos: centavos)
           
        labelUmReal.text = "Moedas de um real: \(umReal)"
        labelCinquentaCentavos.text = "Moedas de cinquenta centavos: \(cinquenta)"
       /* labelVinteCintoCentavos.text = "Moedas de vinte e cinco centavos: \(vinteECinco)" */
        labelDezCentavos.text = "Moedas de dez centavos: \(dez)"
        labelCincoCentavos.text = "Moedas de cinco centavos: \(cinco)"
        labelUmCentavo.text = "Moedas de um centavo: \(um)"
        
    }
    
    func configurarLayout() {
        //navigationItem.hidesBackButton = true
        botaoCalcular.layer.cornerRadius = 12.0
    }
    
    func calcularTroco(centavos: Int) -> (Int, Int, Int, Int, Int, Int) {
        
        //Obter os valores de cada moeda
        let moedasUmReal = centavos / 100
        let moedasCinquenta = (centavos % 100) / 50
        let moedasVinteECinco = (centavos % 50) / 25
        let moedasDez = (centavos % 25) / 10
        let moedasCinco = (centavos % 10) / 5
        let moedasUm = centavos % 5
        
        return (moedasUmReal, moedasCinquenta, moedasVinteECinco, moedasDez, moedasCinco, moedasUm)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurarLayout()
    }
}
