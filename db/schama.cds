namespace db;

using {
  cuid,
  managed
} from '@sap/cds/common';

@assert.unique : {email : [email]}
entity Registration : cuid, managed {
  firstname : String;
  lastname  : String;
  email     : String;
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
