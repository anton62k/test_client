package base.robotlegs {

	import flash.events.Event;
	import flash.events.IEventDispatcher;

	import robotlegs.bender.bundles.mvcs.Command;
	import robotlegs.bender.framework.api.IContext;

	public class BaseCommand extends Command {

		[Inject]
		public var context:IContext;

		public function getModuleName():String {
			return (context as Module).config.name;
		}

		public function dispatch(event:Event):Boolean {
			var eventDispatcher:IEventDispatcher = context.injector.getInstance(IEventDispatcher);
			return eventDispatcher.dispatchEvent(event);
		}

	}
}
