import { Equipe, PrismaClient } from "@prisma/client";

export class JogadorRepo {

    repo = new PrismaClient()

    constructor(){}

    async create(idade: number, nome: string, equipeId: string, numeroCamisa: number, posicao: string) {
        const result = await this.repo.profissional.create({
            data: {
                idade,
                nome,
                equipe: {
                    connect: {
                        id: equipeId
                    }
                },
                jogador: {
                    create: {
                        numeroCamisa,
                        posicao,
                    }
                } 
            }
        })

        return result


    }


}