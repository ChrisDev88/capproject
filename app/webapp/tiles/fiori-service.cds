using AdminService from '../../../srv/admin-service';

 //annotate AdminService.Tiles with @odata.draft.enabled;

////////////////////////////////////////////////////////////////////////////
//
//	Tile Elements
//
annotate AdminService.Tiles with {
	Description @UI.MultiLineText;
}

annotate AdminService.Tiles with @(
	UI: {
		////////////////////////////////////////////////////////////////////////////
		//
		//	Lists of Tiles
		//
		SelectionFields: [ createdAt, createdBy ],
		LineItem: [
			{Value: TileName, Label: '{i18n>TileName}' },
			{Value: Description, Label:'{i18n>TileText}'}
		],
		////////////////////////////////////////////////////////////////////////////
		//
		//	Tile Details
		//
		HeaderInfo: {
			TypeName: '{i18n>Tile}', 
			TypeNamePlural: '{i18n>Tiles}',
			Title: {
				Label: '{i18n>TileName}', 
				Value: TileName
			},
			Description: {
				Label: '{i18n>TileText}',
				Value: Description}
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
				{Value: IconId, Label:'{i18n>TileIconId}'},
				{Value: PageId, Label:'{i18n>TilePageId}'},
				{Value: ParentId, Label:'{i18n>TileParentId}'},
				{Value: RoleId, Label:'{i18n>TileRoleId}'},
				{Value: SortId, Label:'{i18n>TileSortId}'}
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



