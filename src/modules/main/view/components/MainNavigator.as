package modules.main.view.components {

	import feathers.controls.ScreenNavigator;
	import feathers.controls.ScreenNavigatorItem;
	import feathers.motion.Fade;

	import modules.main.consts.States;
	import modules.main.model.MainModel;

	public class MainNavigator extends ScreenNavigator {

		public function init(model:MainModel):void {
			var introItem:ScreenNavigatorItem = new ScreenNavigatorItem(IntroScreen);
			addScreen(States.INTRO, introItem);

			var mainItem:ScreenNavigatorItem = new ScreenNavigatorItem(MainScreen);
			addScreen(States.MAIN, mainItem);

			changeState(model.state);
		}

		public function changeState(state:String):void {
			showScreen(state, getTransition(state));
		}

		public function getTransition(state:String):Function {
			if (!activeScreenID) {
				return null;
			}

			var rt:Function;
			switch (state) {
				case States.INTRO:
					rt = Fade.createCrossfadeTransition();
					break;
				case States.MAIN:
					rt = Fade.createCrossfadeTransition();
					break;
			}
			return rt;
		}
	}
}
