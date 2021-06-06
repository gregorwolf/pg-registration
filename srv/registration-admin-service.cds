using {db} from '../db/schama';

@(requires : 'admin')
service RegistrationAdminService {

  @readonly
  entity Registration as projection on db.Registration;

}
