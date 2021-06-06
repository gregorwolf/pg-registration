using {db} from '../db/schema';

@(requires : 'authenticated-user')
service RegistrationService {

  @(restrict : [{
    grant : '*',
    where : 'createdBy = $user'
  }])
  entity Registration as projection on db.Registration;

}
