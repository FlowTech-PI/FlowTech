var express = require("express");
var router = express.Router();

var avisoController = require("../controllers/avisoController");

router.get("/listar", function (req, res) {
    avisoController.listar(req, res);
});

router.get("/listar/:h1/:h2", function (req, res) {
    avisoController.listarPorUsuario(req, res);
});

router.get("/pesquisar/:descricao", function (req, res) {
    avisoController.pesquisarDescricao(req, res);
});

router.post("/publicar/:idUsuario", function (req, res) {
    avisoController.publicar(req, res);
});

router.put("/editar/:idAviso", function (req, res) {
    avisoController.editar(req, res);
});

router.delete("/deletar/:idAviso", function (req, res) {
    avisoController.deletar(req, res);
});

router.get("/plotarSemana", function (req, res) {
    avisoController.plotarSemana(req, res);
});

router.get("/plotarPorSensor", function(req, res) {
    avisoController.plotarPorSensor(req, res);
});

router.get("/plotarPorHorario", function(req, res) {
    avisoController.plotarPorHorario(req, res);
});

router.get("/obterDadosDia", function(req, res) {
    avisoController.obterDadosDia(req, res);
});


router.get("/obterDadosSemana", function(req, res) {
    avisoController.obterDadosSemana(req, res);
});

router.get("/obterDadosMes", function(req, res) {
    avisoController.obterDadosMes(req, res);
});
module.exports = router;