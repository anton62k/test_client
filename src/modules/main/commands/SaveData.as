package modules.main.commands {

	import base.robotlegs.BaseCommand;

	import modules.main.service.SavedData;

	public class SaveData extends BaseCommand {

		override public function execute():void {
			context.detain(this);

			var savedData:SavedData = new SavedData();
			savedData.testParam = 10; // test

			savedData.save(onComplete, onError);
		}

		private function onComplete(savedData:SavedData):void {
			trace('success');
			context.release(this);
		}

		private function onError(error:String):void {
			trace(error);
			context.release(this);
		}
	}
}
