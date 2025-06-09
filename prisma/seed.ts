import { PrismaClient } from '@prisma/client'
import { faker } from '@faker-js/faker/locale/pt_BR'

const prisma = new PrismaClient()

const TOTAL_PACIENTES = 150_000
const TOTAL_MEDICOS = 5_000
const TOTAL_ENFERMEIROS = 10_000
const TOTAL_DEPARTAMENTOS = 10
const TOTAL_SALAS = 50
const TOTAL_PLANOS = 5
const TOTAL_ATENDIMENTOS = 400_000
const TOTAL_EXAMES = 200_000
const TOTAL_MEDICAMENTOS = 200
const TOTAL_PRESCRICOES = 100_000
const TOTAL_PRESC_MED = 50_000

async function main() {
  console.log(`Inserindo ${TOTAL_DEPARTAMENTOS} departamentos...`)
  for (let i = 0; i < TOTAL_DEPARTAMENTOS; i++) {
    await prisma.departamento.create({
      data: {
        id_departamento:,
        nome_departamento: faker.commerce.department(),
        descricao: faker.lorem.sentence(),
        Medicos:,
        Exames,
      },
    })
  }

  console.log(`Inserindo ${TOTAL_PLANOS} planos de saúde...`)
  for (let i = 0; i < TOTAL_PLANOS; i++) {
    await prisma.planoSaude.create({
      data: {
        nome_plano: faker.company.name(),
        codigo_operadora: faker.string.alphanumeric(8),
        id_plano
        Atendimentos
        Exames
        tipo_cobertura: faker.helpers.arrayElement(['Completa', 'Ambulatorial', 'Hospitalar']),
      },
    })
  }

  console.log(`Inserindo ${TOTAL_SALAS} salas...`)
  for (let i = 0; i < TOTAL_SALAS; i++) {
    await prisma.sala.create({
      data: {
        id_sala,
        Atendimentos
        Exames
        numero_sala: faker.number.int({ min: 1, max: 200 }),
        tipo_sala: faker.helpers.arrayElement(['Cirurgia', 'Consulta', 'UTI', 'Observação']),
        andar: faker.number.int({ min: 1, max: 10 }),
      },
    })
  }

  console.log(`Inserindo ${TOTAL_MEDICOS} médicos...`)
  for (let i = 0; i < TOTAL_MEDICOS; i++) {
    await prisma.medico.create({
      data: {
        id_medico
        Atendimentos
        Exames
        Prescricoes
        nome_med: faker.person.fullName(),
        crm: faker.string.alphanumeric(10),
        especialidade: faker.person.jobType(),
        telefone: faker.phone.number(),
        email: faker.internet.email(),
        departamento_id: faker.number.int({ min: 1, max: TOTAL_DEPARTAMENTOS }),
      },
    })
  }

  console.log(`Inserindo ${TOTAL_ENFERMEIROS} enfermeiros...`)
  for (let i = 0; i < TOTAL_ENFERMEIROS; i++) {
    await prisma.enfermeiro.create({
      data: {
        id_enfermeiro
        Atendimentos
        nome_enfermeiro: faker.person.fullName(),
        registro_coren: faker.string.alphanumeric(8),
        turno: faker.helpers.arrayElement(['Manhã', 'Tarde', 'Noite']),
        telefone: faker.phone.number(),
        email: faker.internet.email(),
      },
    })
  }

  console.log(`Inserindo ${TOTAL_PACIENTES} pacientes...`)
  for (let i = 0; i < TOTAL_PACIENTES; i++) {
    await prisma.paciente.create({
      data: {
        id_paciente,
        Atendimentos
        Exames
        Prescricoes
        nome: faker.person.fullName(),
        cpf: faker.string.numeric(11),
        data_nascimento: faker.date.birthdate({ min: 0, max: 100, mode: 'age' }),
        sexo: faker.helpers.arrayElement(['Masculino', 'Feminino']),
        endereco: faker.location.streetAddress(),
        email: faker.internet.email(),
      },
    })
  }

  console.log(`Inserindo ${TOTAL_MEDICAMENTOS} medicamentos...`)
  for (let i = 0; i < TOTAL_MEDICAMENTOS; i++) {
    await prisma.medicamento.create({
      data: {
        id_medicamento,
        nome_comercial: faker.commerce.productName(),
        principio_ativo: faker.science.chemicalElement().name,
        formatacao: faker.helpers.arrayElement(['Comprimido', 'Xarope', 'Injetável']),
        dosagem_padrao: faker.string.alphanumeric(5),
      },
    })
  }

  console.log(`Inserindo ${TOTAL_PRESCRICOES} prescrições...`)
  for (let i = 0; i < TOTAL_PRESCRICOES; i++) {
    await prisma.prescricao.create({
      data: {
        id_prescricao,
        data_emissao: faker.date.past(),
        validade: faker.date.future().toISOString(),
        instrucao: faker.lorem.sentence(),
        paciente_id: faker.number.int({ min: 1, max: TOTAL_PACIENTES }),
        medico_id: faker.number.int({ min: 1, max: TOTAL_MEDICOS }),
      },
    })
  }

  console.log(`Inserindo ${TOTAL_PRESC_MED} prescrições-medicamento...`)
  for (let i = 0; i < TOTAL_PRESC_MED; i++) {
    await prisma.prescricaoMedicamento.create({
      data: {
        id_prescricao_medicamento: faker.string.uuid(),
        id_medicamento: faker.number.int({ min: 1, max: TOTAL_MEDICAMENTOS }),
        id_prescricao: faker.number.int({ min: 1, max: TOTAL_PRESCRICOES }),
      },
    })
  }

  console.log(`Inserindo ${TOTAL_ATENDIMENTOS} atendimentos...`)
  for (let i = 0; i < TOTAL_ATENDIMENTOS; i++) {
    await prisma.atendimento.create({
      data: {
        id_atendimento
        tipo_consulta: faker.helpers.arrayElement(['Consulta', 'Emergência', 'Internação']),
        data_hora: faker.date.recent(),
        paciente_id: faker.number.int({ min: 1, max: TOTAL_PACIENTES }),
        medico_id: faker.number.int({ min: 1, max: TOTAL_MEDICOS }),
        sala_id: faker.number.int({ min: 1, max: TOTAL_SALAS }),
        enfermeiro_id: faker.number.int({ min: 1, max: TOTAL_ENFERMEIROS }),
        plano_id: faker.number.int({ min: 1, max: TOTAL_PLANOS }),
      },
    })
  }

  console.log(`Inserindo ${TOTAL_EXAMES} exames...`)
  for (let i = 0; i < TOTAL_EXAMES; i++) {
    await prisma.exame.create({
      data: {
        nome_exame: faker.science.chemicalElement().name + ' Test',
        descricao: faker.lorem.sentence(),
        data_exame: faker.date.recent(),
        resultado: faker.lorem.paragraph(),
        paciente_id: faker.number.int({ min: 1, max: TOTAL_PACIENTES }),
        medico_id: faker.number.int({ min: 1, max: TOTAL_MEDICOS }),
        departamento_id: faker.number.int({ min: 1, max: TOTAL_DEPARTAMENTOS }),
        sala_id: faker.number.int({ min: 1, max: TOTAL_SALAS }),
        plano_id: faker.number.int({ min: 1, max: TOTAL_PLANOS }),
      },
    })
  }

  console.log('População do banco concluída.')
}

main()
  .then(async () => {
    await prisma.$disconnect()
  })
  .catch(async (e) => {
    console.error(e)
    await prisma.$disconnect()
    process.exit(1)
  })
