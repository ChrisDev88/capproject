using AdminService from '../../../srv/admin-service';

////////////////////////////////////////////////////////////////////////////
//
//	Books Object Page
//
annotate AdminService.Tiles with @(
	UI: {
		LineItem: [
			{Value: TileId},
			{Value: TileName},
			{Value: Description, Label:'{i18n>Author}'},
			{Value: PageId},
			{Value: IconId},
			{Value: ParentId, Label:' '},
		],
		Facets: [
			{$Type: 'UI.ReferenceFacet', Label: '{i18n>General}', Target: '@UI.FieldGroup#General'},
			{$Type: 'UI.ReferenceFacet', Label: '{i18n>Translations}', Target:  'texts/@UI.LineItem'},
			{$Type: 'UI.ReferenceFacet', Label: '{i18n>Details}', Target: '@UI.FieldGroup#Details'},
			{$Type: 'UI.ReferenceFacet', Label: '{i18n>Admin}', Target: '@UI.FieldGroup#Admin'},
		],
		FieldGroup#General: {
			Data: [
				{Value: TileId},
				{Value: Tilename},
				{Value: Description},
			]
		},
		FieldGroup#Details: {
			Data: [
				{Value: PageId},
				{Value: IconId},
				{Value: ParentId, Label: '{i18n>Currency}'},
			]
		},
		FieldGroup#Admin: {
			Data: [
				{Value: createdBy},
				{Value: createdAt},
				{Value: modifiedBy},
				{Value: modifiedAt}
			]
		}
	}
);

annotate AdminService.Tiles_texts with @(
	UI: {
		Identification: [{Value:title}],
		SelectionFields: [ locale, title ],
		LineItem: [
			{Value: locale, Label: '{i18n>Locale}'},
			{Value: TileName, Label: '{i18n>Title}'},
			{Value: Description, Label: '{i18n>Description}'},
		]
	}
);




// annotate AdminService.Tiles actions {
// 	addToOrder(
// 		order_ID @(
// 			title: '{i18n>Order}',
// 			Common: {
// 				ValueListMapping: {
// 					Label: '{i18n>Orders}',
// 					CollectionPath: 'Orders',
// 					Parameters: [
// 					{ $Type:'Common.ValueListParameterInOut', LocalDataProperty: order_ID, ValueListProperty: 'ID' },
// 					{ $Type:'Common.ValueListParameterDisplayOnly', ValueListProperty: 'OrderNo' },
// 					{ $Type:'Common.ValueListParameterDisplayOnly', ValueListProperty: 'createdBy' },
// 					{ $Type:'Common.ValueListParameterDisplayOnly', ValueListProperty: 'createdAt' }
// 					],
// 				}
// 			}
// 		),
// 		amount @title: '{i18n>Amount}'
// 	)
// }
