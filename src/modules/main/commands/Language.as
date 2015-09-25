package modules.main.commands {

	import base.robotlegs.BaseCommand;

	import modules.main.model.IntroScreenModel;
	import modules.main.model.MainScreenModel;
	import modules.main.service.LanguageService;

	public class Language extends BaseCommand {

		[Inject]
		public var introModel:IntroScreenModel;

		[Inject]
		public var mainScreenModel:MainScreenModel;

		[Inject]
		public var languageService:LanguageService;


		override public function execute():void {
			introModel.titleGoToMain = getText('go_to_main');
			mainScreenModel.titleGotoToIntro = getText('go_to_intro');
			mainScreenModel.titleSaveData = getText('save_data');
		}

		private function getText(id:String):String {
			return languageService.getText(getModuleName(), id);
		}

	}
}
