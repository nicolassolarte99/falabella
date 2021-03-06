//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace falabellaSeguros.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public partial class venta
    {
        public int venta_Id { get; set; }
        [Required]
        [Display(Name ="Nombre Cliente")]
        public string venta_NomSolicitante { get; set; }
        [Required]
        [Display(Name = "Apellido Cliente")]
        public string venta_ApeSolicitante { get; set; }
        [Required]
        [Display(Name = "Tipo de Documento Cliente")]
        public string venta_TipoDocSolicitante { get; set; }
        [Required]
        [Display(Name = "Número de documento Cliente")]
        public decimal venta_NumDocSolicitante { get; set; }
        [Required]
        [Display(Name = "Telefono Cliente")]
        public decimal venta_TelSolicitante { get; set; }
        [Display(Name = "Agente de venta")]
        public int venta_AgenteVenta { get; set; }
        [Required]
        [Display(Name = "Producto Cliente")]
        public int venta_Producto { get; set; }
        [Display(Name = "Fecha de Registro")]
        public string venta_FechaReg { get; set; }
    
        public virtual producto producto { get; set; }
        public virtual usuario usuario { get; set; }
    }
}
