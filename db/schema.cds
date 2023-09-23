namespace moderman;

using {managed} from '@sap/cds/common';

entity ContentItem : managed {
  key ID                 : UUID;
      intentName         : String(100);
      contentUrl         : String(100);
      mediaType          : String(100);
      ownerApp           : String(120);
      targetActionDate   : Date;
      contentItemActions : Composition of many ContentItemAction
                             on contentItemActions.MainPerson = $self;
}

entity ContentItemAction : managed {
  key ID               : UUID;
      intentName       : String(100);
      contentUrl       : String(100);
      targetActionDate : Date;
      mediaType        : String(120);
      MainPerson       : Association to ContentItem;
}
