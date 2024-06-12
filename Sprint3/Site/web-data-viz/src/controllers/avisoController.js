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

function plotarPorHorario(req, res) {
    console.log("ESTOU NO CONTROLLER DE PLOTAR POR HORARIO")
    avisoModel.plotarPorHorario()
        .then (function (resultado) {
            if (resultado.length == 231) {
                res.json({
                    Luz : {
                        H04:  resultado[ 0].fluxoPorHora,
                        H05:  resultado[ 1].fluxoPorHora,
                        H06:  resultado[ 2].fluxoPorHora,
                        H07:  resultado[ 3].fluxoPorHora,
                        H08:  resultado[ 4].fluxoPorHora,
                        H09:  resultado[ 5].fluxoPorHora,
                        H10:  resultado[ 6].fluxoPorHora,
                        H11:  resultado[ 7].fluxoPorHora,
                        H12:  resultado[ 8].fluxoPorHora,
                        H13:  resultado[ 9].fluxoPorHora,
                        H14:  resultado[10].fluxoPorHora,
                        H15:  resultado[11].fluxoPorHora,
                        H16:  resultado[12].fluxoPorHora,
                        H17:  resultado[13].fluxoPorHora,
                        H18:  resultado[14].fluxoPorHora,
                        H19:  resultado[15].fluxoPorHora,
                        H20:  resultado[16].fluxoPorHora,
                        H21:  resultado[17].fluxoPorHora,
                        H22:  resultado[18].fluxoPorHora,
                        H23:  resultado[19].fluxoPorHora,
                        H00:  resultado[20].fluxoPorHora
                    }, Republica :    {
                        H04:  resultado[21].fluxoPorHora,
                        H05:  resultado[22].fluxoPorHora,
                        H06:  resultado[23].fluxoPorHora,
                        H07:  resultado[24].fluxoPorHora,
                        H08:  resultado[25].fluxoPorHora,
                        H09:  resultado[26].fluxoPorHora,
                        H10:  resultado[27].fluxoPorHora,
                        H11:  resultado[28].fluxoPorHora,
                        H12:  resultado[29].fluxoPorHora,
                        H13:  resultado[30].fluxoPorHora,
                        H14:  resultado[31].fluxoPorHora,
                        H15:  resultado[32].fluxoPorHora,
                        H16:  resultado[33].fluxoPorHora,
                        H17:  resultado[34].fluxoPorHora,
                        H18:  resultado[35].fluxoPorHora,
                        H19:  resultado[36].fluxoPorHora,
                        H20:  resultado[37].fluxoPorHora,
                        H21:  resultado[38].fluxoPorHora,
                        H22:  resultado[39].fluxoPorHora,
                        H23:  resultado[40].fluxoPorHora,
                        H00:  resultado[41].fluxoPorHora
                    }, Higienópolis : {
                        H04:  resultado[42].fluxoPorHora,
                        H05:  resultado[43].fluxoPorHora,
                        H06:  resultado[44].fluxoPorHora,
                        H07:  resultado[45].fluxoPorHora,
                        H08:  resultado[46].fluxoPorHora,
                        H09:  resultado[47].fluxoPorHora,
                        H10:  resultado[48].fluxoPorHora,
                        H11:  resultado[49].fluxoPorHora,
                        H12:  resultado[50].fluxoPorHora,
                        H13:  resultado[51].fluxoPorHora,
                        H14:  resultado[52].fluxoPorHora,
                        H15:  resultado[53].fluxoPorHora,
                        H16:  resultado[54].fluxoPorHora,
                        H17:  resultado[55].fluxoPorHora,
                        H18:  resultado[56].fluxoPorHora,
                        H19:  resultado[57].fluxoPorHora,
                        H20:  resultado[58].fluxoPorHora,
                        H21:  resultado[59].fluxoPorHora,
                        H22:  resultado[60].fluxoPorHora,
                        H23:  resultado[61].fluxoPorHora,
                        H00:  resultado[62].fluxoPorHora                      
                    }, Paulista :     {
                        H04:  resultado[63].fluxoPorHora,
                        H05:  resultado[64].fluxoPorHora,
                        H06:  resultado[65].fluxoPorHora,
                        H07:  resultado[66].fluxoPorHora,
                        H08:  resultado[67].fluxoPorHora,
                        H09:  resultado[68].fluxoPorHora,
                        H10:  resultado[69].fluxoPorHora,
                        H11:  resultado[70].fluxoPorHora,
                        H12:  resultado[71].fluxoPorHora,
                        H13:  resultado[72].fluxoPorHora,
                        H14:  resultado[73].fluxoPorHora,
                        H15:  resultado[74].fluxoPorHora,
                        H16:  resultado[75].fluxoPorHora,
                        H17:  resultado[76].fluxoPorHora,
                        H18:  resultado[77].fluxoPorHora,
                        H19:  resultado[78].fluxoPorHora,
                        H20:  resultado[79].fluxoPorHora,
                        H21:  resultado[80].fluxoPorHora,
                        H22:  resultado[81].fluxoPorHora,
                        H23:  resultado[82].fluxoPorHora,
                        H00:  resultado[83].fluxoPorHora     
                    }, Oscar_Freire : {
                        H04:  resultado[84].fluxoPorHora,
                        H05:  resultado[85].fluxoPorHora,
                        H06:  resultado[86].fluxoPorHora,
                        H07:  resultado[87].fluxoPorHora,
                        H08:  resultado[88].fluxoPorHora,
                        H09:  resultado[89].fluxoPorHora,
                        H10:  resultado[90].fluxoPorHora,
                        H11:  resultado[91].fluxoPorHora,
                        H12:  resultado[92].fluxoPorHora,
                        H13:  resultado[93].fluxoPorHora,
                        H14:  resultado[94].fluxoPorHora,
                        H15:  resultado[95].fluxoPorHora,
                        H16:  resultado[96].fluxoPorHora,
                        H17:  resultado[97].fluxoPorHora,
                        H18:  resultado[98].fluxoPorHora,
                        H19:  resultado[99].fluxoPorHora,
                        H20:  resultado[100].fluxoPorHora,
                        H21:  resultado[101].fluxoPorHora,
                        H22:  resultado[102].fluxoPorHora,
                        H23:  resultado[103].fluxoPorHora,
                        H00:  resultado[104].fluxoPorHora   
                    }, Fradique_Coutinho : {
                        H04:  resultado[105].fluxoPorHora,
                        H05:  resultado[106].fluxoPorHora,
                        H06:  resultado[107].fluxoPorHora,
                        H07:  resultado[108].fluxoPorHora,
                        H08:  resultado[109].fluxoPorHora,
                        H09:  resultado[110].fluxoPorHora,
                        H10:  resultado[111].fluxoPorHora,
                        H11:  resultado[112].fluxoPorHora,
                        H12:  resultado[113].fluxoPorHora,
                        H13:  resultado[114].fluxoPorHora,
                        H14:  resultado[115].fluxoPorHora,
                        H15:  resultado[116].fluxoPorHora,
                        H16:  resultado[117].fluxoPorHora,
                        H17:  resultado[118].fluxoPorHora,
                        H18:  resultado[119].fluxoPorHora,
                        H19:  resultado[120].fluxoPorHora,
                        H20:  resultado[121].fluxoPorHora,
                        H21:  resultado[122].fluxoPorHora,
                        H22:  resultado[123].fluxoPorHora,
                        H23:  resultado[124].fluxoPorHora,
                        H00:  resultado[125].fluxoPorHora                    
                    }, Faria_Lima : {
                        H04:  resultado[126].fluxoPorHora,
                        H05:  resultado[127].fluxoPorHora,
                        H06:  resultado[128].fluxoPorHora,
                        H07:  resultado[129].fluxoPorHora,
                        H08:  resultado[130].fluxoPorHora,
                        H09:  resultado[131].fluxoPorHora,
                        H10:  resultado[132].fluxoPorHora,
                        H11:  resultado[133].fluxoPorHora,
                        H12:  resultado[134].fluxoPorHora,
                        H13:  resultado[135].fluxoPorHora,
                        H14:  resultado[136].fluxoPorHora,
                        H15:  resultado[137].fluxoPorHora,
                        H16:  resultado[138].fluxoPorHora,
                        H17:  resultado[139].fluxoPorHora,
                        H18:  resultado[140].fluxoPorHora,
                        H19:  resultado[141].fluxoPorHora,
                        H20:  resultado[142].fluxoPorHora,
                        H21:  resultado[143].fluxoPorHora,
                        H22:  resultado[144].fluxoPorHora,
                        H23:  resultado[145].fluxoPorHora,
                        H00:  resultado[146].fluxoPorHora                    
                    }, Pinheiros :  {
                        H04:  resultado[147].fluxoPorHora,
                        H05:  resultado[148].fluxoPorHora,
                        H06:  resultado[149].fluxoPorHora,
                        H07:  resultado[150].fluxoPorHora,
                        H08:  resultado[151].fluxoPorHora,
                        H09:  resultado[152].fluxoPorHora,
                        H10:  resultado[153].fluxoPorHora,
                        H11:  resultado[154].fluxoPorHora,
                        H12:  resultado[155].fluxoPorHora,
                        H13:  resultado[156].fluxoPorHora,
                        H14:  resultado[157].fluxoPorHora,
                        H15:  resultado[158].fluxoPorHora,
                        H16:  resultado[159].fluxoPorHora,
                        H17:  resultado[160].fluxoPorHora,
                        H18:  resultado[161].fluxoPorHora,
                        H19:  resultado[162].fluxoPorHora,
                        H20:  resultado[163].fluxoPorHora,
                        H21:  resultado[164].fluxoPorHora,
                        H22:  resultado[165].fluxoPorHora,
                        H23:  resultado[166].fluxoPorHora,
                        H00:  resultado[167].fluxoPorHora                        
                    }, Butantã: {
                        H04:  resultado[168].fluxoPorHora,
                        H05:  resultado[169].fluxoPorHora,
                        H06:  resultado[170].fluxoPorHora,
                        H07:  resultado[171].fluxoPorHora,
                        H08:  resultado[172].fluxoPorHora,
                        H09:  resultado[173].fluxoPorHora,
                        H10:  resultado[174].fluxoPorHora,
                        H11:  resultado[175].fluxoPorHora,
                        H12:  resultado[176].fluxoPorHora,
                        H13:  resultado[177].fluxoPorHora,
                        H14:  resultado[178].fluxoPorHora,
                        H15:  resultado[179].fluxoPorHora,
                        H16:  resultado[180].fluxoPorHora,
                        H17:  resultado[181].fluxoPorHora,
                        H18:  resultado[182].fluxoPorHora,
                        H19:  resultado[183].fluxoPorHora,
                        H20:  resultado[184].fluxoPorHora,
                        H21:  resultado[185].fluxoPorHora,
                        H22:  resultado[186].fluxoPorHora,
                        H23:  resultado[187].fluxoPorHora,
                        H00:  resultado[188].fluxoPorHora       
                    }, SP_Morumbi : {
                        H04:  resultado[189].fluxoPorHora,
                        H05:  resultado[190].fluxoPorHora,
                        H06:  resultado[191].fluxoPorHora,
                        H07:  resultado[192].fluxoPorHora,
                        H08:  resultado[193].fluxoPorHora,
                        H09:  resultado[194].fluxoPorHora,
                        H10:  resultado[195].fluxoPorHora,
                        H11:  resultado[196].fluxoPorHora,
                        H12:  resultado[197].fluxoPorHora,
                        H13:  resultado[198].fluxoPorHora,
                        H14:  resultado[199].fluxoPorHora,
                        H15:  resultado[200].fluxoPorHora,
                        H16:  resultado[201].fluxoPorHora,
                        H17:  resultado[202].fluxoPorHora,
                        H18:  resultado[203].fluxoPorHora,
                        H19:  resultado[204].fluxoPorHora,
                        H20:  resultado[205].fluxoPorHora,
                        H21:  resultado[206].fluxoPorHora,
                        H22:  resultado[207].fluxoPorHora,
                        H23:  resultado[208].fluxoPorHora,
                        H00:  resultado[209].fluxoPorHora                          
                    }, Vila_Sônia : {
                        H04:  resultado[210].fluxoPorHora,
                        H05:  resultado[211].fluxoPorHora,
                        H06:  resultado[212].fluxoPorHora,
                        H07:  resultado[213].fluxoPorHora,
                        H08:  resultado[214].fluxoPorHora,
                        H09:  resultado[215].fluxoPorHora,
                        H10:  resultado[216].fluxoPorHora,
                        H11:  resultado[217].fluxoPorHora,
                        H12:  resultado[218].fluxoPorHora,
                        H13:  resultado[219].fluxoPorHora,
                        H14:  resultado[220].fluxoPorHora,
                        H15:  resultado[221].fluxoPorHora,
                        H16:  resultado[222].fluxoPorHora,
                        H17:  resultado[223].fluxoPorHora,
                        H18:  resultado[224].fluxoPorHora,
                        H19:  resultado[225].fluxoPorHora,
                        H20:  resultado[226].fluxoPorHora,
                        H21:  resultado[227].fluxoPorHora,
                        H22:  resultado[228].fluxoPorHora,
                        H23:  resultado[229].fluxoPorHora,
                        H00:  resultado[230].fluxoPorHora                      
                    }
                })
            } else if (resultado.length > 231) {
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

function obterDadosDia(req, res) {
    avisoModel.obterDadosDia().then(function (resultado) {
        if (resultado.length > 0) {
            res.json({ 
                    LuzDia : resultado[0],        
                    RepublicaDia : resultado[1],        
                    HigienopolisDia : resultado[2],        
                    PaulistaDia : resultado[3],        
                    OscarFreireDia : resultado[4],        
                    FradiqueDia : resultado[5],        
                    FariaLimaDia : resultado[6],        
                    PinheirosDia : resultado[7],        
                    ButataDia : resultado[8],        
                    MorumbiDia : resultado[9],        
                    VilaSoniaDia : resultado[10],        
                
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

function obterDadosSemana(req, res) {
    avisoModel.obterDadosSemana().then(function (resultado) {
        if (resultado.length > 0) {
            res.json({ 
                    LuzSemana : resultado[0],        
                    RepublicaSemana : resultado[1],        
                    HigienopolisSemana : resultado[2],        
                    PaulistaSemana : resultado[3],        
                    OscarFreireSemana : resultado[4],        
                    FradiqueSemana : resultado[5],        
                    FariaLimaSemana : resultado[6],        
                    PinheirosSemana : resultado[7],        
                    ButataSemana : resultado[8],        
                    MorumbiSemana : resultado[9],        
                    VilaSoniaSemana : resultado[10],        
                
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

function obterDadosMes(req, res) {
    avisoModel.obterDadosMes().then(function (resultado) {
        if (resultado.length > 0) {
            res.json({ 
                    LuzMes : resultado[0],        
                    RepublicaMes : resultado[1],        
                    HigienopolisMes : resultado[2],        
                    PaulistaMes : resultado[3],        
                    OscarFreireMes : resultado[4],        
                    FradiqueMes : resultado[5],        
                    FariaLimaMes : resultado[6],        
                    PinheirosMes : resultado[7],        
                    ButataMes : resultado[8],        
                    MorumbiMes : resultado[9],        
                    VilaSoniaMes : resultado[10],        
                
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

module.exports = {
    listar,
    listarPorUsuario,
    pesquisarDescricao,
    publicar,
    editar,
    deletar,
    plotarSemana,
    plotarPorSensor,
    plotarPorHorario,
    obterDadosDia,
    obterDadosSemana,
    obterDadosMes
}