//
//  NYTimesError.swift
//  NYTimes News
//
//  Created by Nada Yehia Dawoud on 13/12/2020.
//

import Foundation

enum NYTimesError: String, Error {
    case incorrectURL = "The endpoint URL is incorrect!"
    case noInternetConnection = "Unable to complete your request. Please check your internet connection."
    case invalidServerResponse = "Invalid Server Response!"
    case noData = "No data received from sever!"
    case invalidData = "Data received from sever is invalid!"
}

