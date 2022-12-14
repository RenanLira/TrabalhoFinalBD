import { Dispulta, PrismaClient } from "@prisma/client";

export class CampeonatoRepo {

    private repo = new PrismaClient()


    async create(nome: string) {

        const result = await this.repo.campeonato.create({
            data: {
                nome
            }
        })

        return result

    }

    async inserirEquipe(idCampeonato: string, idEquipe: string) {
        const dispultaDisponivel = await this.repo.dispulta.findFirst({
            where:{
                limiteEquipes: {
                    gt: 0
                }
            }
        })

        if (!dispultaDisponivel) {
            const novaDispulta = await this.repo.dispulta.create({
                data:{
                    campeonatoId: idCampeonato,
                    confronto: {
                        connect: {
                            id: idEquipe
                        }
                    },
                    limiteEquipes: 1
                }
            })
        }
        
        else {
            await this.repo.dispulta.update({
                data: {
                    confronto: {
                        connect: {
                            id: idEquipe
                        }
                    },
                    limiteEquipes: dispultaDisponivel.limiteEquipes - 1
                },
                where:{
                    id: dispultaDisponivel.id
                }
            })

        }




    }


}