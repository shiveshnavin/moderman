using {moderman as my} from '../db/schema';

service ModerationService @(requires: 'any') {

  @odata.draft.enabled
  entity ContentItem       as projection on my.ContentItem;

  entity ContentItemAction as projection on my.ContentItemAction;
}
