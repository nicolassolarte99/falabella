using falabellaSeguros.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace falabellaSeguros.Controllers
{
    public class ProductoController : Controller
    {
        falabella_SegurosContext db = new falabella_SegurosContext();
        // GET: Producto
        public ActionResult Index()
        {
            using (db) {
                List<producto> lista = db.producto.ToList();
                return View(lista);
            }
                
        }

        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(producto p)
        {
            if (!ModelState.IsValid)
            {
                return View();
            }

            try
            {
                using (db)
                {
                    db.producto.Add(p);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("", "Error al Registrar Servicio - " + ex.Message);
                return View();
            }
        }

        public ActionResult Edit(int id)
        {
            try
            {
                using (db)
                {
                    producto p = db.producto.Find(id);
                    return View(p);

                }
            }
            catch (Exception)
            {

                throw;
            }

        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(producto p)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return View();
                }
                using (db)
                {
                    producto pr = db.producto.Find(p.producto_Id);
                    pr.producto_Nombre = p.producto_Nombre;
                    pr.producto_Compania = p.producto_Compania;
                    pr.producto_Tipo = p.producto_Tipo;

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
                    return View(db.producto.Find(id));
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

                    producto p = db.producto.Find(id);
                    db.producto.Remove(p);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        public ActionResult ListaTipos()
        {
            using (db)
            {
                return PartialView(db.tipoProd.ToList());
            }

        }

        public static string NombreCompania(int id)
        {
            using (var db =new falabella_SegurosContext())
            {
                return db.compania.Find(id).compania_Nombre;
            }
        }

        public static string DescTipo(int id)
        {
            using (var db = new falabella_SegurosContext())
            {
                return db.tipoProd.Find(id).tipoProd_Descripcion;
            }
        }
    }
}