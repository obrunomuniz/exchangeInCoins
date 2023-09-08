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
            showAlert(message: "Por favor, insira um número válido.")
            return
        }
        
        // Verifica se o valor está dentro do intervalo permitido
        if centavos < 0 || centavos > 10000 {
            // Mostra um alerta para entrada fora do intervalo permitido
            showAlert(message: "O valor deve estar entre 0 e 10.000 centavos.")
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
    
    /**
      Retorna uma tupla contendo 7
      @params centavos do tipo inteiro
     */
    func calcularTroco(centavos: Int) -> (totalMoedas: Int, moedasUmReal: Int, moedasCinquenta: Int, moedasVinteECinco: Int, moedasDez: Int, moedasCinco: Int, moedasUm: Int) {
       
        /**
         Inicializada com o valor do parâmetro
         Essa variável vai ajudar a determinar quantas moedas de cada tipo
         são necessárias e qual será o valor restante depois que essas
         moedas forem contabilizadas.
         */
        var restante = centavos
        
        /**
         Determina quantas moedas de 1 real são necessárias
         Divida o valor por 100 pois 1 real é igual a 100 centavos
         Logo em seguida atualizamos o valor restante retirando os centavos já convertidos em moedas de um real
         */
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
        
        /*
         O valor restante depois de todas as operações
         será as moedas de um centavo necessárias.
         */
        let moedasUm = restante

        /*
         Soma de todas as moedas calculadas
         */
        let totalMoedas = moedasUmReal + moedasCinquenta + moedasVinteECinco + moedasDez + moedasCinco + moedasUm
        
        return (totalMoedas, moedasUmReal, moedasCinquenta, moedasVinteECinco, moedasDez, moedasCinco, moedasUm)
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Erro", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    func configurarLayout() {
        //navigationItem.hidesBackButton = true
        botaoCalcular.layer.cornerRadius = 12.0
        entradaCentavos.keyboardType = .numberPad
        
        let attributedPlaceholder = NSAttributedString(string: "Digite os centavos", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        entradaCentavos.attributedPlaceholder = attributedPlaceholder
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurarLayout()
    }
}
