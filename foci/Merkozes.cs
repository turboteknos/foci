using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Metadata.Ecma335;
using System.Text;
using System.Threading.Tasks;

namespace foci
{
    internal class Merkozes
    {
        byte _fordulo, _hGol, _vGol, _hFelido, _vFelido;
        string _hCsapat, _vCsapat;

        public Merkozes(byte fordulo, byte hGol, byte vGol, byte hFelido, byte vFelido, string hCsapat, string vCsapat ) 
        {
            this._fordulo = fordulo;
            this._hGol = hGol;
            this._vGol = vGol;
            this._hFelido = hFelido;
            this._vFelido = vFelido;
            this._hCsapat = hCsapat;
            this._vCsapat = vCsapat;

        }
        public int Fordulo { get{ return _fordulo; } }
        public int Hgol { get{ return _hGol; } }
        public int Vgol { get{ return _vGol; } }
        public int Hfelido { get{ return _hFelido; } }
        public int Vfelido { get{ return _vFelido; } }
        public string Hcsapat { get{ return _hCsapat; } }
        public string Vcsapat { get{ return _vCsapat; } }
        public string KiirMerkozesFormazva()
        {
            return $"{_hCsapat}-{_vCsapat}:{_hGol}-{_vGol} ({_hFelido}-{_vFelido})";

        }

    }
}
