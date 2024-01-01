//
//  RunMockeyViewModel.swift
//  SwiftApp
//
//  Created by Ajit Satarkar on 13/12/23.
//

import Foundation
import OSLog

protocol RunMockeyProtocol: AnyObject {
    func returnData(runMockeyData : Welcome?)
    func returnError(error : UserError?)
}

final class RunMockeyViewModel {
    
    private(set) var runMockeyData : Welcome?
    private(set) var userError: UserError?
    weak var delegate : RunMockeyProtocol!
    
    func callRunMockeyAPI() {
        Task {
            do {
                self.runMockeyData = try await RunMockeyService.getRunMockeyModeDatal()
                self.delegate.returnData(runMockeyData:self.runMockeyData)
            } catch (let error) {
                let userError = UserError.custom(error: error)
                self.delegate.returnError(error: userError)
            }
        }
    }
    
}
