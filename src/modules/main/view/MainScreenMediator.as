package modules.main.view {

	import feathers.events.FeathersEventType;

	import modules.main.events.MainEvent;
	import modules.main.model.MainScreenModel;
	import modules.main.view.components.MainScreen;

	import robotlegs.extensions.starlingViewMap.impl.StarlingMediator;

	import starling.events.Event;

	public class MainScreenMediator extends StarlingMediator {

		[Inject]
		public var view:MainScreen;

		[Inject]
		public var model:MainScreenModel;

		override public function initialize():void {
			view.addEventListener(FeathersEventType.INITIALIZE, onInitView);
		}

		override public function destroy():void {
			view.gotoButton.removeEventListener(Event.TRIGGERED, onGoto);
			view.saveButton.removeEventListener(Event.TRIGGERED, onSaveData);
		}

		private function makeView():void {
			view.gotoButton.label = model.titleGotoToIntro;
			view.saveButton.label = model.titleSaveData;
		}

		private function onInitView(event:Event):void {
			view.removeEventListener(FeathersEventType.INITIALIZE, onInitView);
			view.gotoButton.addEventListener(Event.TRIGGERED, onGoto);
			view.saveButton.addEventListener(Event.TRIGGERED, onSaveData);

			makeView();
		}

		private function onGoto(event:Event):void {
			dispatch(new MainEvent(MainEvent.GO_TO_INTRO));
		}

		private function onSaveData(event:Event):void {
			dispatch(new MainEvent(MainEvent.SAVE_DATA));
		}

	}
}
