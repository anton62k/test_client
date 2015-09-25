package modules.main.service {

	import base.robotlegs.BaseService;

	public class LanguageService extends BaseService {

		[Embed(source='language/language.json', mimeType='application/octet-stream')]
		private static const languageClass:Class; // test

		private var data:Object;

		[PostConstruct]
		public function postConstruct():void {
			data = JSON.parse(new languageClass());
		}

		public function getText(module:String, id:String):String {
			return data[module][id];
		}

	}
}
