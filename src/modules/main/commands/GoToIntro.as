package modules.main.commands {

	import base.robotlegs.BaseCommand;

	import modules.main.consts.States;
	import modules.main.events.MainEvent;
	import modules.main.service.FloxManager;

	public class GoToIntro extends BaseCommand {

		[Inject]
		public var flox:FloxManager;

		override public function execute():void {
			flox.sendEvent(FloxManager.GO_INTRO_CLICKED);
			dispatch(new MainEvent(MainEvent.SET_STATE, States.INTRO));
		}
	}
}
