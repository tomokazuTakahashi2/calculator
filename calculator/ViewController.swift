//
//  ViewController.swift
//  calculator
//
//  Created by Raphael on 2019/11/15.
//  Copyright © 2019 takahashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //演算子の次のナンバー
    var numberOnLabel:Double = 0
    //表示されているナンバー
    var previousNumber:Double = 0
    var performingMath = false
    var operation = 0
    var usedPeriod = false
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        //もし、センダータグが１８（小数点ボタン）の場合
        if(sender.tag == 18){
            //もし、小数点がなかったら
            if(usedPeriod == false){
                //ラベルテキストにはラベルテキスト＋「.」と表示
                label.text = label.text! + "."
                //numberOnLabelにはラベルテキスト＋０をDouble型で表示
                numberOnLabel = Double(label.text!+"0")!
                //小数点は使う
                usedPeriod = true;
            }
        //センダータグが１８(小数点ボタン)でなかったら、
        }else{
            //もし、パフォーミングマスがONだったら
            if(performingMath == true){
                //ラベルテキストにはセンダータグから１を引いた数をString型にして表示
                label.text = String(sender.tag-1)
                //numberOnLabelにはラベルテキストをDouble型にしたものを表示
                numberOnLabel = Double(label.text!)!
                //パフォーミングマスをOFFにする
                performingMath = false
            //パフォーミングマスがOFFだったら
            }else{
                //もし、ラベルテキストが０でなかったら、
                if(label.text != "0"){
                //ラベルテキストにはラベルテキスト＋センダータグから１を引いたものをString型にして表示
                    label.text = label.text! + String(sender.tag-1)
                    //numberOnLabelにはラベルテキストをDouble型にしたものを表示
                    numberOnLabel = Double(label.text!)!
                //ラベルテキストが０だったら
                }else{
                    //ラベルテキストにはセンダータグをDouble型にしたものを表示
                    label.text = String(sender.tag-1)
                    //numberOnLabelにはラベルテキストをDouble型にしたものを表示
                    numberOnLabel = Double(label.text!)!
                }
            }
        }
    }
    
    @IBAction func tap00Button(_ sender: Any) {
        label.text = label.text! + "00"
        numberOnLabel = Double(label.text!)!
    }
    
    @IBAction func tap000Button(_ sender: Any) {
        label.text = label.text! + "000"
        numberOnLabel = Double(label.text!)!
    }
    
    @IBAction func buttons(_ sender: UIButton) {
    //もし、ラベルテキストが空でなく、かつセンダータグが１７(税込ボタン)か、またはセンダータグが１９(税抜ボタン)の場合
        if(label.text != "" && sender.tag == 17 || sender.tag == 19){
            //もし、センダータグが１７（税込ボタン）だったら、
            if(sender.tag == 17){
                //numberOnLabelには テキストラベルをDouble型にして1.08をかける
                numberOnLabel = Double(label.text!)! * 1.08
                //ラベルテキストにはnumberOnLabelをString型にして表示する
                label.text = String(numberOnLabel)
                //小数点は使う
                usedPeriod = true
            //センダータグが１９（税抜ボタン）だったら、
            }else{
                //numberOnLabelはnumberOnLabelを1.08で割った数とし、
                numberOnLabel = numberOnLabel / 1.08
            //ラベルテキストにはnumberOnLabelをInt型にしたものをString型にしたものを表示する
                label.text = String(Int(numberOnLabel))
            }
        }
    //あるいはラベルテキストが空でなく、センダータグが１１（Cボタン）でなく、センダータグが１６（＝ボタン）でない時
        else if(label.text != "" && sender.tag != 11 && sender.tag != 16){
            //プレビューナンバーはDoble型
            previousNumber = Double(label.text!)!
            //もし、センダータグが１２(÷ボタン)だったら、ラベルテキストに「÷」を表示
            if(sender.tag == 12){//devide
                label.text = "÷"
            }
            //あるいはセンダータグが１３（×ボタン）だったら、ラベルテキストに「×」を表示
            else if(sender.tag == 13){//multiply
                label.text = "×"
            }
            //あるいはセンダータグが１４（-ボタン）だったら、ラベルテキストに「-」を表示
            else if(sender.tag == 14){//minus
                label.text = "-"
            }
            //あるいはセンダータグが１５（+ボタン）だったら、ラベルテキストに「+」を表示
            else if(sender.tag == 15){//plus
                label.text = "+"
            }
            performingMath = true
            operation = sender.tag
        }
        //あるいはセンダータグが１６(＝ボタン)の時
        else if(sender.tag == 16){
        //もし、オペレーション(センダータグ)が１２(÷)だったら、ラベルテキストにpreviousNumber÷numberOnLabelの答えを表示
            if(operation == 12){
                label.text = String(previousNumber / numberOnLabel)
            }
        //あるいは、オペレーション(センダータグ)が１３(×)だったら、ラベルテキストにpreviousNumber×numberOnLabelの答えを表示
            else if(operation == 13){
                label.text = String(previousNumber * numberOnLabel)
            }
        //あるいは、オペレーション(センダータグ)が１４(-)だったら、ラベルテキストにpreviousNumber-numberOnLabelの答えを表示
            else if(operation == 14){
                label.text = String(previousNumber - numberOnLabel)
            }
        //もし、オペレーション(センダータグ)が１５(+)だったら、ラベルテキストにpreviousNumber+numberOnLabelの答えを表示
            else if(operation == 15){
                label.text = String(previousNumber + numberOnLabel)
            }
        }
        //あるいは、センダータグが１１(クリアボタン)だったら
        else if(sender.tag == 11){
            //ラベルテキストに「０」と表示
            label.text = "0"
            //previousNumberは０
            previousNumber = 0
            //numberOnLabelは０
            numberOnLabel = 0
            //operationは０
            operation = 0
            //小数点はつけない
            usedPeriod = false
        }
        
    }
    
    
}
