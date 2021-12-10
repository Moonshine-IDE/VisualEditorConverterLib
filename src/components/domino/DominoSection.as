package components.domino
{
    import components.ComponentBase;

	import interfaces.dominoComponents.IDominoSection;
    import utils.CodeMxmlUtils;
	import utils.CodeXMLUtils;
	import utils.StringHelperUtils;
	import interfaces.IComponent;
	import spark.components.Alert;
	import global.domino.DominoGlobals;
    public class DominoSection extends ComponentBase implements IDominoSection
	{
		public static const DOMINO_ELEMENT_NAME:String = "section";
        public static const ELEMENT_NAME:String = "Section";
        
		private var _component:IComponent;
		public function DominoSection(component:IComponent = null)
		{
			super();
			this._component = component;
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
		//------------comenent start------------------
		private var _title:String;
		public function set title(t:String):void
		{
			_title = t;
		}
		public function get title():String
		{
			return _title ;
		}


		private var _titleColor:String;
		public function set titleColor(t:String):void
		{
			_titleColor = t;
		}
		public function get titleColor():String
		{
			return _titleColor ;
		}

		private var _titleFontStyle:String;
		public function set titleFontStyle(t:String):void
		{
			_titleFontStyle = t;
		}
		public function get titleFontStyle():String
		{
			return _titleFontStyle ;
		}


		private var _titleSize:String;
		public function set titleSize(t:String):void
		{
			_titleSize = t;
		}
		public function get titleSize():String
		{
			return _titleSize ;
		}

		//onread,onedit,onpreview,onprint,expanded,
		//showastext,accessfieldkind,accessfieldname

		private var _onread:String;
		public function set onread(t:String):void
		{
			_onread = t;
		}
		public function get onread():String
		{
			return _onread ;
		}

		private var _onedit:String;
		public function set onedit(t:String):void
		{
			_onedit = t;
		}
		public function get onedit():String
		{
			return _onedit ;
		}
		

		private var _onpreview:String;
		public function set onpreview(t:String):void
		{
			_onpreview = t;
		}
		public function get onpreview():String
		{
			return _onpreview ;
		}


		private var _onprint:String;
		public function set onprint(t:String):void
		{
			_onprint = t;
		}
		public function get onprint():String
		{
			return _onprint ;
		}


		private var _expanded:Boolean;
		public function set expanded(t:Boolean):void
		{
			_expanded = t;
		}
		public function get expanded():Boolean
		{
			return _expanded ;
		}


		private var _showastext:Boolean;
		public function set showastext(t:Boolean):void
		{
			_showastext = t;
		}
		public function get showastext():Boolean
		{
			return _showastext ;
		}


		private var _accessfieldkind:String;
		public function set accessfieldkind(t:String):void
		{
			_accessfieldkind = t;
		}
		public function get accessfieldkind():String
		{
			return _accessfieldkind ;
		}


		private var _accessfieldname:String;
		public function set accessfieldname(t:String):void
		{
			_accessfieldname = t;
		}
		public function get accessfieldname():String
		{
			return _accessfieldname ;
		}



		private function get component():IComponent
		{
			return _component ? _component : this;
		}
        public function fromXML(xml:XML, childFromXMLCallback:Function):void
		{
			this.setComponentSize(xml);
			this.title=xml.@title;
			this.titleColor=xml.@titleColor;
			this.titleFontStyle=xml.@titleFontStyle;
			this.titleSize=xml.@titleSize;

			//onread,onedit,onpreview,onprint,expanded,
			//showastext,accessfieldkind,accessfieldname
			this.onread=xml.@onread;
			this.onedit=xml.@onedit;
			this.onpreview=xml.@onpreview;
			this.onprint=xml.@onprint;
			this.expanded=xml.@expanded == "true";
			this.showastext=xml.@showastext == "true";
			this.accessfieldkind=xml.@accessfieldkind;
			this.accessfieldname=xml.@accessfieldname;
		
			var elementsXML:XMLList = xml.elements();
            var childCount:int = elementsXML.length();
            for(var i:int = 0; i < childCount; i++)
            {
                var childXML:XML =elementsXML[i];
				//Alert.show("100:"+childXML.@size);
                childFromXMLCallback(component, childXML);
            }

			
		}
	
		
		public function toCode():XML
		{
			
			//for domino input field element must contain into par node
			//var code_string:String=fixSpecailCharacter(this.text)
			var section_xml:XML = new XML("<section/>");
			//onread,onedit,onpreview,onprint,expanded,
			//showastext,accessfieldkind,accessfieldname
			if(this.onread){
			  section_xml.@onread = this.onread
			}
			if(this.onedit){
				section_xml.@onedit = this.onedit
			}

			if(this.onpreview){
				section_xml.@onpreview = this.onpreview
			}
			if(this.expanded){
				section_xml.@expanded = this.expanded
			}else{
				section_xml.@expanded =false
			}
			if(this.showastext){
				section_xml.@showastext = this.showastext
			}else{
				section_xml.@showastext =false
			}

			if(this.accessfieldkind){
				section_xml.@accessfieldkind = this.accessfieldkind
			}
			if(this.accessfieldname){
				section_xml.@accessfieldname = this.accessfieldname
			}

			if(!this.titleSize){
				//this.titleSize="12pt";
			}
			if(!this.titleColor){
				this.titleColor="system"
			}

			if(!this.titleFontStyle){
				this.titleFontStyle="normal"
			}

			if(!this.title){
				this.title="Default Title"
			}
			if(this.titleSize){
				if(this.titleSize.substring(this.titleSize.length-2)!="pt"){
					this.titleSize=this.titleSize+"pt"
				}
			}
			

	/**
		 * <section onread='collapse' onpreview='collapse' onedit='collapse' onprint='collapse'><sectiontitle
 pardef='1' color='teal'><font size='8pt' color='purple' style='bold'/><text
>Common Hidden Fields</text></sectiontitle></section>
		 */

			var section_title_xml_str:String="";
			if(this.titleSize){
				section_title_xml_str=	"<sectiontitle>"+"<font size=\""+this.titleSize+"\" ";
			}else{
				section_title_xml_str=	"<sectiontitle>"+"<font  ";
			}

			

			section_title_xml_str=section_title_xml_str+"  style=\""+this.titleFontStyle+"\" />"+"<text>"+this.title+"</text></sectiontitle>";
			
					
           
			 var section_title_xml:XML =  new XML(section_title_xml_str);
			// section_title_xml.appendChild(section_title_text_str);
			if(this.titleColor){
				section_title_xml.@color=this.titleColor;
			}
			
			section_xml.appendChild(section_title_xml)
				
			var elementCount:int = component["numElements"];
 			//Alert.show("select child count:"+elementCount);
			 for(var i:int = 0; i < elementCount; i++)
            {
                var element:Object = component["getElementAt"](i) ;
                 if(element) {
					 //Alert.show("element:"+element.toString())
				 	var exml:XML=element.toCode();
					if(exml) {
						if(exml.name()=="par"){
							if(exml.@hidewhen && exml.@hidewhen.length()>0 ){
								//we need add pardef for hidewhen formuala
								DominoGlobals.PardefId++;
								var pardeXml:XML=new XML("<pardef id=\""+DominoGlobals.PardefId+"\"  dominotype=\"dominosection\"/>");
								var code_xml:XML = new XML("<code event=\"hidewhen\" />");
								var formula_xml:XML = new XML("<formula>"+exml.@hidewhen+"</formula>");
								code_xml.appendChild(formula_xml);
								pardeXml.appendChild(code_xml);
								section_xml.appendChild(pardeXml);
								exml.@def=DominoGlobals.PardefId;
								
							}if(exml.@dominotype=="computedtext"){

							}else{
							//	exml=exml.children()[0]
								// var exmlNumElements:int = exml["numElements"];
								// if(exmlNumElements>0){
								// 		for (var exmlCount:int = 0; exmlCount < exmlNumElements; exmlCount++){
								// 				var exmlChildElement:Object = exml["getElementAt"](exmlCount);
								// 				//we should check the empty par tag in here
								// 				var exmlChildXml:XML=exmlChildElement.toCode();
								// 				exml.appendChild(exmlChildXml);
								// 		}
								// 		//Alert.show("rowCellXML:"+rowCellXML.toXMLString());
								// }
							}
							
						}

						if(exml.name()=="run"){
							 var par_xml:XML =  new XML("<par/>");
							 exml=par_xml.appendChild(exml);
						}

						section_xml.appendChild(exml);
					}
				 }
            }
				
            return section_xml;
		}


		public function toRoyaleCode():XML
		{
			var tab_xml:XML = new XML("");
			

			return tab_xml;

		}

		
    }
}