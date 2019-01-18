package components.primeFaces
{
	import components.ComponentBase;
	
	import interfaces.IComponent;
	import interfaces.components.IFieldset;
	
	import utils.CodeMxmlUtils;
	import utils.CodeXMLUtils;
	import converter.Converter;
	
	public class Fieldset extends ComponentBase implements IFieldset
	{
		public static const PRIME_FACES_XML_ELEMENT_NAME:String = "fieldset";
		public static const ELEMENT_NAME:String = "Fieldset";
		
		private static const DEFAULT_DURATION:int = 200;
		
		private var _component:IComponent;

		private var thisCallbackXML:Function;
		
		public function Fieldset(component:IComponent = null):void
		{
			super();
			
			_component = component;
		}
		
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
			_title = value;
		}
		
		private var _toggleable:Boolean;
		public function get toggleable():Boolean
		{
			return _toggleable;
		}
		public function set toggleable(value:Boolean):void
		{
			_toggleable = value;
		}
		
		private var _duration:Number = DEFAULT_DURATION;
		public function get duration():Number
		{
			return _duration;
		}
		public function set duration(value:Number):void
		{
			_duration = value;
		}

		private function get component():IComponent
		{
			return _component ? _component : this;
		}
		
		/**
		 * Complexity of this component requires separate implementation of this method on client sight
		 */
		public function fromXML(xml:XML, childFromXMLCallback:Function):void
		{
			this.setComponentSize(xml);

			this.title = xml.@legend;
			this.toggleable = xml.@toggleable == "true" ? true : false;
			
			this.duration = DEFAULT_DURATION;
			
			var togglSpeed:String = String(xml.@toggleSpeed);
			if (this.toggleable && togglSpeed)
			{
				var toggleDuration:Number = Number(xml.@toggleSpeed);
				this.duration = isNaN(toggleDuration) || toggleDuration == 0 ? DEFAULT_DURATION : toggleDuration;
			}
			
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
			
			var elementCount:int = component["numElements"];
			for(var i:int = 0; i < elementCount; i++)
			{
				var element:IComponent = component["getElementAt"](i) as IComponent;
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
			var item:IComponent = null;
			
			if (component["numElements"] > 0)
			{
				item = component["getElementAt"](0);
			}
			else
			{
				item = Converter.getInstance().getNewInstanceOfComponent(Div.ELEMENT_NAME);
			}
			
			for (var itemIndex:int; itemIndex < childCount; itemIndex++)
			{
				var itemXML:XML = divXML[itemIndex];
				item.fromXML(itemXML, thisCallbackXML);
			}
			
			if (component["numElements"] == 0)
			{
				component["addElement"](item);
			}
		}
	}
}