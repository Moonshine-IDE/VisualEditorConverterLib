package components
{
	import interfaces.IDominoVisualHideOption;

	public class DominoConponentHideBase extends ComponentBase implements IDominoVisualHideOption
	{

        private var _hide:String;
        public function get hide():String
        {
           return  _hide;
        }
        public function set hide(value:String):void
        {
            this._hide =value;
        }
        // private var _noteshide:String;
        // public function get noteshide():String
        // {
        //    return  _noteshide;
        // }
        // public function set noteshide(value:String):void
        // {
        //     this._noteshide =value;
        // }

        // private var _browserhide:String;
        // public function get browserhide():String
        // {
        //     return _browserhide;
        // }
        // public function set browserhide(value:String):void
        // {
        //     this._browserhide =value;
        // }

        // private var _mobile:String;
        // public function get mobile():String
        // {
        //     return _mobile;
        // }
        // public function set mobile(value:String):void
        // {
        //     this._mobile =value;
        // }

        // private var _prereadhide:String;
        // public function get prereadhide():String
        // {
        //     return _prereadhide;
        // }
        // public function set prereadhide(value:String):void
        // {
        //     this._prereadhide = value
        // }


        // private var _preedithide:String;
        // public function get preedithide():String
        // {
        //     return _preedithide;
        // }
        // public function set preedithide(value:String):void
        // {
        //     this._preedithide = value
        // }

        // private var _openreadhide:String;
        // public function get openreadhide():String
        // {
        //     return _openreadhide;
        // }
        // public function set openreadhide(value:String):void
        // {
        //     this._openreadhide = value
        // }

        // private var _openedithide:String;
        // public function get openedithide():String
        // {
        //     return _openedithide;
        // }
        // public function set openedithide(value:String):void
        // {
        //     this._openedithide= value;
        // }

        // private var _printhide:String;
        // public function get printhide():String
        // {
        //     return _printhide;
        // }
        // public function set printhide(value:String):void
        // {
        //     this._printhide=value;
        // }


        // private var _copyhide:String;
        // public function get copyhide():String
        // {
        //     return _copyhide;
        // }
        // public function set copyhide(value:String):void
        // {
        //     this._copyhide=value;
        // }

        // private var _embedhide:String;
        // public function get embedhide():String
        // {
        //     return this._embedhide;
        // }
        // public function set embedhide(value:String):void
        // {
        //     this._embedhide=value;
        // }
    }
}