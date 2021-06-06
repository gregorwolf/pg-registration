using {db} from '../db/schema';

@(requires : 'admin')
service RegistrationAdminService {

  @readonly
  entity Registration as projection on db.Registration;

}
