//
//  ContactStoreStrategy.swift
//  contacts
//
//  Created by Maurits van Beusekom on 28/08/2018.
//

import Contacts
import Foundation

@available(iOS 9.0, *)
class ContactStoreStrategy : ContactStrategy {

    func fetchContacts() -> [Contact] {
        let contactStore = CNContactStore()
        let keysToFetch = [
            CNContactDepartmentNameKey,
            CNContactEmailAddressesKey,
            CNContactFamilyNameKey,
            CNContactGivenNameKey,
            CNContactIdentifierKey,
            CNContactMiddleNameKey,
            CNContactInstantMessageAddressesKey,
            CNContactJobTitleKey,
            CNContactNamePrefixKey,
            CNContactNameSuffixKey,
            CNContactNicknameKey,
            CNContactNoteKey,
            CNContactOrganizationNameKey,
            CNContactPhoneNumbersKey,
            CNContactPostalAddressesKey,
            CNContactRelationsKey,
            CNContactSocialProfilesKey,
            CNContactTypeKey,
            CNContactUrlAddressesKey,
            CNInstantMessageAddressServiceKey,
            CNInstantMessageAddressUsernameKey,
            CNPostalAddressCityKey,
            CNPostalAddressStateKey,
            CNPostalAddressStreetKey,
            CNPostalAddressCountryKey,
            CNPostalAddressPostalCodeKey] as [Any]
        
        // Get all the containers
        var allContainers: [CNContainer] = []
        do {
            allContainers = try contactStore.containers(matching: nil)
        } catch {
            print("Error fetching containers")
        }
        
        var results: [CNContact] = []
        
        // Iterate all containers and append their contacts to our results array
        for container in allContainers {
            let fetchPredicate = CNContact.predicateForContactsInContainer(withIdentifier: container.identifier)
            
            do {
                let containerResults = try contactStore.unifiedContacts(matching: fetchPredicate, keysToFetch: keysToFetch as! [CNKeyDescriptor])
                results.append(contentsOf: containerResults)
            } catch {
                print("Error fetching results for container")
            }
        }
        
        return results.toContacts()
    }
    
}
