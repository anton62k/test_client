package modules.main.commands {

	import base.robotlegs.BaseCommand;

	import modules.main.consts.States;
	import modules.main.events.MainEvent;
	import modules.main.model.MainModel;

	public class StartupCommand extends BaseCommand {

		[Inject]
		public var mainModel:MainModel;

		override public function execute():void {
			dispatch(new MainEvent(MainEvent.LANGUAGE));
			dispatch(new MainEvent(MainEvent.SET_STATE, States.INTRO));
		}


	}
}
