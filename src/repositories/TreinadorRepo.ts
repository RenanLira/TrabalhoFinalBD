import { PrismaClient } from "@prisma/client";

export class TreinadorRepo {
    repo = new PrismaClient()


    async create(idade: number, nome: string, tatica: string, equipeId: string) {
        const result = await this.repo.profissional.create({
            data:{
                idade,
                nome,
                equipe: {
                    connect: {
                        id: equipeId
                    }
                },
                treinador: {
                    create: {
                        tatica
                    }
                }

            }
        })

        return result

    }


}