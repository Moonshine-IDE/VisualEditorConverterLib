package components.domino
{
	import components.ComponentBase;

	import interfaces.dominoComponents.IDominoInputText;

	import utils.CodeMxmlUtils;
	import utils.CodeXMLUtils;
	import utils.StringHelperUtils;

	/** 
	 * Domino filed element dxl format , more details please view follow url
	 * https://www.ibm.com/support/knowledgecenter/en/SSVRGU_9.0.1/basic/H_FIELD_ELEMENT_XML.html
	*/

	public class DominoInputText extends ComponentBase implements IDominoInputText
	{
		public static const DOMINO_ELEMENT_NAME:String = "field";
        public static const ELEMENT_NAME:String = "Field";

		public function DominoInputText()
		{
			super();
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
		
		private var _text:String;
		public function get text():String
		{
			return _text;
		}

		public function set text(value:String):void
		{
			_text = value;
		}
		
		private var _maxLength:String;
		public function get maxLength():String
		{
			return _maxLength;
		}

		public function set maxLength(value:String):void
		{
			_maxLength = value;
		}
		
		private var _idAttribute:String;
		public function get idAttribute():String
		{
			return _idAttribute;
		}

		public function set idAttribute(value:String):void
		{
			_idAttribute = value;
		}


		private var _nameAttribute:String;
		public function get nameAttribute():String
		{
			return _nameAttribute;
		}
		public function set nameAttribute(value:String):void
		{
			_nameAttribute = value;
		}
		
		private var _required:Boolean;
		public function get required():Boolean
		{
			return _required;
		}

		public function set required(value:Boolean):void
		{
			_required = value;
		}

		private var _allowmultivalues:Boolean;
		public function get allowmultivalues():Boolean
		{
			return _allowmultivalues;
		}
		public function set allowmultivalues(value:Boolean):void
		{
			_allowmultivalues = value;
		}


		private var _width:Number;
		override public function get width():Number
		{
			return _width;
		}
		override public function set width(value:Number):void
		{
			_width = value;
		}

		private var _height:Number;
		override public function get height():Number
		{
			return _height;
		}
		override public function set height(value:Number):void
		{
			_height = value;
		}

		private var _type:String;
		public function get type():String
		{
			return _type;
		}
		public function set type(value:String):void
		{
			_type = value;
		}

		private var _kind:String;
		public function get kind():String
		{
			return _kind;
		}
		public function set kind(value:String):void
		{
			_kind = value;
		}
		
		public function fromXML(xml:XML, childFromXMLCallback:Function):void
		{
			this.setComponentSize(xml);
			
			this.text = xml.@value;
			this.maxLength = xml.@maxlength;
            this.idAttribute = xml.@id;
            this.required = xml.@required == "true";
			this.nameAttribute = xml.@name;
			this.width=xml.@width;
			this.height=xml.@height;
			this.allowmultivalues=xml.@allowmultivalues == "true";
			this.type=xml.@type;
			this.kind=xml.@kind;
		}
		
		public function toCode():XML
		{
			
			//for domino input field element must contain into par node
			var par_xml:XML = new XML("<par/>");
			var xml:XML = new XML("<" + CodeMxmlUtils.getMXMLTagNameWithSelection(this, DOMINO_ELEMENT_NAME) + "/>");
            // var primeFacesNamespace:Namespace = new Namespace("p", "http://primefaces.org/ui");
            // xml.addNamespace(primeFacesNamespace);
            // xml.setNamespace(primeFacesNamespace);

			//CodeXMLUtils.addSizeHtmlStyleToXML(xml, this);
			
			if (this.text)
            {
                xml.@value = this.text;
            }

			//for now ,just default to text
			if(this.type){
				 xml.@type = this.type;
			}


			if(this.kind){
				 xml.@kind = this.kind;
			}
           
			//for now ,just default to false,only input text
			if(this.allowmultivalues){
				xml.@allowmultivalues=this.allowmultivalues;
			}
			
			if(this.width){
				xml.@width=this.width;
			}
			if(this.height){
				xml.@height=this.height;
			}
		

			xml.@bgcolor="#ffffff";

            if (this.idAttribute)
            {
                xml.@id = this.idAttribute;
				//xml.@name = this.idAttribute;
            }

			if(this.nameAttribute)
			{
				xml.@name = this.nameAttribute;
			}

			par_xml.appendChild(xml);

            return par_xml;
		}
	}
}