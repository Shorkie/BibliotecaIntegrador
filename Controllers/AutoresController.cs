using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using BibliotecaIntegrador.Models;

namespace BibliotecaIntegrador.Controllers
{
    public class AutoresController : Controller
    {
        private AccentureBibliotecaEntities db = new AccentureBibliotecaEntities();

        // GET: Autores
        public ActionResult Index()
        {
            return View(db.Autores.ToList());
        }

        // GET: Autores/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Autores autores = db.Autores.Find(id);
            if (autores == null)
            {
                return HttpNotFound();
            }
            return View(autores);
        }

        // GET: Autores/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Autores/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Nombre,Contacto")] Autores autores)
        {
            if (ModelState.IsValid)
            {
                db.Autores.Add(autores);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(autores);
        }

        // GET: Autores/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Autores autores = db.Autores.Find(id);
            if (autores == null)
            {
                return HttpNotFound();
            }
            return View(autores);
        }

        // POST: Autores/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Nombre,Contacto")] Autores autores)
        {
            if (ModelState.IsValid)
            {
                db.Entry(autores).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(autores);
        }

        // GET: Autores/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Autores autores = db.Autores.Find(id);
            if (autores == null)
            {
                return HttpNotFound();
            }
            return View(autores);
        }

        // POST: Autores/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Autores autores = db.Autores.Find(id);
            db.Autores.Remove(autores);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        public ActionResult mostrarAutores()
        {
            AccentureBibliotecaEntities ab = new AccentureBibliotecaEntities();
            List<Autores> autores = ab.Autores.OrderBy(g => g.Nombre).ToList();
            return View(autores);
        }


        public ActionResult agregarAutor()
        {
            return View();
        }

        [HttpPost]
        public ActionResult agregarAutor(string nombre, string contacto)
        {
            AccentureBibliotecaEntities ab = new AccentureBibliotecaEntities();
            Autores nuevoAutor = new Autores();
            nuevoAutor.Nombre = nombre;
            nuevoAutor.Contacto = contacto;
            ab.Autores.Add(nuevoAutor);
            ab.SaveChanges();
            return RedirectToAction("mostrarAutores");
        }
    }
}
