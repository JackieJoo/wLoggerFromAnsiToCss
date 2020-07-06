(function _FromAnsiToCss_s_() {

'use strict';

/**
 * Class to transform ANSI-styled input into CSS-styled output supported by the browser's console.
  @module Tools/base/printer/FromAnsiToCss
*/

if( typeof module !== 'undefined' )
{

  let _ = require( '../../../../../dwtools/Tools.s' );

  _.include( 'wLogger' );
  _.include( 'wFiles' );

  let AnsiColor = require( 'ansicolor' );
  let HasAnsi = require( 'has-ansi' );

  /* qqq : removed this dependencies */

}

//

let _global = _global_;
let _ = _global_.wTools;
let Parent = _.Logger;
let Self = function wLoggerFromAnsiToCss( o )
{
  return _.workpiece.construct( Self, this, arguments );
}

Self.shortName = 'LoggerFromAnsiToCss';

//

function init( o )
{
  let self = this;

  Parent.prototype.init.call( self,o );

  AnsiColor.rgb = ColorsMap;
}

//

function _transformEnd( o )
{
  let self = this;

  _.assert( arguments.length === 1, 'Expects single argument' );

  debugger

  o = Parent.prototype._transformEnd.call( self, o );

  if( !o )
  return;

  _.assert( _.arrayIs( o.outputForTerminal ) );
  _.assert( o.outputForTerminal.length === 1 );

  if( HasAnsi( o.outputForTerminal[ 0 ] ) )
  {
    o.ansiOutputParsed = AnsiColor.parse( o.outputForTerminal[ 0 ] );
    o.outputForTerminal = o.ansiOutputParsed.asChromeConsoleLogArguments;
  }

  /*  */

  return o;
}

//

let ColorsMap =
{
    black:        [0,     0,   0],
    darkGray:     [100, 100, 100],
    lightGray:    [200, 200, 200],
    white:        [255, 255, 255],

    red:          [255,   0,   0],
    lightRed:     [255,  51,   0],

    green:        [0,   255,   0],
    lightGreen:   [51,  204,  51],

    yellow:       [255, 153,  51],
    lightYellow:  [255, 255,  0],

    blue:         [0,     0, 255],
    lightBlue:    [26,  140, 255],

    magenta:      [204,   0, 204],
    lightMagenta: [255,   0, 255],

    cyan:         [0,   204, 255],
    lightCyan:    [0,   255, 255],
}

// --
// relations
// --

let Composes =
{
}

let Aggregates =
{
}

let Associates =
{
}

// --
// prototype
// --

let Proto =
{

  init,

  _transformEnd,

  // relations

  Composes,
  Aggregates,
  Associates,

}

//

_.classDeclare
({
  cls : Self,
  parent : Parent,
  extend : Proto,
});

_global_[ Self.name ] = _[ Self.shortName ] = Self;

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = Self;

})();