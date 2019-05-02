using falabellaSeguros.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace falabellaSeguros.Controllers
{
    public class VentaController : Controller
    {
        falabella_SegurosContext db = new falabella_SegurosContext();
        // GET: Venta
        public ActionResult Index()
        {
            using (db)
            {
                List<venta> lista = db.venta.ToList();
                return View(lista);
            }
        }

        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(venta v)
        {
            var usuario = System.Web.HttpContext.Current.Session["NombreUsuario"];
            v.venta_AgenteVenta = int.Parse(idAgente(usuario.ToString()));
            DateTime fechaR = new DateTime();
            v.venta_FechaReg = fechaR.ToString("dd/MM/yyyy");
           
            try
            {
                using (db)
                {
                    db.venta.Add(v);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("", "Error al Registrar la Venta - " + ex.Message);
                return View();
            }
        }

        public ActionResult Edit(int id)
        {
            try
            {
                using (db)
                {
                    venta v = db.venta.Find(id);
                    return View(v);

                }
            }
            catch (Exception)
            {

                throw;
            }

        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(venta v)
        {
            try
            {
                var usuario = System.Web.HttpContext.Current.Session["NombreUsuario"];
                v.venta_AgenteVenta = int.Parse(idAgente(usuario.ToString()));
                using (db)
                {
                    venta ve = db.venta.Find(v.venta_Id);
                    ve.venta_NomSolicitante = v.venta_NomSolicitante;
                    ve.venta_ApeSolicitante = v.venta_ApeSolicitante;
                    ve.venta_TipoDocSolicitante = v.venta_TipoDocSolicitante;
                    ve.venta_NumDocSolicitante = v.venta_NumDocSolicitante;
                    ve.venta_Producto = v.venta_Producto;
                    ve.venta_TelSolicitante = v.venta_TelSolicitante;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }

            }
            catch (Exception)
            {

                throw;
            }

        }

        public ActionResult Details(int id)
        {
            try
            {
                using (db)
                {
                    return View(db.venta.Find(id));
                }
            }
            catch (Exception)
            {

                throw;
            }


        }

        public ActionResult Delete(int id)
        {
            try
            {
                using (db)
                {

                    venta v = db.venta.Find(id);
                    db.venta.Remove(v);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        public ActionResult ListaProductos()
        {
            using (db)
            {
                return PartialView(db.producto.ToList());
            }

        }

        public static string NombreProducto(int id)
        {
            using (var db = new falabella_SegurosContext())
            {
                return db.producto.Find(id).producto_Nombre;
            }
        }

        public static string idAgente(string name)
        {
            using (var db = new falabella_SegurosContext())
            {
                var sql = @"select * from usuario where usuario_Nombre Like @Nombre";
                var dr = db.Database.SqlQuery<usuario>(sql, new SqlParameter("@Nombre", name)).ToList();
                return dr[0].usuario_Id.ToString();
            }
        }

        public static string agente()
        {
            var usuario = System.Web.HttpContext.Current.Session["NombreUsuario"];
            return usuario.ToString();

        }
    }
}