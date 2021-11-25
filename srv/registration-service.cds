using {db} from '../db/schema';

@(requires : 'authenticated-user')
service RegistrationService {

  @(restrict : [{
    grant : '*',
    where : 'createdBy = $user'
  }])
  entity Registration as projection on db.Registration;

  @readonly
  entity UserScopes {
    key username  : String  @(title : '{i18n>username}');
        email     : String  @(title : '{i18n>email}');
        firstname : String  @(title : '{i18n>firstname}');
        lastname  : String  @(title : '{i18n>lastname}');
        is_admin  : Boolean @(title : '{i18n>is_admin}');
  };

}
