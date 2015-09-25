package modules.main.commands {

	import base.robotlegs.BaseCommand;

	import modules.main.consts.States;
	import modules.main.events.MainEvent;
	import modules.main.model.MainModel;
	import modules.main.service.FloxManager;

	public class GoToMain extends BaseCommand {

		[Inject]
		public var flox:FloxManager;

		[Inject]
		public var model:MainModel;

		override public function execute():void {
			flox.sendEvent(FloxManager.GO_MAIN_CLICKED, {ammount: ++model.go_main_clicked});
			dispatch(new MainEvent(MainEvent.SET_STATE, States.MAIN));
		}
	}
}
