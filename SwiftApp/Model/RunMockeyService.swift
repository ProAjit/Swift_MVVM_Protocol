//
//  RunMockeyService.swift
//  SwiftApp
//
//  Created by Ajit Satarkar on 13/12/23.
//

import Foundation

struct APIEndpoints {
    static let urlStr = "https://run.mocky.io/v3/f66d53cb-1429-4e15-9a4f-29d3042aff5e"
}

final class RunMockeyService {
        
    static func getRunMockeyModeDatal() async throws -> Welcome {
        
        guard let url = URL(string: APIEndpoints.urlStr) else {
            throw UserError.invalidUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw UserError.invalidResponse
        }
    
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(Welcome.self, from: data)
        } catch {
            throw UserError.invalidData
        }
    }
    
}

enum UserError : LocalizedError {
    case invalidUrl
    case invalidData
    case invalidResponse
    case custom(error: Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidUrl:
            return "Invalid Url"
        case .invalidData:
            return "Invalid Data"
        case .invalidResponse:
            return "Invalid Response"
        case .custom(let error):
            return error.localizedDescription
        }
    }

}



/*
 Printing description of response:
 <NSHTTPURLResponse: 0x600000263c00> { URL: https://m.youtube.com/playlist?list=PLV7VzbWXa60E0rEzFEPsaX38kMXYTY2-R&si=ehFPxUHPEbA1rN3I } { Status Code: 200, Headers {
     "Alt-Svc" =     (
         "h3=\":443\"; ma=2592000,h3-29=\":443\"; ma=2592000"
     );
     "Cache-Control" =     (
         "no-cache, no-store, max-age=0, must-revalidate"
     );
     "Content-Encoding" =     (
         gzip
     );
     "Content-Type" =     (
         "text/html; charset=utf-8"
     );
     Date =     (
         "Tue, 26 Dec 2023 16:23:50 GMT"
     );
     Expires =     (
         "Mon, 01 Jan 1990 00:00:00 GMT"
     );
     Pragma =     (
         "no-cache"
     );
     Server =     (
         ESF
     );
     "Set-Cookie" =     (
         "GPS=1; Domain=.youtube.com; Expires=Tue, 26-Dec-2023 16:53:50 GMT; Path=/; Secure; HttpOnly",
         "YSC=gXddQGy-YvM; Domain=.youtube.com; Path=/; Secure; HttpOnly; SameSite=none",
         "VISITOR_INFO1_LIVE=PS_kN284VCU; Domain=.youtube.com; Expires=Sun, 23-Jun-2024 16:23:50 GMT; Path=/; Secure; HttpOnly; SameSite=none",
         "VISITOR_PRIVACY_METADATA=CgJJThIEGgAgUw%3D%3D; Domain=.youtube.com; Expires=Sun, 23-Jun-2024 16:23:50 GMT; Path=/; Secure; HttpOnly; SameSite=lax"
     );
     "Strict-Transport-Security" =     (
         "max-age=31536000"
     );
     "cross-origin-opener-policy" =     (
         "same-origin-allow-popups; report-to=\"youtube_mobile\""
     );
     "origin-trial" =     (
         "AvC9UlR6RDk2crliDsFl66RWLnTbHrDbp+DiY6AYz/PNQ4G4tdUTjrHYr2sghbkhGQAVxb7jaPTHpEVBz0uzQwkAAAB4eyJvcmlnaW4iOiJodHRwczovL3lvdXR1YmUuY29tOjQ0MyIsImZlYXR1cmUiOiJXZWJWaWV3WFJlcXVlc3RlZFdpdGhEZXByZWNhdGlvbiIsImV4cGlyeSI6MTcxOTUzMjc5OSwiaXNTdWJkb21haW4iOnRydWV9"
     );
     p3p =     (
         "CP=\"This is not a P3P policy! See http://support.google.com/accounts/answer/151657?hl=en-GB for more info.\""
     );
     "permissions-policy" =     (
         "ch-ua-arch=*, ch-ua-bitness=*, ch-ua-full-version=*, ch-ua-full-version-list=*, ch-ua-model=*, ch-ua-wow64=*, ch-ua-form-factor=*, ch-ua-platform=*, ch-ua-platform-version=*"
     );
     "report-to" =     (
         "{\"group\":\"youtube_mobile\",\"max_age\":2592000,\"endpoints\":[{\"url\":\"https://csp.withgoogle.com/csp/report-to/youtube_mobile\"}]}"
     );
     "x-content-type-options" =     (
         nosniff
     );
     "x-frame-options" =     (
         SAMEORIGIN
     );
     "x-xss-protection" =     (
         0
     );
 } }
 Invalid Data
 let urlStr = "https://youtube.com/playlist?list=PLV7VzbWXa60E0rEzFEPsaX38kMXYTY2-R&si=ehFPxUHPEbA1rN3I"

 */
