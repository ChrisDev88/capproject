using AdminService from '../../../srv/admin-service';

annotate AdminService.Tiles with @(
	UI: {
		////////////////////////////////////////////////////////////////////////////
		//
		//	Lists of Orders
		//
		SelectionFields: [ createdAt, createdBy ],
		LineItem: [
			{Value: TileId, Label:'{i18n>TileId}'},
			{Value: TileName, Label: '{i18n>TileName}' },
			{Value: Description, Label:'{i18n>TileText}'}
		],
		////////////////////////////////////////////////////////////////////////////
		//
		//	Order Details
		//
		HeaderInfo: {
			TypeName: '{i18n>Tile}', TypeNamePlural: '{i18n>Tiles}',
			Title: {
				Label: '{i18n>TileName}', //A label is possible but it is not considered on the ObjectPage yet
				Value: TileName
			},
			Description: {Value: Description}
		},
		Identification: [ //Is the main field group
			{Value: createdBy, Label:'{i18n>CreatedBy}'},
			{Value: createdAt, Label:'{i18n>CreatedAt}'},
			{Value: TileName },
		],
		HeaderFacets: [
			{$Type: 'UI.ReferenceFacet', Label: '{i18n>Created}', Target: '@UI.FieldGroup#Created'},
			{$Type: 'UI.ReferenceFacet', Label: '{i18n>Modified}', Target: '@UI.FieldGroup#Modified'},
		],
		Facets: [
			{$Type: 'UI.ReferenceFacet', Label: '{i18n>Details}', Target: '@UI.FieldGroup#Details'}
		],
		FieldGroup#Details: {
			Data: [
				{Value: IconId, Label:'{i18n>IconId}'},
				{Value: PageId, Label:'{i18n>PageId}'}
			]
		},
		FieldGroup#Created: {
			Data: [
				{Value: createdBy},
				{Value: createdAt},
			]
		},
		FieldGroup#Modified: {
			Data: [
				{Value: modifiedBy},
				{Value: modifiedAt},
			]
		},
	}
) {
	
};



