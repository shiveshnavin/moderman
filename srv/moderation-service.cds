using {moderman as my} from '../db/schema';

service ModerationService @(requires: 'any') {

  @odata.draft.enabled
  entity ContentItem       as projection on my.ContentItem;

  entity ContentItemAction as projection on my.ContentItemAction;
  entity ActionType        as projection on my.ActionType;
  entity MediaType         as projection on my.MediaType;

}
