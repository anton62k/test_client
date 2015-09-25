package base.robotlegs {

	import flash.display.Stage;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;

	import robotlegs.bender.extensions.contextView.ContextView;
	import robotlegs.bender.framework.api.LogLevel;
	import robotlegs.bender.framework.impl.Context;
	import robotlegs.extensions.starlingViewMap.StarlingViewMapExtension;

	import starling.core.Starling;
	import starling.display.DisplayObjectContainer;

	public class Module extends Context {

		public function Module(name:String, config:Class, contextView:Vector.<DisplayObjectContainer>, ...injects) {
			this.config = new config() as BaseConfig;
			this.config.name = name;
			this.contextView = contextView;

			this.logLevel = LogLevel.WARN;

			injects.push(this.contextView);

			var cl:Class;
			for each (var item:Object in injects) {
				if (item as Array) {
					cl = item[1];
					item = item[0];
				} else if (item) {
					cl = getDefinitionByName(getQualifiedClassName(item)) as Class;
				}
				injector.map(cl).toValue(item);
			}

			injector.map(Stage).toValue(Starling.current.nativeStage);
			startup();
		}

		public var contextView:Vector.<DisplayObjectContainer>;
		public var config:BaseConfig;

		protected function startup():void {
			install(CustomMVCSBundle, StarlingViewMapExtension);
			configure(new ContextView(Starling.current.nativeStage), config, Starling.current);
			initialize(onInitialize);
			beforeDestroying(onBeforeDestroying);
		}

		protected function onInitialize():void {
			config.startup(contextView);
		}

		protected function onBeforeDestroying():void {
			contextView = null;
			config = null;
		}

	}
}
