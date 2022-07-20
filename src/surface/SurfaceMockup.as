package surface
{
	import interfaces.IComponentData;
	import interfaces.ILookup;
	import interfaces.IRoyaleComponentConverter;
	import interfaces.ISurface;
	import interfaces.IComponent;
	import interfaces.IVisualComponent;
	import utils.MainTagCodeUtils;
	import interfaces.components.IDiv;


	public class SurfaceMockup implements ISurface, IVisualComponent, IComponent
	{
		private var _elements:Array;
	
		public function SurfaceMockup():void
		{
			_elements = [];	
		}		
		
		private var _width:Number;
		public function get width():Number
		{
			return _width;
		}

		public function set width(value:Number):void
		{
			_width = value;
		}
		
		private var _height:Number;
		public function get height():Number
		{
			return _height;
		}

		public function set height(value:Number):void
		{
			_height = value;
		}
		
		private var _percentWidth:Number;
		public function get percentWidth():Number
		{
			return _percentWidth;
		}

		public function set percentWidth(value:Number):void
		{
			_percentWidth = value;
		}
		
		private var _percentHeight:Number;
		public function get percentHeight():Number
		{
			return _percentHeight;
		}

		public function set percentHeight(value:Number):void
		{
			_percentHeight = value;
		}
		
		public function addItem(item:IComponent):void
		{
			
		}
		
		public function get numElements():int
		{
			if (_elements)
			{
				return _elements.length;	
			}	
			
			return 0;
		}		

		public function addElement(element:Object):void
		{
			_elements.push(element);		
		}
		
		public function getElementAt(index:int):Object
		{
			if (numElements > 0) 
			{
				return _elements[index]
			}
			
			return null;
		}

		public function getComponentData():Array
		{
			var element:Object = this.getElementAt(0);
			var elementCount:int = (element as IVisualComponent).numElements;
			var componentData:Array = [];

			for (var i:int = 0; i < elementCount; i++)
			{
				var item:IComponentData = element.getElementAt(i) as IComponentData;

				if (item === null)
				{
					continue;
				}

				var compData:Object = item.getComponentData();
				componentData.push(compData);
			}

			return componentData;
		}

		public function fromXML(xml:XML, childFromXMLCallback:Function, surface:ISurface, lookup:ILookup):void
		{
			throw new Error("Surface doesn't implement fromXML method!");
		}
		
		public function toCode():XML
		{
			var element:Object = this.getElementAt(0);
			var xml:XML = MainTagCodeUtils.getParentContent("", element as IDiv);
            var mainContainer:XML = MainTagCodeUtils.getMainContainerTag(xml);

			var elementCount:int = (element as IVisualComponent).numElements;
			
			for (var i:int = 0; i < elementCount; i++)
            {
                var item:IComponent = element.getElementAt(i) as IComponent;

                if (item === null)
                {
                        continue;
                }

			    XML.ignoreComments = false;
                var code:XML = item.toCode();
				var commentOnlyXML:XMLList = (code.elements("primeFacesCommentOnlyTag").length() > 0) ?
											  code.elements("primeFacesCommentOnlyTag") : null;
                if (mainContainer)
                {
                    mainContainer.appendChild(!commentOnlyXML ? code : commentOnlyXML.children());
                }
                else
                {
                    xml.appendChild(!commentOnlyXML ? code : commentOnlyXML.children());
                }
            }

			return xml;
		}

		public function toRoyaleConvertCode(data:Object = null):XML
		{
			var element:Object = this.getElementAt(0);
			var xml:XML = MainTagCodeUtils.getRoyaleViewParentContent(element as IComponent, data);

			var jNamespace:Namespace = new Namespace("j", "library://ns.apache.org/royale/jewel");
			var internalContainer:XML = new XML("<VGroup />");
				internalContainer.@includeIn = "contentState";
				internalContainer.setNamespace(jNamespace);

			var editContainer:XML = new XML("<HGroup />");
				editContainer.@percentWidth = "100";
				editContainer.@itemsHorizontalAlign = "itemsRight";
				editContainer.@gap = "2";
				editContainer.setNamespace(jNamespace);
			if (data)
			{
				var editButton:XML = new XML("<Button />");
					editButton.@text = "Edit";
					editButton.@click = "{this.currentState = 'contentState';}";
					editButton.@includeIn = "dataGridState";
					editButton.setNamespace(jNamespace);
				var beads:XML = new XML("<beads/>");
					beads.setNamespace(jNamespace);
				var disabledBead:XML = new XML("<Disabled/>");
					disabledBead.@disabled = "{this." + data.prop[0].propName + " == null}";
					disabledBead.setNamespace(jNamespace);

				beads.appendChild(disabledBead);
				editButton.appendChild(beads);
				editContainer.appendChild(editButton);

				xml.appendChild(editContainer);
			}

			var elementCount:int = (element as IVisualComponent).numElements;
			
			for (var i:int = 0; i < elementCount; i++)
            {
                var item:IRoyaleComponentConverter = element.getElementAt(i) as IRoyaleComponentConverter;

                if (item === null)
                {
					continue;
                }

			    XML.ignoreComments = false;
                var code:XML = (item as IRoyaleComponentConverter).toRoyaleConvertCode();
				internalContainer.appendChild(code);
            }

			xml.appendChild(internalContainer);

			var saveContainer:XML = new XML("<HGroup />");
			saveContainer.@percentWidth = "100";
			saveContainer.@itemsHorizontalAlign = "itemsCenter";
			saveContainer.@gap = "2";
			saveContainer.@includeIn = "contentState";
			saveContainer.setNamespace(jNamespace);

			var saveButton:XML = new XML("<Button />");
			saveButton.@text = "Save";
			saveButton.@click = data ? "{this.currentState = 'dataGridState'; this." + data.prop[0].propName + "Items[this.selectedRowIndex] = this." + data.prop[0].propName + "; this.dg.refreshCurrentDataProvider();}"
									 : "{this.currentState = 'dataGridState';}";
			saveButton.setNamespace(jNamespace);

			var cancelButton:XML = new XML("<Button />");
			cancelButton.@text = "Cancel";
			cancelButton.@click = data ? "{this.currentState = 'dataGridState'; this.selectedRowIndex = -1; this." + data.prop[0].propName + " = null}"
					                   : "{this.currentState = 'dataGridState';}";
			cancelButton.setNamespace(jNamespace);

			saveContainer.appendChild(saveButton);
			saveContainer.appendChild(cancelButton);

			xml.appendChild(saveContainer);

			return xml;
		}

		public function toDominoCode(mainContainer:XML):XML
		{
			
			var elementCount:int = this.numElements;
			
			for (var i:int = 0; i < elementCount; i++)
            {
                var item:IComponent = this.getElementAt(i) as IComponent;

                if (item === null)
                {
                        continue;
                }

			    XML.ignoreComments = false;
                var code:XML = item.toCode();
				var name:String = code.localName();
				
                 mainContainer.appendChild(code);
            }

			return mainContainer;
		}

		
	}
}