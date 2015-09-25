package modules.main.view {

	import modules.main.model.MainModel;
	import modules.main.view.components.MainNavigator;

	import robotlegs.extensions.starlingViewMap.impl.StarlingMediator;

	public class MainMediator extends StarlingMediator {

		[Inject]
		public var view:MainNavigator;

		[Inject]
		public var model:MainModel;

		override public function initialize():void {
			view.init(model);

			model.signal.add(onChangeModel);
		}

		override public function destroy():void {
			model.signal.remove(onChangeModel);
		}

		private function onChangeModel(fields:Array):void {
			if (fields.indexOf('state') != -1) {
				view.changeState(model.state);
			}
		}
	}
}
