package modules.main.events {

	import flash.events.Event;

	public class MainEvent extends Event {

		public static const GO_TO_MAIN:String = 'goToMain';
		public static const GO_TO_INTRO:String = 'goToIntro';
		public static const SAVE_DATA:String = 'saveData';
		public static const LANGUAGE:String = 'language';
		public static const SET_STATE:String = 'setState';

		public function MainEvent(type:String, data:Object = null, bubbles:Boolean = false, cancelable:Boolean = false) {
			super(type, bubbles, cancelable);
			this.data = data;
		}

		public var data:Object;

	}
}