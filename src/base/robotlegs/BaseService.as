package base.robotlegs {

	import flash.events.Event;
	import flash.events.IEventDispatcher;

	import robotlegs.bender.framework.api.IContext;

	public class BaseService {

		[Inject]
		public var context:IContext;


		public function dispatch(event:Event):void {
			var eventDispatcher:IEventDispatcher = context.injector.getInstance(IEventDispatcher);
			eventDispatcher.dispatchEvent(event);
		}


	}

}