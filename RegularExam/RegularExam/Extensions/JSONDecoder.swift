//
//  JSONDecoder.swift
//  RegularExam
//
//  Created by Hristo Papanov on 5.02.23.
//

import Foundation

extension JSONDecoder {
    class var snakeCaseDecoder: JSONDecoder {
        let snakeCaseDecoder = JSONDecoder()
        snakeCaseDecoder.keyDecodingStrategy = .convertFromSnakeCase
        return snakeCaseDecoder
    }
}
