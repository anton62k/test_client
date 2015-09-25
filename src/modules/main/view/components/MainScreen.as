package modules.main.view.components {

	import feathers.controls.Button;
	import feathers.controls.LayoutGroup;
	import feathers.controls.Screen;
	import feathers.layout.AnchorLayout;
	import feathers.layout.AnchorLayoutData;
	import feathers.layout.VerticalLayout;

	public class MainScreen extends Screen {

		public var gotoButton:Button;
		public var saveButton:Button;

		override protected function initialize():void {
			layout = new AnchorLayout();

			var anchorLayoutData:AnchorLayoutData = new AnchorLayoutData();
			anchorLayoutData.horizontalCenter = 0;
			anchorLayoutData.verticalCenter = 0;

			var layoutGroup:LayoutGroup = new LayoutGroup();
			layoutGroup.layoutData = anchorLayoutData;
			layoutGroup.layout = new VerticalLayout();
			addChild(layoutGroup);

			gotoButton = new Button();
			gotoButton.width = 100;
			gotoButton.height = 50;
			layoutGroup.addChild(gotoButton);

			saveButton = new Button();
			saveButton.width = 100;
			saveButton.height = 50;
			layoutGroup.addChild(saveButton);
		}
	}
}
