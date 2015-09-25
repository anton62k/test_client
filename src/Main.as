package {

	import base.consts.Modules;
	import base.robotlegs.Module;
	import base.starling.StarlingRoot;

	import feathers.themes.MetalWorksDesktopTheme;

	import feathers.themes.MetalWorksMobileTheme;

	import flash.display.Sprite;
	import flash.system.Capabilities;

	import modules.main.MainConfig;

	import starling.core.Starling;
	import starling.display.DisplayObjectContainer;
	import starling.events.Event;

	[SWF(width=1024, height=768, frameRate=60)]

	public class Main extends Sprite {

		public function Main() {
			makeStarling();
		}

		private var starling:Starling;

		private function makeStarling():void {
			starling = new Starling(StarlingRoot, stage, null, null, 'auto', 'auto');
			starling.addEventListener(Event.ROOT_CREATED, onCreateRoot);
			starling.start();
		}

		private function makeModule():void {
			new Module(Modules.MAIN, MainConfig, new <DisplayObjectContainer>[getRoot()]);
		}

		private function makeTheme():void {
			if (Capabilities.os.toLowerCase().indexOf('win') != -1) {
				new MetalWorksDesktopTheme();
			} else {
				new MetalWorksMobileTheme();
			}
		}

		private function getRoot():DisplayObjectContainer {
			return starling.stage.getChildAt(0) as DisplayObjectContainer;
		}

		private function onCreateRoot(event:Event):void {
			starling.removeEventListener(Event.ROOT_CREATED, onCreateRoot);
			makeTheme();
			makeModule();
		}

	}
}
