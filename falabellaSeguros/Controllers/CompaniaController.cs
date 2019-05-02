using falabellaSeguros.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace falabellaSeguros.Controllers
{
    public class CompaniaController : Controller
    {
        falabella_SegurosContext db = new falabella_SegurosContext();
        // GET: Compania
        public ActionResult Index()
        {
            try
            {
                using (db)
                {
                    List<compania> lista = db.compania.ToList();

                    return View(lista);
                }
            }
            catch (Exception)
            {
                throw;
            }


        }

        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(compania c)
        {
            if (!ModelState.IsValid)
            {
                return View();
            }

            try
            {
                using (db)
                {
                    db.compania.Add(c);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("", "Error al Registrar Compañia - " + ex.Message);
                return View();
            }
        }

        public ActionResult Edit(int id)
        {
            try
            {
                using (db)
                {
                    compania c = db.compania.Find(id);
                    return View(c);

                }
            }
            catch (Exception)
            {

                throw;
            }

        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(compania c)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return View();
                }
                using (db)
                {
                    compania co = db.compania.Find(c.compania_Id);
                    co.compania_Nombre = c.compania_Nombre;
                    co.compania_Direccion = c.compania_Direccion;
                    co.compania_Telefono = c.compania_Telefono;

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
                    return View(db.compania.Find(id));
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

                    compania c = db.compania.Find(id);
                    db.compania.Remove(c);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        public ActionResult ListaCompanias()
        {
            using (db)
            {
                return PartialView(db.compania.ToList());
            }
                
        }
    }
}