package base.robotlegs {

	import robotlegs.bender.extensions.directCommandMap.api.IDirectCommandMap;
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.extensions.modularity.api.IModuleConnector;
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.framework.api.IInjector;

	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;

	public class BaseConfig implements IConfig {

		[Inject]
		public var inject:IInjector;

		[Inject]
		public var mediator:IMediatorMap;

		[Inject]
		public var command:IEventCommandMap;

		[Inject]
		public var direct:IDirectCommandMap;

		[Inject]
		public var moduleConnector:IModuleConnector;

		public var name:String;

		protected var startupCommand:Class;
		protected var startupView:Class;
		protected var startupViews:Array = [];

		public function configure():void {
			initialize();
		}

		public function initialize():void {
			// override
		}

		public function addStartupView(view:Class, contextViewIndex:int):void {
			startupViews.push({view: view, index: contextViewIndex});
		}

		public function startup(contextView:Vector.<DisplayObjectContainer>):void {
			if (startupCommand) direct.map(startupCommand).execute();
			if (startupView) {
				contextView[0].addChild(new startupView() as DisplayObject);
			} else {
				for each (var item:Object in startupViews) {
					contextView[item.index].addChild(new item.view() as DisplayObject);
				}
			}
		}

	}
}
