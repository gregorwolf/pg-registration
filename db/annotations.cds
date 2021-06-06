using {db} from './schema';

// Workaround for the pop-up during creation
annotate db.Registration with {
  ID @Core.Computed;
}

annotate db.Registration with @(UI : {
  SelectionFields     : [
    firstname,
    lastname,
    email
  ],
  LineItem            : [
    {Value : firstname},
    {Value : lastname},
    {Value : email},
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
  ]}
});
