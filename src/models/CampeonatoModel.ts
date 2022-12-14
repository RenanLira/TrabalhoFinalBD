import { Campeonato, Equipe } from "@prisma/client";
import { CampeonatoRepo } from "../repositories/CampeonatoRepo";


export interface criarCampeonatoRequest {
    nome: string
}

export interface inserirEquipeRequest {
    idEquipe: string,
    idCampeonato: string
}

export abstract class CampeonatoModel {
    
    async criarCampeonato(request: criarCampeonatoRequest): Promise<void> {}

    async inserirEquipes(request: inserirEquipeRequest): Promise<void> {}
    

}