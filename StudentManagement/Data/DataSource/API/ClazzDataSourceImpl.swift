//
//  ClazzDataSourceImpl.swift
//  StudentManagement
//
//  Created by anhtq on R 5/04/30.
//

import Foundation
import Combine
import RealmSwift

struct ClazzDataSourceImpl: ClazzDataSource {
    
    enum RepositoryError: Error {
        case clazzNotFound
        case invalidInput
    }
    
    
    let realm: Realm
    
        init() {
            realm = try! Realm()
        }
    
    func fetchClazzes(for schoolID: String) -> Future<[Clazz], Error> {
        return Future { promise in
            let realm = try! Realm()
            let clazzes = realm.objects(Clazz.self).filter("schoolID = %@", schoolID)
            promise(.success(Array(clazzes)))
        }
    }

    
    func addClazz(name: String, for schoolID: String) -> Future<Void, Error> {
        return Future { promise in
            do {
                try realm.write {
                    let clazz = Clazz()
                    clazz.schoolID = schoolID
                    clazz.name = name
                    realm.add(clazz)
                }
                promise(.success(()))
            } catch {
                promise(.failure(error))
            }
        }
    }
    
    func updateClazz(id classID: String, name: String) -> Future<Void, Error> {
        return Future { promise in
            guard let clazz = realm.object(ofType: Clazz.self, forPrimaryKey: classID) else {
                promise(.failure(RepositoryError.clazzNotFound))
                return
            }
            
            do {
                try realm.write {
                    clazz.name = name
                }
                promise(.success(()))
            } catch {
                promise(.failure(error))
            }
        }
    }
    
    func deleteClazz(id schoolID: String) -> Future<Void, Error> {
        return Future { promise in
            guard let clazz = realm.object(ofType: Clazz.self, forPrimaryKey: schoolID) else {
                promise(.failure(RepositoryError.clazzNotFound))
                return
            }
            
            do {
                try realm.write {
                    realm.delete(clazz)
                }
                promise(.success(()))
            } catch {
                promise(.failure(error))
            }
        }
    }
}

