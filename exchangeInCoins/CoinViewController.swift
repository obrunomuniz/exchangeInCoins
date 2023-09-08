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
    
    @IBOutlet weak var labelVinteCintoCentavos: UILabel!
    
    @IBOutlet weak var labelDezCentavos: UILabel!
   
    @IBOutlet weak var labelCincoCentavos: UILabel!
    
    @IBOutlet weak var labelUmCentavo: UILabel!

    @IBOutlet weak var totalMoedasLabel: UILabel!
    
    //fuc usada para fazer o calculo quando clica no botao Calcular
    @IBAction func calcular(_ sender: Any) {
        guard let textoCentavos = entradaCentavos.text, let centavos = Int(textoCentavos) else {
            // TODO: mostrar um alerta aqui para entrada inválida
            return
        }
        
        let resultado = calcularTroco(centavos: centavos)
        
        print(resultado)
        
        totalMoedasLabel.text = "Quantidade de moedas: \(resultado.totalMoedas)"
        labelUmReal.text = "Moedas de um real: \(resultado.moedasUmReal)"
        labelCinquentaCentavos.text = "Moedas de cinquenta centavos: \(resultado.moedasCinquenta)"
        labelVinteCintoCentavos.text = "Moedas de vinte e cinco: \(resultado.moedasVinteECinco)"
        labelDezCentavos.text = "Moedas de dez centavos: \(resultado.moedasDez)"
        labelCincoCentavos.text = "Moedas de cinco centavos: \(resultado.moedasCinco)"
        labelUmCentavo.text = "Moedas de um centavo: \(resultado.moedasUm)"
    }
    
    
    func calcularTroco(centavos: Int) -> (totalMoedas: Int, moedasUmReal: Int, moedasCinquenta: Int, moedasVinteECinco: Int, moedasDez: Int, moedasCinco: Int, moedasUm: Int) {
        var restante = centavos
        
        let moedasUmReal = restante / 100
        restante %= 100
        
        let moedasCinquenta = restante / 50
        restante %= 50
        
        let moedasVinteECinco = restante / 25
        restante %= 25
        
        let moedasDez = restante / 10
        restante %= 10
        
        let moedasCinco = restante / 5
        restante %= 5
        
        let moedasUm = restante

        let totalMoedas = moedasUmReal + moedasCinquenta + moedasVinteECinco + moedasDez + moedasCinco + moedasUm
        
        return (totalMoedas, moedasUmReal, moedasCinquenta, moedasVinteECinco, moedasDez, moedasCinco, moedasUm)
    }


    
    func configurarLayout() {
        //navigationItem.hidesBackButton = true
        botaoCalcular.layer.cornerRadius = 12.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurarLayout()
    }
}
