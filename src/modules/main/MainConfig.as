package modules.main {

	import base.robotlegs.BaseConfig;

	import modules.main.commands.GoToIntro;
	import modules.main.commands.GoToMain;
	import modules.main.commands.Language;
	import modules.main.commands.SaveData;
	import modules.main.commands.SetState;
	import modules.main.commands.StartupCommand;
	import modules.main.events.MainEvent;
	import modules.main.model.IntroScreenModel;
	import modules.main.model.MainModel;
	import modules.main.model.MainScreenModel;
	import modules.main.service.FloxManager;
	import modules.main.service.LanguageService;
	import modules.main.view.IntroScreenMediator;
	import modules.main.view.MainMediator;
	import modules.main.view.MainScreenMediator;
	import modules.main.view.components.IntroScreen;
	import modules.main.view.components.MainNavigator;
	import modules.main.view.components.MainScreen;

	public class MainConfig extends BaseConfig {

		override public function initialize():void {
			inject.map(FloxManager).asSingleton();
			inject.map(MainModel).asSingleton();
			inject.map(IntroScreenModel).asSingleton();
			inject.map(MainScreenModel).asSingleton();
			inject.map(LanguageService).asSingleton();

			mediator.map(MainNavigator).toMediator(MainMediator);
			mediator.map(IntroScreen).toMediator(IntroScreenMediator);
			mediator.map(MainScreen).toMediator(MainScreenMediator);

			command.map(MainEvent.SET_STATE, MainEvent).toCommand(SetState);
			command.map(MainEvent.LANGUAGE, MainEvent).toCommand(Language);
			command.map(MainEvent.GO_TO_INTRO, MainEvent).toCommand(GoToIntro);
			command.map(MainEvent.GO_TO_MAIN, MainEvent).toCommand(GoToMain);
			command.map(MainEvent.SAVE_DATA, MainEvent).toCommand(SaveData);

			startupCommand = StartupCommand;
			startupView = MainNavigator;
		}

	}
}
