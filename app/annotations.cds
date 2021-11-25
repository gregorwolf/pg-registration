using {db} from '../db/schema';
using {RegistrationService} from '../srv/registration-service';

// Workaround for the pop-up during creation
annotate db.Registration with {
  ID @Core.Computed;
}

annotate db.Registration with @(UI : {
  SelectionFields     : [
    firstname,
    lastname,
    email,
    registered
  ],
  LineItem            : [
    {Value : firstname},
    {Value : lastname},
    {Value : email},
    {Value : registered},
  ],
  HeaderInfo          : {
    TypeName       : '{i18n>Registration}',
    TypeNamePlural : '{i18n>Registrations}',
    Title          : {Value : email},
  },
  Facets              : [{
    $Type  : 'UI.ReferenceFacet',
    Label  : '{i18n>Details}',
    Target : '@UI.FieldGroup#Details'
  }, ],
  FieldGroup #Details : {Data : [
    {Value : firstname},
    {Value : lastname},
    {Value : email},
    {Value : registered},
  ]}
});

annotate RegistrationService.UserScopes with @(UI : {
  SelectionFields     : [
    username,
    email,
    firstname,
    lastname
  ],
  LineItem            : [
    {Value : username},
    {Value : email},
    {Value : firstname},
    {Value : lastname},
  ],
  HeaderInfo          : {
    TypeName       : '{i18n>UserScope}',
    TypeNamePlural : '{i18n>UserScopes}',
    Title          : {Value : username},
    Description    : {Value : email},
  },
  Facets              : [{
    $Type  : 'UI.ReferenceFacet',
    Label  : '{i18n>Details}',
    Target : '@UI.FieldGroup#Details'
  }, ],
  FieldGroup #Details : {Data : [
    {Value : username},
    {Value : email},
    {Value : firstname},
    {Value : lastname},
  ]}
});
