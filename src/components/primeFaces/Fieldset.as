package components.primeFaces
{
	import components.ComponentBase;
	
	import interfaces.IComponent;
	import interfaces.components.IFieldset;
	
	import utils.CodeMxmlUtils;
	import utils.CodeXMLUtils;
	
	public class Fieldset extends ComponentBase implements IFieldset
	{
		public static const PRIME_FACES_XML_ELEMENT_NAME:String = "fieldset";
		public static const ELEMENT_NAME:String = "Fieldset";
		
		private var thisCallbackXML:Function;
		
		private var _isSelected:Boolean;
		public function get isSelected():Boolean
		{
			return _isSelected;
		}
		public function set isSelected(value:Boolean):void
		{
			_isSelected = value;
		}
		
		private var _title:String;
		public function get title():String
		{
			return _title;
		}
		public function set title(value:String):void
		{
			if (_title != value)
			{
				_title = value;
			}
		}
		
		private var _toggleable:Boolean;
		public function get toggleable():Boolean
		{
			return _toggleable;
		}
		public function set toggleable(value:Boolean):void
		{
			if (_toggleable != value)
			{
				_toggleable = value;
			}
		}
		
		private var _duration:Number = 200;
		public function get duration():Number
		{
			return _duration;
		}
		public function set duration(value:Number):void
		{
			if (_duration != value)
			{
				_duration = value;
			}
		}

		/**
		 * Complexity of this component requires separate implementation of this method on client sight
		 */
		public function fromXML(xml:XML, childFromXMLCallback:Function):void
		{
			this.setComponentSize(xml);

			this.title = xml.@legend;
			this.toggleable = xml.@toggleable == "true" ? true : false;
			
			var toggleDuration:Number = Number(xml.@toggleSpeed);
			this.duration = isNaN(toggleDuration) ? 200 : toggleDuration;
			
			thisCallbackXML = childFromXMLCallback;
			createChildren(xml.elements());
		}
		
		/**
		 * Complexity of this component requires separate implementation of this method on client sight
		 */
		public function toCode():XML
		{
			var xml:XML = new XML("<" + CodeMxmlUtils.getMXMLTagNameWithSelection(this, PRIME_FACES_XML_ELEMENT_NAME) + "/>");
			var primeFacesNamespace:Namespace = new Namespace("p", "http://primefaces.org/ui");
			xml.addNamespace(primeFacesNamespace);
			xml.setNamespace(primeFacesNamespace);

            CodeXMLUtils.addSizeHtmlStyleToXML(xml, this);

			xml.@legend = this.title;
			xml.@toggleable = this.toggleable;
			xml.@toggleSpeed = this.duration;
			
			var elementCount:int = this.numElements;
			for(var i:int = 0; i < elementCount; i++)
			{
				var element:IComponent = this.getElementAt(i) as IComponent;
				if(element === null)
				{
					continue;
				}
				
				xml.appendChild(element.toCode());
			}

			return xml;
		}
		
		private function createChildren(elements:XMLList):void
		{
			if ((!elements || elements.length() == 0) && (thisCallbackXML == null)) return;
			
			var divXML:XML = elements[0];
			var childCount:int = divXML.length();
			var item:IComponent = new Div();
			
			for (var itemIndex:int; itemIndex < childCount; itemIndex++)
			{
				var itemXML:XML = divXML[itemIndex];
				item.fromXML(itemXML, thisCallbackXML);
			}
			
			this.addElement(item);
		}
	}
}