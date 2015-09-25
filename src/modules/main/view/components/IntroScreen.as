package modules.main.view.components {

	import feathers.controls.Button;
	import feathers.controls.Screen;
	import feathers.layout.AnchorLayout;
	import feathers.layout.AnchorLayoutData;

	public class IntroScreen extends Screen {

		public var gotoButton:Button;

		override protected function initialize():void {
			layout = new AnchorLayout();

			var item:AnchorLayoutData = new AnchorLayoutData();
			item.horizontalCenter = 0;
			item.verticalCenter = 0;

			gotoButton = new Button();
			gotoButton.width = 100;
			gotoButton.height = 50;
			gotoButton.layoutData = item;
			addChild(gotoButton);
		}
	}
}
