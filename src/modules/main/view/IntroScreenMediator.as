package modules.main.view {

	import feathers.events.FeathersEventType;

	import modules.main.events.MainEvent;
	import modules.main.model.IntroScreenModel;
	import modules.main.view.components.IntroScreen;

	import robotlegs.extensions.starlingViewMap.impl.StarlingMediator;

	import starling.events.Event;

	public class IntroScreenMediator extends StarlingMediator {

		[Inject]
		public var view:IntroScreen;

		[Inject]
		public var model:IntroScreenModel;

		override public function initialize():void {
			view.addEventListener(FeathersEventType.INITIALIZE, onInitView);
		}

		override public function destroy():void {
			view.gotoButton.removeEventListener(Event.TRIGGERED, onGoto);
		}

		private function makeView():void {
			view.gotoButton.label = model.titleGoToMain;
		}

		private function onInitView(event:Event):void {
			view.removeEventListener(FeathersEventType.INITIALIZE, onInitView);
			view.gotoButton.addEventListener(Event.TRIGGERED, onGoto);
			makeView();
		}

		private function onGoto(event:Event):void {
			dispatch(new MainEvent(MainEvent.GO_TO_MAIN));
		}

	}
}
