namespace db;

using {
  cuid,
  managed
} from '@sap/cds/common';

@assert.unique : {email : [email]}
entity Registration : cuid, managed {
  firstname : String @(title : '{i18n>firstname}', );
  lastname  : String @(title : '{i18n>lastname}', );
  email     : String @(title : '{i18n>email}', );
}

// annotations for Data Privacy
annotate Registration with @PersonalData : {
  DataSubjectRole : 'Person',
  EntitySemantics : 'DataSubject'
}{
  ID        @PersonalData.FieldSemantics : 'DataSubjectID';
  firstname @PersonalData.IsPotentiallyPersonal;
  lastname  @PersonalData.IsPotentiallyPersonal;
  email     @PersonalData.IsPotentiallyPersonal;
}
