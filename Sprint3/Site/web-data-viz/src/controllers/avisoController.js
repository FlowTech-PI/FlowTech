var avisoModel = require("../models/avisoModel");

function listar(req, res) {
    avisoModel.listar().then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar os avisos: ", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function listarPorUsuario(req, res) {
    var h1 = req.params.h1;
    var h2 = req.params.h2;

   avisoModel.listarPorUsuario(h1, h2)
       .then(
           function (resultado) {
               if (resultado.length > 0) {
                   res.status(200).json(resultado[0]);
               } else {
                   res.status(204).send("Nenhum resultado encontrado!");
               }
           }
       )
       .catch(
           function (erro) {
               console.log(erro);
               console.log(
                   "Houve um erro ao buscar os avisos: ",
                   erro.sqlMessage
               );
               res.status(500).json(erro.sqlMessage);
           }
       );
}

function pesquisarDescricao(req, res) {
    var descricao = req.params.descricao;

    avisoModel.pesquisarDescricao(descricao)
        .then(
            function (resultado) {
                if (resultado.length > 0) {
                    res.status(200).json(resultado);
                } else {
                    res.status(204).send("Nenhum resultado encontrado!");
                }
            }
        ).catch(
            function (erro) {
                console.log(erro);
                console.log("Houve um erro ao buscar os avisos: ", erro.sqlMessage);
                res.status(500).json(erro.sqlMessage);
            }
        );
}

function publicar(req, res) {
    var titulo = req.body.titulo;
    var descricao = req.body.descricao;
    var idUsuario = req.params.idUsuario;

    if (titulo == undefined) {
        res.status(400).send("O título está indefinido!");
    } else if (descricao == undefined) {
        res.status(400).send("A descrição está indefinido!");
    } else if (idUsuario == undefined) {
        res.status(403).send("O id do usuário está indefinido!");
    } else {
        avisoModel.publicar(titulo, descricao, idUsuario)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            )
            .catch(
                function (erro) {
                    console.log(erro);
                    console.log("Houve um erro ao realizar o post: ", erro.sqlMessage);
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}

function editar(req, res) {
    var novaDescricao = req.body.descricao;
    var idAviso = req.params.idAviso;

    avisoModel.editar(novaDescricao, idAviso)
        .then(
            function (resultado) {
                res.json(resultado);
            }
        )
        .catch(
            function (erro) {
                console.log(erro);
                console.log("Houve um erro ao realizar o post: ", erro.sqlMessage);
                res.status(500).json(erro.sqlMessage);
            }
        );

}

function deletar(req, res) {
    var idAviso = req.params.idAviso;

    avisoModel.deletar(idAviso)
        .then(
            function (resultado) {
                res.json(resultado);
            }
        )
        .catch(
            function (erro) {
                console.log(erro);
                console.log("Houve um erro ao deletar o post: ", erro.sqlMessage);
                res.status(500).json(erro.sqlMessage);
            }
        );
}

function plotarSemana(req, res) {
    avisoModel.plotarSemana().then(function (resultado) {
        if (resultado.length > 0) {
            res.json({ 
                    Luz : {
                    domingo: resultado[ 0].fluxoDiaSemana,
                    segunda: resultado[ 1].fluxoDiaSemana,
                    terca:   resultado[ 2].fluxoDiaSemana,
                    quarta:  resultado[ 3].fluxoDiaSemana,
                    quinta:  resultado[ 4].fluxoDiaSemana,
                    sexta:   resultado[ 5].fluxoDiaSemana,
                    sábado:  resultado[ 6].fluxoDiaSemana               
                }, Republica :    {
                    domingo: resultado[ 7].fluxoDiaSemana,
                    segunda: resultado[ 8].fluxoDiaSemana,
                    terca:   resultado[ 9].fluxoDiaSemana,
                    quarta:  resultado[10].fluxoDiaSemana,
                    quinta:  resultado[18].fluxoDiaSemana,
                    sexta:   resultado[19].fluxoDiaSemana,
                    sábado:  resultado[20].fluxoDiaSemana               
                }, Higienópolis : {
                    domingo: resultado[14].fluxoDiaSemana,
                    segunda: resultado[15].fluxoDiaSemana,
                    terca:   resultado[16].fluxoDiaSemana,
                    quarta:  resultado[17].fluxoDiaSemana,
                    quinta:  resultado[18].fluxoDiaSemana,
                    sexta:   resultado[19].fluxoDiaSemana,
                    sábado:  resultado[20].fluxoDiaSemana                
                }, Paulista :     {
                    domingo: resultado[21].fluxoDiaSemana,
                    segunda: resultado[22].fluxoDiaSemana,
                    terca:   resultado[23].fluxoDiaSemana,
                    quarta:  resultado[24].fluxoDiaSemana,
                    quinta:  resultado[25].fluxoDiaSemana,
                    sexta:   resultado[26].fluxoDiaSemana,
                    sábado:  resultado[27].fluxoDiaSemana                
                }, Oscar_Freire : {
                    domingo: resultado[28].fluxoDiaSemana,
                    segunda: resultado[29].fluxoDiaSemana,
                    terca:   resultado[30].fluxoDiaSemana,
                    quarta:  resultado[31].fluxoDiaSemana,
                    quinta:  resultado[32].fluxoDiaSemana,
                    sexta:   resultado[33].fluxoDiaSemana,
                    sábado:  resultado[34].fluxoDiaSemana                
                }, Fradique_Coutinho : {
                    domingo: resultado[35].fluxoDiaSemana,
                    segunda: resultado[36].fluxoDiaSemana,
                    terca:   resultado[37].fluxoDiaSemana,
                    quarta:  resultado[38].fluxoDiaSemana,
                    quinta:  resultado[39].fluxoDiaSemana,
                    sexta:   resultado[40].fluxoDiaSemana,
                    sábado:  resultado[41].fluxoDiaSemana                
                }, Faria_Lima : {
                    domingo: resultado[42].fluxoDiaSemana,
                    segunda: resultado[43].fluxoDiaSemana,
                    terca:   resultado[44].fluxoDiaSemana,
                    quarta:  resultado[45].fluxoDiaSemana,
                    quinta:  resultado[46].fluxoDiaSemana,
                    sexta:   resultado[47].fluxoDiaSemana,
                    sábado:  resultado[48].fluxoDiaSemana                
                }, Pinheiros :  {
                    domingo: resultado[49].fluxoDiaSemana,
                    segunda: resultado[50].fluxoDiaSemana,
                    terca:   resultado[51].fluxoDiaSemana,
                    quarta:  resultado[52].fluxoDiaSemana,
                    quinta:  resultado[53].fluxoDiaSemana,
                    sexta:   resultado[54].fluxoDiaSemana,
                    sábado:  resultado[55].fluxoDiaSemana                
                }, Butantã: {
                    domingo: resultado[56].fluxoDiaSemana,
                    segunda: resultado[57].fluxoDiaSemana,
                    terca:   resultado[58].fluxoDiaSemana,
                    quarta:  resultado[59].fluxoDiaSemana,
                    quinta:  resultado[60].fluxoDiaSemana,
                    sexta:   resultado[61].fluxoDiaSemana,
                    sábado:  resultado[62].fluxoDiaSemana                
                }, SP_Morumbi : {
                    domingo: resultado[63].fluxoDiaSemana,
                    segunda: resultado[64].fluxoDiaSemana,
                    terca:   resultado[65].fluxoDiaSemana,
                    quarta:  resultado[66].fluxoDiaSemana,
                    quinta:  resultado[67].fluxoDiaSemana,
                    sexta:   resultado[68].fluxoDiaSemana,
                    sábado:  resultado[69].fluxoDiaSemana                
                }, Vila_Sônia : {
                    domingo: resultado[70].fluxoDiaSemana,
                    segunda: resultado[71].fluxoDiaSemana,
                    terca:   resultado[72].fluxoDiaSemana,
                    quarta:  resultado[73].fluxoDiaSemana,
                    quinta:  resultado[74].fluxoDiaSemana,
                    sexta:   resultado[75].fluxoDiaSemana,
                    sábado:  resultado[76].fluxoDiaSemana                
                }
            });

        } else {
            res.status(204).send("Nenhum resultado encontrado!")
            
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar os avisos: ", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function plotarPorSensor(req, res) {
    console.log("ESTOU NO CONTROLLER DE PLOTAR POR SENSOR")
    avisoModel.plotarPorSensor()
        .then (function (resultado) {
            if (resultado.length == 66) {
                res.json({
                    Luz : {
                        catracaEntrada:  resultado[ 0].fluxoPorSensor,
                        escadaRolante1:  resultado[ 1].fluxoPorSensor,
                        escadaRolante2:  resultado[ 2].fluxoPorSensor,
                        escadaRolante3:  resultado[ 3].fluxoPorSensor,
                        passarela1:      resultado[ 4].fluxoPorSensor,
                        passarela2:      resultado[ 5].fluxoPorSensor
                    }, Republica :    {
                        catracaEntrada:  resultado[ 6].fluxoPorSensor,
                        escadaRolante1:  resultado[ 7].fluxoPorSensor,
                        escadaRolante2:  resultado[ 8].fluxoPorSensor,
                        escadaRolante3:  resultado[ 9].fluxoPorSensor,
                        passarela1:      resultado[10].fluxoPorSensor,
                        passarela2:      resultado[11].fluxoPorSensor         
                    }, Higienópolis : {
                        catracaEntrada:  resultado[12].fluxoPorSensor,
                        escadaRolante1:  resultado[13].fluxoPorSensor,
                        escadaRolante2:  resultado[14].fluxoPorSensor,
                        escadaRolante3:  resultado[15].fluxoPorSensor,
                        passarela1:      resultado[16].fluxoPorSensor,
                        passarela2:      resultado[17].fluxoPorSensor           
                    }, Paulista :     {
                        catracaEntrada:  resultado[18].fluxoPorSensor,
                        escadaRolante1:  resultado[19].fluxoPorSensor,
                        escadaRolante2:  resultado[20].fluxoPorSensor,
                        escadaRolante3:  resultado[21].fluxoPorSensor,
                        passarela1:      resultado[22].fluxoPorSensor,
                        passarela2:      resultado[23].fluxoPorSensor             
                    }, Oscar_Freire : {
                        catracaEntrada:  resultado[24].fluxoPorSensor,
                        escadaRolante1:  resultado[25].fluxoPorSensor,
                        escadaRolante2:  resultado[26].fluxoPorSensor,
                        escadaRolante3:  resultado[27].fluxoPorSensor,
                        passarela1:      resultado[28].fluxoPorSensor,
                        passarela2:      resultado[29].fluxoPorSensor                    
                    }, Fradique_Coutinho : {
                        catracaEntrada:  resultado[30].fluxoPorSensor,
                        escadaRolante1:  resultado[31].fluxoPorSensor,
                        escadaRolante2:  resultado[32].fluxoPorSensor,
                        escadaRolante3:  resultado[33].fluxoPorSensor,
                        passarela1:      resultado[34].fluxoPorSensor,
                        passarela2:      resultado[35].fluxoPorSensor                
                    }, Faria_Lima : {
                        catracaEntrada:  resultado[36].fluxoPorSensor,
                        escadaRolante1:  resultado[37].fluxoPorSensor,
                        escadaRolante2:  resultado[38].fluxoPorSensor,
                        escadaRolante3:  resultado[39].fluxoPorSensor,
                        passarela1:      resultado[40].fluxoPorSensor,
                        passarela2:      resultado[41].fluxoPorSensor                 
                    }, Pinheiros :  {
                        catracaEntrada:  resultado[42].fluxoPorSensor,
                        escadaRolante1:  resultado[43].fluxoPorSensor,
                        escadaRolante2:  resultado[44].fluxoPorSensor,
                        escadaRolante3:  resultado[45].fluxoPorSensor,
                        passarela1:      resultado[46].fluxoPorSensor,
                        passarela2:      resultado[47].fluxoPorSensor                      
                    }, Butantã: {
                        catracaEntrada:  resultado[48].fluxoPorSensor,
                        escadaRolante1:  resultado[49].fluxoPorSensor,
                        escadaRolante2:  resultado[50].fluxoPorSensor,
                        escadaRolante3:  resultado[51].fluxoPorSensor,
                        passarela1:      resultado[52].fluxoPorSensor,
                        passarela2:      resultado[53].fluxoPorSensor               
                    }, SP_Morumbi : {
                        catracaEntrada:  resultado[54].fluxoPorSensor,
                        escadaRolante1:  resultado[55].fluxoPorSensor,
                        escadaRolante2:  resultado[56].fluxoPorSensor,
                        escadaRolante3:  resultado[57].fluxoPorSensor,
                        passarela1:      resultado[58].fluxoPorSensor,
                        passarela2:      resultado[59].fluxoPorSensor                      
                    }, Vila_Sônia : {
                        catracaEntrada:  resultado[60].fluxoPorSensor,
                        escadaRolante1:  resultado[61].fluxoPorSensor,
                        escadaRolante2:  resultado[62].fluxoPorSensor,
                        escadaRolante3:  resultado[63].fluxoPorSensor,
                        passarela1:      resultado[64].fluxoPorSensor,
                        passarela2:      resultado[65].fluxoPorSensor                   
                    }
                })
            } else if (resultado.length > 66) {
                console.log("Foram encontrados mais campos que o esperado");
            } else {
                console.log("Foram encontrados menos campos que o esperado");
            }
        }).catch(function(erro){
            console.log(erro);
            console.log("Houve um erro ao buscar os avisos: ", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        })
}

module.exports = {
    listar,
    listarPorUsuario,
    pesquisarDescricao,
    publicar,
    editar,
    deletar,
    plotarSemana,
    plotarPorSensor
}