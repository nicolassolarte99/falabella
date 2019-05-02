using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace falabellaSeguros.Models
{
    public class UsuarioCE
    {
        public string usuario_Nombre { get; set; }
        public string usuario_Correo { get; set; }
        public string usuario_Pwd { get; set; }
    }
    [MetadataType(typeof(UsuarioCE))]
    public partial class usuario
    {
        public int Estado { get; set; }
    }
}