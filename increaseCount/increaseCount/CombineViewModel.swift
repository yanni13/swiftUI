//
//  CombineViewModel.swift
//  increaseCount
//
//  Created by 아우신얀 on 3/11/24.
//

import Combine
import SwiftUI

class CombineViewModel {
    var number = CurrentValueSubject<Int, Never>(23)
    //하나의 값을 둘러싸고 값이 변동될 때 publish
}
