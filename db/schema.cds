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
                             on contentItemActions.contentItem = $self;
}

entity ContentItemAction : managed {
  key ID                  : UUID;
      ownerApp            : String(100);
      actionName          : String(100);
      actionStatus        : String(100);
      actionCompletedDate : Date;
      actionUrl           : String(100);
      actionHeaders       : String(100);
      actionMethod        : String(100);
      actonPayload        : String(4000);
      actionType          : String(120);
      contentItem         : Association to ContentItem;
}
