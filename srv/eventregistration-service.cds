using {sap.ui5.eventregistration as my} from '../db/schema';

service EventRegistrationService @(requires: 'any') {
  entity Person       as projection on my.Person;
  entity FamilyMember as projection on my.FamilyMember;
}
