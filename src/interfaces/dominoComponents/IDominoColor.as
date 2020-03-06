package interfaces.dominoComponents
{
	/**
     * Domino color
     * https://www.ibm.com/support/knowledgecenter/SSVRGU_9.0.1/basic/H_DEFINED_ENTITIES_XML.html
     */
    public interface IDominoColor
	{  
        private var _name:String;
		public function get name():String
		{
			return _name;
		}
		public function set name(value:String):void
		{
			_name = value;
		}

    }
}      