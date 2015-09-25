package modules.main.service {

	import com.gamua.flox.Entity;

	public class SavedData extends Entity {

		private var _testParam:Number = 0;
		
		public function get testParam():Number {
			return _testParam;
		}

		public function set testParam(value:Number):void {
			_testParam = value;
		}

	}
}
