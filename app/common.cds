/*
  Common Annotations shared by all apps
*/

using { de.datatrain as db } from '../db/data-model-cockpit';


////////////////////////////////////////////////////////////////////////////
//
//	Tile List
//
annotate db.Tiles with @(
	UI: {
		Identification: [{Value:title}],
	  	SelectionFields: [ TileId, TileName, Description, PageId ],
		LineItem: [
			{Value: TileId},
			{Value: TileName},
			{Value: Description, Label:'{i18n>Author}'},
			{Value: PageId},
			{Value: IconId},
			{Value: ParentId, Label:' '},
		]
	}
);



////////////////////////////////////////////////////////////////////////////
//
//	Tile Details
//
annotate db.Tiles with @(
	UI: {
  	HeaderInfo: {
  		Title: {Value: TileId},
  		Description: {Value: Description}
  	},
	}
);



////////////////////////////////////////////////////////////////////////////
//
//	Tile Elements
//
annotate db.Tiles with {
	TileId @title:'{i18n>ID}' @UI.HiddenFilter;
	TileName @title:'{i18n>Title}';
	Description @title:'{i18n>AuthorID}';
	PageId @title:'{i18n>Price}';
	IconId @title:'{i18n>Stock}';
	ParentId @UI.MultiLineText;
}


