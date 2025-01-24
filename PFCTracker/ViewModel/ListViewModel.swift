//  Created by 仲村士苑 on 2025/01/22.
//

import Foundation


class ListViewModel:ObservableObject{
    
    @Published var model = PFCModel(gender: false, weight: 50, height: 150, age: 20, activeFactor: 1.2, frequencyWorkout: "", goal: "")
    @Published var bulkingOrDiet: Bool = false
    @Published var maintainWeight: Bool = false // false =  not maintain , true = maintain gain

    // if bulkinng  =  true, if not  = diet

    private var bulkingPercentage: Double {
        switch model.activeFactor {
        case 1.55...1.725: // Moderately active
            return 0.15
        case 1.725...1.9: // Very active
            return 0.20
        case 1.9...: // Extremely active
            return 0.25
        default: // Sedentary or low activity
            return 0.10
        }
    }

    private var dietingPercentage: Double {
        switch model.activeFactor {
        case 1.55...1.725: // Moderately active
            return 0.15
        case 1.725...1.9: // Very active
            return 0.10
        case 1.9...: // Extremely active
            return 0.05
        default: // Sedentary or low activity
            return 0.20
        }
    }



    func resetData() {
        
            model = PFCModel(gender: false, weight: 50, height: 150, age: 20, activeFactor: 1.2, frequencyWorkout: "", goal: "")
            bulkingOrDiet = false
            maintainWeight = false
        
        }



    func BMRCalc()-> Double{

        if model.gender {
            // menn
            let bmrForMan = (10 * model.weight) + (6.25 * model.height) - (5 * model.age) + 5
            return bmrForMan
        }

        else{
            // women
            let bmrForWoman = (10 * model.weight) + (6.25 * model.height) - (5 * model.age) - 161
            return bmrForWoman
        }
        

    }

    func TDEECalc()->Double{
        let tdee = BMRCalc() * model.activeFactor
        return tdee
    }




    func proteinCalc()-> Double{
        return model.weight * 2
    }



    func calcCalories() -> Double {
        if bulkingOrDiet {
            // Bulking
            return TDEECalc() * (1 + bulkingPercentage)
        } else {
            // Dieting
            return TDEECalc() * (1 - dietingPercentage)
        }
    }



    func fatCalc()-> Double{
        let fat = ( calcCalories() * 0.2) / 9
        return fat
    }




    func carboCalc()-> Double{
        if !maintainWeight{
            let carbo = (calcCalories() - ((proteinCalc() * 4) + (fatCalc() * 9))) / 4
            return carbo
        }
        else{
            let carbo = (TDEECalc() - ((proteinCalc() * 4) + (fatCalc() * 9))) / 4
            return carbo
        }


    }




}

