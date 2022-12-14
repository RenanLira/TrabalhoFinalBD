import { CampeonatoModel, criarCampeonatoRequest, inserirEquipeRequest } from "../models/CampeonatoModel";


export class CampeonatoQuery implements CampeonatoModel {
    
    criarCampeonato(request: criarCampeonatoRequest): Promise<void> {
        throw new Error("Method not implemented.");
    }
    
    inserirEquipes(request: inserirEquipeRequest): Promise<void> {
        throw new Error("Method not implemented.");
    }

}