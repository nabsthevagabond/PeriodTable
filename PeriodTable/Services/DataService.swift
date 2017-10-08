//
//  DataService.swift
//  PeriodTable
//
//  Created by nabs on 2017-10-06.
//  Copyright © 2017 nabs. All rights reserved.
//

import Foundation

class DataService {
   //static let instance: DataService = DataService()
    
    private struct JSONDataKey {
        static let elements = "elements"
        static let name = "name"
        static let appearance = "appearance"
        static let atomicMass = "atomic_mass"
        static let boil = "boil"
        static let catergory = "category"
        static let color = "color"
        static let density = "density"
        static let discoveredBy = "discovered_by"
        static let melt = "melt"
        static let molarHeat = "molar_heat"
        static let namedBy = "named_by"
        static let number = "number"
        static let period = "period"
        static let phase = "phase"
        static let source = "source"
        static let spectralImg = "spectral_img"
        static let summary = "summary"
        static let symbol = "symbol"
        static let xpos = "xpos"
        static let ypos = "ypos"
        static let shells = "shells"
    }
    
    private static func getJSONData()-> [String:[Any]]? {
    
        guard let pathUrl = Bundle.main.url(forResource: "PeriodicTableJSON", withExtension: "json") else {
            print("Error: Could not retrieve file path from Bundle." )
            return nil
        }
        
        guard let data = try? Data(contentsOf: pathUrl) else {
            print("Error: Could not retrieve file: \(pathUrl)" )
            return nil
        }
        
        guard let json = try? JSONSerialization.jsonObject(with: data) as? [String:[Any]] else {
            print("Could not convert data into JSON object")
            return nil
        }
        
        return json
    }
    
    static func jsonToElements()->[Element]{
        
        var elementsArray: [Element] = []
        
        guard let json = getJSONData() else {
            print("could not open JSON file.")
            return elementsArray
        }
        
        if let elements = json[JSONDataKey.elements] as? [[ String: Any]] {
            
            for element in elements {
                
                //JSON file has been verified to contain valid values at these keys.
                let name = element[JSONDataKey.name] as! String
                let catergory = element[JSONDataKey.catergory] as! String
                let phase = element[JSONDataKey.phase] as! String
                let source = element[JSONDataKey.source] as! String
                let summary = element[JSONDataKey.summary] as! String
                let symbol = element[JSONDataKey.symbol] as! String
                
                let number = element[JSONDataKey.number] as! Int
                let period = element[JSONDataKey.period] as! Int
                let xpos = element[JSONDataKey.xpos] as! Int
                let ypos = element[JSONDataKey.ypos] as! Int
                let shells = element[JSONDataKey.shells] as! [Int]
                
                let atomicMass = element[JSONDataKey.atomicMass] as! Double
                
                //optional information
                let appearance = element[JSONDataKey.appearance] as? String
                let discoveredBy = element[JSONDataKey.discoveredBy] as? String
                let namedBy = element[JSONDataKey.namedBy] as? String
                let spectral = element[JSONDataKey.spectralImg] as? String
                let color = element[JSONDataKey.color] as? String

                let boil = element[JSONDataKey.boil] as? Double
                let density = element[JSONDataKey.density] as? Double
                let melt = element[JSONDataKey.melt] as? Double
                let molarHeat = element[JSONDataKey.molarHeat] as? Double
                
                let elementObject = Element(name: name, symbol: symbol, category: catergory, phase: phase, source: source, summary: summary, atomicMass: atomicMass, number: number, period: period, xpos: xpos, ypos: ypos, shells: shells, appearance: appearance, discoveredBy: discoveredBy, namedBy: namedBy, spectralImg: spectral, color: color, boil: boil, density: density, melt: melt, molarHeat: molarHeat)
            
                elementsArray.append(elementObject)
            }
        }
        return elementsArray
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
}
