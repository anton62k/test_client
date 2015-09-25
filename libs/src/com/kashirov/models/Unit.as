package com.kashirov.models 
{
	import flash.utils.flash_proxy;
	import flash.utils.getDefinitionByName;
	import flash.utils.Proxy;
	import org.osflash.signals.Signal;
	/**
	 * ...
	 * @author 
	 */
	public class Unit extends Proxy implements IModel
	{
		
		private var _signal:Signal;
		private var _changeSignal:Signal;
		private var _diffSignal:Signal;
		
		protected var modelFields:Array;
		protected var modelFieldsObj:Object;
		protected var defaultValues:Object;
		protected var _prefix:String;
		
		public function toString():String
		{
			return '[object ' + Cache.getClassName(this).split('::')[1] + ']';
		}
		
		override flash_proxy function nextNameIndex(index:int):int 
		{
			if (index < modelFields.length) {
				return index + 1;
			} else {
				return 0;
			}
		}
		
		override flash_proxy function nextName (index:int):String
		{
			return modelFields[index - 1];
		}
		
		override flash_proxy function nextValue(index:int):*
		{
			var field:String = modelFields[index - 1];
			return this[field];
		}
		
		public function Unit() 
		{	
			_signal = new Signal(Array);
			_changeSignal = new Signal(IModel, Array);
			_diffSignal = new Signal(IModel, Object);
			parseModelFields();
			prefix = '';
		}
		
		public function updateField(field:String, value:*):void
		{
			if (value != this[field]) {
				parseField(field, value);
				_signal.dispatch([field]);
				_changeSignal.dispatch(this, [field]);
			}
		}
		
		[PreDestroy]
		public function dispose():void
		{
			_signal.removeAll();
			_changeSignal.removeAll();
			_diffSignal.removeAll();
			
			for (var name:String in this) 
			{
				var field:* = this[name];
				
				if (field is Unit || field is Store) {
					field.dispose();
				}
			}
		}

		public function reset():void {
			for (var name:String in this)
			{
				var field:* = this[name];

				if (field is Unit || field is Store) {
					field.reset();
				} else {
					this[name] = defaultValues[name];
				}
			}
		}
		
		public function data(excludeFields:Object = null):Object
		{
			var rt:Object = { };
			
			for (var name:String in this) 
			{
				if (excludeFields && excludeFields[name]) continue;

				var field:* = this[name];
				
				if (field is Unit || field is Store) {
					if (excludeFields && excludeFields[name]) {
						rt[name] = field.data(excludeFields[name]);
					} else {
						rt[name] = field.data();
					}
				} else {
					rt[name] = this[name];
				}
			}
			
			return rt;
		}
		
		public function updateData(data:Object):void
		{
			var fields:Array = [];
			var diff:Object = { };
			
			for (var name:String in data) 
			{
				if (name in modelFieldsObj) {
				
					var field:* = this[name];
					var itemData:Object = data[name];
					
					if (field is Unit) {
						parseBaseModel(field as Unit, itemData);
					} else if (field is Store) {
						(field as Store).updateData(itemData);

					} else {
						if (itemData != this[name]) {
							var oldValue:* = this[name];
							parseField(name, itemData)
							fields.push(name);
							diff[name] = { oldValue: oldValue, value: this[name] };
						}
					}
				
				}
				
			}
			
			if (fields.length) {
				_signal.dispatch(fields);
				_changeSignal.dispatch(this, fields);
				_diffSignal.dispatch(this, diff);
			}
		}
		
		public function init():void
		{
			// override
		}
		
		private function parseModelFields():void 
		{
			modelFields = Cache.getUnitFields(this);
			modelFieldsObj = Cache.getUnitFieldsHash(this);
			defaultValues = {};
			
			for (var name:String in modelFieldsObj) 
			{
				if (!this[name]) {
					var clazz:Class = modelFieldsObj[name];
					this[name] = new clazz();
				}
				
				if (this[name] is Unit) {
					var unit:Unit = this[name] as Unit;
					unit.prefix = name;
				} else if (this[name] is Store) {
					var store:Store = this[name] as Store;
					store.prefix = name;
				} else {
					defaultValues[name] = this[name];
				}
			}
		}
		
		private function parseField(name:String, data:Object):void
		{
			this[name] = data;
		}
		
		private function parseBaseModel(model:Unit, data:Object):void
		{
			model.updateData(data);
		}
		
		public function get prefix():String 
		{
			return _prefix;
		}
		
		public function set prefix(value:String):void 
		{
			_prefix = value;
		}

		public function get prefixInt():int
		{
			return int(_prefix);
		}
		
		public function get signal():Signal 
		{
			return _signal;
		}
		
		public function get changeSignal():Signal 
		{
			return _changeSignal;
		}
		
		public function get diffSignal():Signal 
		{
			return _diffSignal;
		}
	}

}