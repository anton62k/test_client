package modules.main.service {

	import base.robotlegs.BaseService;

	import com.gamua.flox.Flox;

	public class FloxManager extends BaseService {

		[PostConstruct]
		public function postConstruct():void {
			Flox.init("Mvabh4NhhNp319Jx", "5B55VYqyxeo2K7fE", "0.9");
		}

		public function sendEvent(event:String, params:Object = null):void {
			Flox.logEvent(event, params);
		}

		public static const GO_INTRO_CLICKED:String = 'go_intro_clicked';
		public static const GO_MAIN_CLICKED:String = 'go_main_clicked';
	}
}
