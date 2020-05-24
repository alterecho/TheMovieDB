//
//  UserReviewsAPIWorker.swift
//  The Movie DB
//
//  Created by v.a.jayachandran on 23/5/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import RxSwift
import Moya

class UserReviewsAPIWorker: UserReviewsAPIWorkerProtocol {
    
    func fetchUserReviews(movieID: Int) -> Observable<UserReviewsResponse> {
        return Observable.create { observer in
            MoyaProvider<Services>().request(.userReviews(movieID: movieID)) { result in
                switch result {
                case .success(let response):
                    if let error = Services.errorFrom(response: response, data: response.data) {
                        observer.onError(error)
                    } else {
                        do {
                            let genreResponse = try JSONDecoder().decode(UserReviewsResponse.self, from: response.data)
                            observer.onNext(genreResponse)
                        } catch {
                            observer.onError(error)
                        }

                    }
                case .failure(let error):
                    observer.onError(error)
                }
            }

            return Disposables.create()
        }
    }
    
}
