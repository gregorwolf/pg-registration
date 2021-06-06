using {db} from '../db/schama';

@(requires : 'authenticated-user')
service RegistrationService {

  @(restrict : [{
    grant : '*',
    where : 'createdBy = $user'
  }])
  entity Registration as projection on db.Registration;

}
