//
//  NYTimesError.swift
//  NYTimes News
//
//  Created by Nada Yehia Dawoud on 13/12/2020.
//

import Foundation

enum NYTimesError: String, Error {
    case incorrectURL = "Unable to complete your request. Please try again."
    case noInternetConnection = "Couldn't complete your request. Please check your internet connection."
    case invalidServerResponse = "Uh oh 😅! Something went wrong. Please try again."
    case noData = "We're very sorry 😅! Something went wrong. Please try again."
    case invalidData = "This is embarrassing 😅! Would you try again, please."
}

