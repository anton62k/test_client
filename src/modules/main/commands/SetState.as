package modules.main.commands {

	import base.robotlegs.BaseCommand;

	import modules.main.events.MainEvent;
	import modules.main.model.MainModel;

	public class SetState extends BaseCommand {

		[Inject]
		public var model:MainModel;

		[Inject]
		public var event:MainEvent;

		override public function execute():void {
			model.updateField('state', event.data);
		}
	}
}
